//-------------------------------------------------------------------------//
//                                                                         //
//  This benchmark is an OpenCL version of the NPB BT code for multiple    //
//  devices. This OpenCL version is developed by the Center for Manycore   //
//  Programming at Seoul National University and derived from the MPI      //
//  Fortran versions in "NPB3.3-MPI" developed by NAS.                     //
//                                                                         //
//  Permission to use, copy, distribute and modify this software for any   //
//  purpose with or without fee is hereby granted. This software is        //
//  provided "as is" without express or implied warranty.                  //
//                                                                         //
//  Information on NPB 3.3, including the technical report, the original   //
//  specifications, source code, results and information on how to submit  //
//  new results, is available at:                                          //
//                                                                         //
//           http://www.nas.nasa.gov/Software/NPB/                         //
//                                                                         //
//  Send comments or suggestions for this OpenCL version to                //
//  cmp@aces.snu.ac.kr                                                     //
//                                                                         //
//          Center for Manycore Programming                                //
//          School of Computer Science and Engineering                     //
//          Seoul National University                                      //
//          Seoul 151-744, Korea                                           //
//                                                                         //
//          E-mail:  cmp@aces.snu.ac.kr                                    //
//                                                                         //
//-------------------------------------------------------------------------//

//-------------------------------------------------------------------------//
// Authors: Sangmin Seo, Jungwon Kim, Jun Lee, Gangwon Jo, Jeongho Nah,    //
//          and Jaejin Lee                                                 //
//-------------------------------------------------------------------------//

#include "header.h"
#include "work_lhs.h"

static void z_unpack_solve_info(int stage);
static void z_send_solve_info(int stage);
static void z_send_backsub_info(int stage);
static void z_unpack_backsub_info(int stage);
static void z_backsubstitute(int first, int last, int stage);
static void z_solve_cell(int first, int last, int stage);


//---------------------------------------------------------------------
// Performs line solves in Z direction by first factoring
// the block-tridiagonal matrix into an upper triangular matrix, 
// and then performing back substitution to solve for the unknow
// vectors of each line.  
// 
// Make sure we treat elements zero to cell_size in the direction
// of the sweep.
//---------------------------------------------------------------------
void z_solve()
{
  int i, stage;
  int first, last;

  if (timeron) timer_start(t_zsolve);
  //---------------------------------------------------------------------
  // in our terminology stage is the number of the cell in the y-direction
  // i.e. stage = 1 means the start of the line stage=ncells means end
  //---------------------------------------------------------------------
  for (stage = 1; stage <= ncells; stage++) {
    //---------------------------------------------------------------------
    // set last-cell flag
    //---------------------------------------------------------------------
    if (stage == ncells) {
      last = 1;
    } else {
      last = 0;
    }

    if (stage == 1) {
      //---------------------------------------------------------------------
      // This is the first cell, so solve without receiving data
      //---------------------------------------------------------------------
      first = 1;
      // lhsz(c)
      z_solve_cell(first, last, stage-1);
    } else {
      //-------------------------------------------------------------------
      // Not the first cell of this line, so receive info from
      // processor working on preceeding cell
      //-------------------------------------------------------------------
      first = 0;
      if (timeron) timer_start(t_zcomm);
      //---------------------------------------------------------------------
      // overlap computations and communications
      //---------------------------------------------------------------------
      // lhsz(c)
      //---------------------------------------------------------------------
      // wait for completion
      //---------------------------------------------------------------------
      if (timeron) timer_stop(t_zcomm);
      //---------------------------------------------------------------------
      // install C'(kstart+1) and rhs'(kstart+1) to be used in this cell
      //---------------------------------------------------------------------
      z_unpack_solve_info(stage-1);
      z_solve_cell(first, last, stage-1);
    }

    if (last == 0) z_send_solve_info(stage-1);
  }

  for (i = 0; i < num_devices; i++) {
    cl_int ecode = clFinish(cmd_queue[i]);
    clu_CheckError(ecode, "clFinish()");
  }

  //---------------------------------------------------------------------
  // now perform backsubstitution in reverse direction
  //---------------------------------------------------------------------
  for (stage = ncells; stage >= 1; stage--) {
    first = 0;
    last = 0;
    if (stage == 1) first = 1;
    if (stage == ncells) {
      last = 1;
      //---------------------------------------------------------------------
      // last cell, so perform back substitute without waiting
      //---------------------------------------------------------------------
      z_backsubstitute(first, last, stage-1);
    } else {
      if (timeron) timer_start(t_zcomm);
      if (timeron) timer_stop(t_zcomm);
      z_unpack_backsub_info(stage-1);
      z_backsubstitute(first, last, stage-1);
    }
    if (first == 0) z_send_backsub_info(stage-1);
  }

  if (timeron) timer_stop(t_zsolve);
}


//---------------------------------------------------------------------
// unpack C'(-1) and rhs'(-1) for
// all i and j
//---------------------------------------------------------------------
static void z_unpack_solve_info(int stage)
{
  int i, c;
  size_t d0_size, d1_size;
  cl_int ecode;

  int (*slice)[MAXCELLS][3] = (int (*)[MAXCELLS][3])g_slice;

  size_t z_usi_lws[3], z_usi_gws[3], temp;

  d0_size = IMAX;
  d1_size = JMAX;

  z_usi_lws[0] = d0_size < work_item_sizes[0] ?
                 d0_size : work_item_sizes[0];
  temp = max_work_group_size / z_usi_lws[0];
  z_usi_lws[1] = d1_size < temp ? d1_size : temp;
  z_usi_gws[0] = clu_RoundWorkSize(d0_size, z_usi_lws[0]);
  z_usi_gws[1] = clu_RoundWorkSize(d1_size, z_usi_lws[1]);

  for (i = 0; i < num_devices; i++) {
    c = slice[i][stage][2];

    ecode  = clSetKernelArg(k_z_usi[i], 0, sizeof(cl_mem), &m_lhsc[i]);
    ecode |= clSetKernelArg(k_z_usi[i], 1, sizeof(cl_mem), &m_rhs[i]);
    ecode |= clSetKernelArg(k_z_usi[i], 2, sizeof(cl_mem), &m_out_buffer[i]);
    ecode |= clSetKernelArg(k_z_usi[i], 3, sizeof(int), &c);
    clu_CheckError(ecode, "clSetKernelArg()");

    ecode = clEnqueueNDRangeKernel(cmd_queue[i],
                                   k_z_usi[i],
                                   2, NULL,
                                   z_usi_gws,
                                   z_usi_lws,
                                   0, NULL, NULL);
    clu_CheckError(ecode, "clEnqueueNDRangeKernel()");
  }

  CHECK_FINISH();
}


//---------------------------------------------------------------------
// pack up and send C'(kend) and rhs'(kend) for
// all i and j
//---------------------------------------------------------------------
static void z_send_solve_info(int stage)
{
  int i, c;
  int buffer_size;
  size_t d0_size, d1_size;
  cl_int ecode;

  int (*slice)[MAXCELLS][3] = (int (*)[MAXCELLS][3])g_slice;

  size_t z_ssi_lws[3], z_ssi_gws[3], temp;

  d0_size = IMAX;
  d1_size = JMAX;

  z_ssi_lws[0] = d0_size < work_item_sizes[0] ?
                 d0_size : work_item_sizes[0];
  temp = max_work_group_size / z_ssi_lws[0];
  z_ssi_lws[1] = d1_size < temp ? d1_size : temp;
  z_ssi_gws[0] = clu_RoundWorkSize(d0_size, z_ssi_lws[0]);
  z_ssi_gws[1] = clu_RoundWorkSize(d1_size, z_ssi_lws[1]);

  //---------------------------------------------------------------------
  // pack up buffer
  //---------------------------------------------------------------------
  for (i = 0; i < num_devices; i++) {
    c = slice[i][stage][2];

    ecode  = clSetKernelArg(k_z_ssi[i], 0, sizeof(cl_mem), &m_lhsc[i]);
    ecode |= clSetKernelArg(k_z_ssi[i], 1, sizeof(cl_mem), &m_rhs[i]);
    ecode |= clSetKernelArg(k_z_ssi[i], 2, sizeof(cl_mem), &m_in_buffer[i]);
    ecode |= clSetKernelArg(k_z_ssi[i], 3, sizeof(cl_mem), &m_cell_size[i]);
    ecode |= clSetKernelArg(k_z_ssi[i], 4, sizeof(int), &c);
    clu_CheckError(ecode, "clSetKernelArg()");

    ecode = clEnqueueNDRangeKernel(cmd_queue[i],
                                   k_z_ssi[i],
                                   2, NULL,
                                   z_ssi_gws,
                                   z_ssi_lws,
                                   0, NULL, NULL);
    clu_CheckError(ecode, "clEnqueueNDRangeKernel()");
  }

  buffer_size = MAX_CELL_DIM*MAX_CELL_DIM*(BLOCK_SIZE*BLOCK_SIZE+BLOCK_SIZE);

  for (i = 0; i < num_devices; i++) {
    ecode = clFinish(cmd_queue[i]);
    clu_CheckError(ecode, "clFinish()");
  }

  //---------------------------------------------------------------------
  // send buffer 
  //---------------------------------------------------------------------
  if (timeron) timer_start(t_zcomm);
  int dst;
  size_t cb = sizeof(double) * buffer_size;
  for (i = 0; i < num_devices; i++) {
    dst = successor[i][2];
    ecode = clEnqueueCopyBuffer(cmd_queue[dst],
                                m_in_buffer[i],
                                m_out_buffer[dst],
                                0, 0, cb,
                                0, NULL, NULL);
    clu_CheckError(ecode, "clEnqueueCopyBuffer()");
  }
  for (i = 0; i < num_devices; i++) {
    ecode = clFinish(cmd_queue[i]);
    clu_CheckError(ecode, "clFinish()");
  }
  if (timeron) timer_stop(t_zcomm);
}


//---------------------------------------------------------------------
// pack up and send U(jstart) for all i and j
//---------------------------------------------------------------------
static void z_send_backsub_info(int stage)
{
  int i, c;
  int buffer_size;
  size_t d0_size, d1_size;
  cl_int ecode;

  int (*slice)[MAXCELLS][3] = (int (*)[MAXCELLS][3])g_slice;

  size_t z_sbi_lws[3], z_sbi_gws[3], temp;

  d0_size = IMAX;
  d1_size = JMAX;

  z_sbi_lws[0] = d0_size < work_item_sizes[0] ?
                 d0_size : work_item_sizes[0];
  temp = max_work_group_size / z_sbi_lws[0];
  z_sbi_lws[1] = d1_size < temp ? d1_size : temp;
  z_sbi_gws[0] = clu_RoundWorkSize(d0_size, z_sbi_lws[0]);
  z_sbi_gws[1] = clu_RoundWorkSize(d1_size, z_sbi_lws[1]);

  //---------------------------------------------------------------------
  // Send element 0 to previous processor
  //---------------------------------------------------------------------
  for (i = 0; i < num_devices; i++) {
    c = slice[i][stage][2];

    ecode  = clSetKernelArg(k_z_sbi[i], 0, sizeof(cl_mem), &m_rhs[i]);
    ecode |= clSetKernelArg(k_z_sbi[i], 1, sizeof(cl_mem), &m_in_buffer[i]);
    ecode |= clSetKernelArg(k_z_sbi[i], 2, sizeof(int), &c);
    clu_CheckError(ecode, "clSetKernelArg()");

    ecode = clEnqueueNDRangeKernel(cmd_queue[i],
                                   k_z_sbi[i],
                                   2, NULL,
                                   z_sbi_gws,
                                   z_sbi_lws,
                                   0, NULL, NULL);
    clu_CheckError(ecode, "clEnqueueNDRangeKernel()");
  }

  buffer_size = MAX_CELL_DIM*MAX_CELL_DIM*BLOCK_SIZE;

  for (i = 0; i < num_devices; i++) {
    ecode = clFinish(cmd_queue[i]);
    clu_CheckError(ecode, "clFinish()");
  }

  if (timeron) timer_start(t_zcomm);
  int dst;
  size_t cb = sizeof(double) * buffer_size;
  for (i = 0; i < num_devices; i++) {
    dst = predecessor[i][2];
    ecode = clEnqueueCopyBuffer(cmd_queue[dst],
                                m_in_buffer[i],
                                m_out_buffer[dst],
                                0, 0, cb,
                                0, NULL, NULL);
    clu_CheckError(ecode, "clEnqueueCopyBuffer()");
  }
  for (i = 0; i < num_devices; i++) {
    ecode = clFinish(cmd_queue[i]);
    clu_CheckError(ecode, "clFinish()");
  }
  if (timeron) timer_stop(t_zcomm);
}


//---------------------------------------------------------------------
// unpack U(ksize) for all i and j
//---------------------------------------------------------------------
static void z_unpack_backsub_info(int stage)
{
  int i, c;
  size_t d0_size, d1_size;
  cl_int ecode;

  int (*slice)[MAXCELLS][3] = (int (*)[MAXCELLS][3])g_slice;

  size_t z_ubi_lws[3], z_ubi_gws[3], temp;

  d0_size = IMAX;
  d1_size = JMAX;

  z_ubi_lws[0] = d0_size < work_item_sizes[0] ?
                 d0_size : work_item_sizes[0];
  temp = max_work_group_size / z_ubi_lws[0];
  z_ubi_lws[1] = d1_size < temp ? d1_size : temp;
  z_ubi_gws[0] = clu_RoundWorkSize(d0_size, z_ubi_lws[0]);
  z_ubi_gws[1] = clu_RoundWorkSize(d1_size, z_ubi_lws[1]);

  for (i = 0; i < num_devices; i++) {
    c = slice[i][stage][2];

    ecode  = clSetKernelArg(k_z_ubi[i], 0, sizeof(cl_mem),&m_backsub_info[i]);
    ecode |= clSetKernelArg(k_z_ubi[i], 1, sizeof(cl_mem), &m_out_buffer[i]);
    ecode |= clSetKernelArg(k_z_ubi[i], 2, sizeof(int), &c);
    clu_CheckError(ecode, "clSetKernelArg()");

    ecode = clEnqueueNDRangeKernel(cmd_queue[i],
                                   k_z_ubi[i],
                                   2, NULL,
                                   z_ubi_gws,
                                   z_ubi_lws,
                                   0, NULL, NULL);
    clu_CheckError(ecode, "clEnqueueNDRangeKernel()");
  }

  CHECK_FINISH();
}


//---------------------------------------------------------------------
// back solve: if last cell, then generate U(ksize)=rhs(ksize)
// else assume U(ksize) is loaded in un pack backsub_info
// so just use it
// after call u(kstart) will be sent to next cell
//---------------------------------------------------------------------
static void z_backsubstitute(int first, int last, int stage)
{
  int i, c;
  size_t d0_size, d1_size;
  cl_int ecode;

  int (*slice)[MAXCELLS][3] = (int (*)[MAXCELLS][3])g_slice;

  for (i = 0; i < num_devices; i++) {
    c = slice[i][stage][2];

    size_t z_bs_lws[3], z_bs_gws[3], temp;

    d0_size = max_cell_size[i][0];
    d1_size = max_cell_size[i][1];

    z_bs_lws[0] = d0_size < work_item_sizes[0] ? d0_size : work_item_sizes[0];
    temp = max_work_group_size / z_bs_lws[0];
    z_bs_lws[1] = d1_size < temp ? d1_size : temp;
    z_bs_gws[0] = clu_RoundWorkSize(d0_size, z_bs_lws[0]);
    z_bs_gws[1] = clu_RoundWorkSize(d1_size, z_bs_lws[1]);

    ecode  = clSetKernelArg(k_z_bs[i], 0, sizeof(cl_mem), &m_rhs[i]);
    ecode |= clSetKernelArg(k_z_bs[i], 1, sizeof(cl_mem), &m_lhsc[i]);
    ecode |= clSetKernelArg(k_z_bs[i], 2, sizeof(cl_mem), &m_backsub_info[i]);
    ecode |= clSetKernelArg(k_z_bs[i], 3, sizeof(cl_mem), &m_cell_size[i]);
    ecode |= clSetKernelArg(k_z_bs[i], 4, sizeof(cl_mem), &m_start[i]);
    ecode |= clSetKernelArg(k_z_bs[i], 5, sizeof(cl_mem), &m_end[i]);
    ecode |= clSetKernelArg(k_z_bs[i], 6, sizeof(int), &last);
    ecode |= clSetKernelArg(k_z_bs[i], 7, sizeof(int), &c);
    clu_CheckError(ecode, "clSetKernelArg()");

    ecode = clEnqueueNDRangeKernel(cmd_queue[i],
                                   k_z_bs[i],
                                   2, NULL,
                                   z_bs_gws,
                                   z_bs_lws,
                                   0, NULL, NULL);
    clu_CheckError(ecode, "clEnqueueNDRangeKernel()");
  }

  CHECK_FINISH();
}


//---------------------------------------------------------------------
// performs guaussian elimination on this cell.
// 
// assumes that unpacking routines for non-first cells 
// preload C' and rhs' from previous cell.
// 
// assumed send happens outside this routine, but that
// c'(KMAX) and rhs'(KMAX) will be sent to next cell.
//---------------------------------------------------------------------
static void z_solve_cell(int first, int last, int stage)
{
  int i, c;
  size_t d0_size, d1_size;
  cl_int ecode;

  int (*slice)[MAXCELLS][3] = (int (*)[MAXCELLS][3])g_slice;

  for (i = 0; i < num_devices; i++) {
    c = slice[i][stage][2];

    size_t z_sc_lws[3], z_sc_gws[3], temp;

    if (Z_SOLVE_DIM == 2) {
      d0_size = max_cell_size[i][0];
      d1_size = max_cell_size[i][1];

      z_sc_lws[0] = d0_size < work_item_sizes[0] ?
                    d0_size : work_item_sizes[0];
      temp = max_work_group_size / z_sc_lws[0];
      z_sc_lws[1] = d1_size < temp ? d1_size : temp;
      z_sc_gws[0] = clu_RoundWorkSize(d0_size, z_sc_lws[0]);
      z_sc_gws[1] = clu_RoundWorkSize(d1_size, z_sc_lws[1]);
    } else {
      d0_size = max_cell_size[i][1];
      z_sc_lws[0] = 1; //d0_size / max_compute_units;
      z_sc_gws[0] = clu_RoundWorkSize(d0_size, z_sc_lws[0]);
    }

    ecode  = clSetKernelArg(k_z_sc[i], 0, sizeof(cl_mem), &m_qs[i]);
    ecode |= clSetKernelArg(k_z_sc[i], 1, sizeof(cl_mem), &m_u[i]);
    ecode |= clSetKernelArg(k_z_sc[i], 2, sizeof(cl_mem), &m_rhs[i]);
    ecode |= clSetKernelArg(k_z_sc[i], 3, sizeof(cl_mem), &m_lhsc[i]);
    ecode |= clSetKernelArg(k_z_sc[i], 4, sizeof(cl_mem), &m_lhsa[i]);
    ecode |= clSetKernelArg(k_z_sc[i], 5, sizeof(cl_mem), &m_lhsb[i]);
    ecode |= clSetKernelArg(k_z_sc[i], 6, sizeof(cl_mem), &m_fjac[i]);
    ecode |= clSetKernelArg(k_z_sc[i], 7, sizeof(cl_mem), &m_njac[i]);
    ecode |= clSetKernelArg(k_z_sc[i], 8, sizeof(cl_mem), &m_utmp[i]);
    ecode |= clSetKernelArg(k_z_sc[i], 9, sizeof(cl_mem), &m_cell_size[i]);
    ecode |= clSetKernelArg(k_z_sc[i], 10, sizeof(cl_mem), &m_start[i]);
    ecode |= clSetKernelArg(k_z_sc[i], 11, sizeof(cl_mem), &m_end[i]);
    ecode |= clSetKernelArg(k_z_sc[i], 12, sizeof(int), &first);
    ecode |= clSetKernelArg(k_z_sc[i], 13, sizeof(int), &last);
    ecode |= clSetKernelArg(k_z_sc[i], 14, sizeof(int), &c);
    clu_CheckError(ecode, "clSetKernelArg()");

    ecode = clEnqueueNDRangeKernel(cmd_queue[i],
                                   k_z_sc[i],
                                   Z_SOLVE_DIM, NULL,
                                   z_sc_gws,
                                   z_sc_lws,
                                   0, NULL, NULL);
    clu_CheckError(ecode, "clEnqueueNDRangeKernel()");
  }

  CHECK_FINISH();
}

