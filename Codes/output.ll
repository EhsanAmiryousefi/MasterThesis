; ModuleID = 'sourcefile.c'
source_filename = "sourcefile.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%ident_t = type { i32, i32, i32, i32, i8* }
%struct.anon = type { i32*, double, i32*, double*, i64, double*, double*, double*, i32 }
%struct.kmp_task_t_with_privates = type { %struct.kmp_task_t, %struct..kmp_privates.t }
%struct.kmp_task_t = type { i8*, i32 (i32, i8*)*, i32, %union.kmp_cmplrdata_t, %union.kmp_cmplrdata_t }
%union.kmp_cmplrdata_t = type { i32 (i32, i8*)* }
%struct..kmp_privates.t = type { double, double, i32, i32 }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;94;11;;\00"
@2 = private unnamed_addr constant [28 x i8] c";sourcefile.c;main;102;15;;\00"
@3 = private unnamed_addr constant [26 x i8] c";sourcefile.c;main;92;9;;\00"
@.str.2 = private unnamed_addr constant [19 x i8] c"PRIVATE- time: %f\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @randlc(double* %x, double %a) #0 !dbg !9 {
entry:
  %x.addr = alloca double*, align 8
  %a.addr = alloca double, align 8
  %r23 = alloca double, align 8
  %r46 = alloca double, align 8
  %t23 = alloca double, align 8
  %t46 = alloca double, align 8
  %t1 = alloca double, align 8
  %t2 = alloca double, align 8
  %t3 = alloca double, align 8
  %t4 = alloca double, align 8
  %a1 = alloca double, align 8
  %a2 = alloca double, align 8
  %x1 = alloca double, align 8
  %x2 = alloca double, align 8
  %z = alloca double, align 8
  %r = alloca double, align 8
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !13, metadata !14), !dbg !15
  store double %a, double* %a.addr, align 8
  call void @llvm.dbg.declare(metadata double* %a.addr, metadata !16, metadata !14), !dbg !17
  call void @llvm.dbg.declare(metadata double* %r23, metadata !18, metadata !14), !dbg !20
  store double 0x3E80000000000000, double* %r23, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata double* %r46, metadata !21, metadata !14), !dbg !22
  store double 0x3D10000000000000, double* %r46, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata double* %t23, metadata !23, metadata !14), !dbg !24
  store double 8.388608e+06, double* %t23, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata double* %t46, metadata !25, metadata !14), !dbg !26
  store double 0x42D0000000000000, double* %t46, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata double* %t1, metadata !27, metadata !14), !dbg !28
  call void @llvm.dbg.declare(metadata double* %t2, metadata !29, metadata !14), !dbg !30
  call void @llvm.dbg.declare(metadata double* %t3, metadata !31, metadata !14), !dbg !32
  call void @llvm.dbg.declare(metadata double* %t4, metadata !33, metadata !14), !dbg !34
  call void @llvm.dbg.declare(metadata double* %a1, metadata !35, metadata !14), !dbg !36
  call void @llvm.dbg.declare(metadata double* %a2, metadata !37, metadata !14), !dbg !38
  call void @llvm.dbg.declare(metadata double* %x1, metadata !39, metadata !14), !dbg !40
  call void @llvm.dbg.declare(metadata double* %x2, metadata !41, metadata !14), !dbg !42
  call void @llvm.dbg.declare(metadata double* %z, metadata !43, metadata !14), !dbg !44
  call void @llvm.dbg.declare(metadata double* %r, metadata !45, metadata !14), !dbg !46
  %0 = load double, double* %a.addr, align 8, !dbg !47
  %mul = fmul double 0x3E80000000000000, %0, !dbg !48
  store double %mul, double* %t1, align 8, !dbg !49
  %1 = load double, double* %t1, align 8, !dbg !50
  %conv = fptosi double %1 to i32, !dbg !51
  %conv1 = sitofp i32 %conv to double, !dbg !51
  store double %conv1, double* %a1, align 8, !dbg !52
  %2 = load double, double* %a.addr, align 8, !dbg !53
  %3 = load double, double* %a1, align 8, !dbg !54
  %mul2 = fmul double 8.388608e+06, %3, !dbg !55
  %sub = fsub double %2, %mul2, !dbg !56
  store double %sub, double* %a2, align 8, !dbg !57
  %4 = load double*, double** %x.addr, align 8, !dbg !58
  %5 = load double, double* %4, align 8, !dbg !59
  %mul3 = fmul double 0x3E80000000000000, %5, !dbg !60
  store double %mul3, double* %t1, align 8, !dbg !61
  %6 = load double, double* %t1, align 8, !dbg !62
  %conv4 = fptosi double %6 to i32, !dbg !63
  %conv5 = sitofp i32 %conv4 to double, !dbg !63
  store double %conv5, double* %x1, align 8, !dbg !64
  %7 = load double*, double** %x.addr, align 8, !dbg !65
  %8 = load double, double* %7, align 8, !dbg !66
  %9 = load double, double* %x1, align 8, !dbg !67
  %mul6 = fmul double 8.388608e+06, %9, !dbg !68
  %sub7 = fsub double %8, %mul6, !dbg !69
  store double %sub7, double* %x2, align 8, !dbg !70
  %10 = load double, double* %a1, align 8, !dbg !71
  %11 = load double, double* %x2, align 8, !dbg !72
  %mul8 = fmul double %10, %11, !dbg !73
  %12 = load double, double* %a2, align 8, !dbg !74
  %13 = load double, double* %x1, align 8, !dbg !75
  %mul9 = fmul double %12, %13, !dbg !76
  %add = fadd double %mul8, %mul9, !dbg !77
  store double %add, double* %t1, align 8, !dbg !78
  %14 = load double, double* %t1, align 8, !dbg !79
  %mul10 = fmul double 0x3E80000000000000, %14, !dbg !80
  %conv11 = fptosi double %mul10 to i32, !dbg !81
  %conv12 = sitofp i32 %conv11 to double, !dbg !81
  store double %conv12, double* %t2, align 8, !dbg !82
  %15 = load double, double* %t1, align 8, !dbg !83
  %16 = load double, double* %t2, align 8, !dbg !84
  %mul13 = fmul double 8.388608e+06, %16, !dbg !85
  %sub14 = fsub double %15, %mul13, !dbg !86
  store double %sub14, double* %z, align 8, !dbg !87
  %17 = load double, double* %z, align 8, !dbg !88
  %mul15 = fmul double 8.388608e+06, %17, !dbg !89
  %18 = load double, double* %a2, align 8, !dbg !90
  %19 = load double, double* %x2, align 8, !dbg !91
  %mul16 = fmul double %18, %19, !dbg !92
  %add17 = fadd double %mul15, %mul16, !dbg !93
  store double %add17, double* %t3, align 8, !dbg !94
  %20 = load double, double* %t3, align 8, !dbg !95
  %mul18 = fmul double 0x3D10000000000000, %20, !dbg !96
  %conv19 = fptosi double %mul18 to i32, !dbg !97
  %conv20 = sitofp i32 %conv19 to double, !dbg !97
  store double %conv20, double* %t4, align 8, !dbg !98
  %21 = load double, double* %t3, align 8, !dbg !99
  %22 = load double, double* %t4, align 8, !dbg !100
  %mul21 = fmul double 0x42D0000000000000, %22, !dbg !101
  %sub22 = fsub double %21, %mul21, !dbg !102
  %23 = load double*, double** %x.addr, align 8, !dbg !103
  store double %sub22, double* %23, align 8, !dbg !104
  %24 = load double*, double** %x.addr, align 8, !dbg !105
  %25 = load double, double* %24, align 8, !dbg !106
  %mul23 = fmul double 0x3D10000000000000, %25, !dbg !107
  store double %mul23, double* %r, align 8, !dbg !108
  %26 = load double, double* %r, align 8, !dbg !109
  ret double %26, !dbg !110
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @vranlc(i32 %n, double* %x, double %a, double* %y) #0 !dbg !111 {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca double*, align 8
  %a.addr = alloca double, align 8
  %y.addr = alloca double*, align 8
  %r23 = alloca double, align 8
  %r46 = alloca double, align 8
  %t23 = alloca double, align 8
  %t46 = alloca double, align 8
  %t1 = alloca double, align 8
  %t2 = alloca double, align 8
  %t3 = alloca double, align 8
  %t4 = alloca double, align 8
  %a1 = alloca double, align 8
  %a2 = alloca double, align 8
  %x1 = alloca double, align 8
  %x2 = alloca double, align 8
  %z = alloca double, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !114, metadata !14), !dbg !115
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !116, metadata !14), !dbg !117
  store double %a, double* %a.addr, align 8
  call void @llvm.dbg.declare(metadata double* %a.addr, metadata !118, metadata !14), !dbg !119
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !120, metadata !14), !dbg !121
  call void @llvm.dbg.declare(metadata double* %r23, metadata !122, metadata !14), !dbg !123
  store double 0x3E80000000000000, double* %r23, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata double* %r46, metadata !124, metadata !14), !dbg !125
  store double 0x3D10000000000000, double* %r46, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata double* %t23, metadata !126, metadata !14), !dbg !127
  store double 8.388608e+06, double* %t23, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata double* %t46, metadata !128, metadata !14), !dbg !129
  store double 0x42D0000000000000, double* %t46, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata double* %t1, metadata !130, metadata !14), !dbg !131
  call void @llvm.dbg.declare(metadata double* %t2, metadata !132, metadata !14), !dbg !133
  call void @llvm.dbg.declare(metadata double* %t3, metadata !134, metadata !14), !dbg !135
  call void @llvm.dbg.declare(metadata double* %t4, metadata !136, metadata !14), !dbg !137
  call void @llvm.dbg.declare(metadata double* %a1, metadata !138, metadata !14), !dbg !139
  call void @llvm.dbg.declare(metadata double* %a2, metadata !140, metadata !14), !dbg !141
  call void @llvm.dbg.declare(metadata double* %x1, metadata !142, metadata !14), !dbg !143
  call void @llvm.dbg.declare(metadata double* %x2, metadata !144, metadata !14), !dbg !145
  call void @llvm.dbg.declare(metadata double* %z, metadata !146, metadata !14), !dbg !147
  call void @llvm.dbg.declare(metadata i32* %i, metadata !148, metadata !14), !dbg !149
  %0 = load double, double* %a.addr, align 8, !dbg !150
  %mul = fmul double 0x3E80000000000000, %0, !dbg !151
  store double %mul, double* %t1, align 8, !dbg !152
  %1 = load double, double* %t1, align 8, !dbg !153
  %conv = fptosi double %1 to i32, !dbg !154
  %conv1 = sitofp i32 %conv to double, !dbg !154
  store double %conv1, double* %a1, align 8, !dbg !155
  %2 = load double, double* %a.addr, align 8, !dbg !156
  %3 = load double, double* %a1, align 8, !dbg !157
  %mul2 = fmul double 8.388608e+06, %3, !dbg !158
  %sub = fsub double %2, %mul2, !dbg !159
  store double %sub, double* %a2, align 8, !dbg !160
  store i32 0, i32* %i, align 4, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !164
  %5 = load i32, i32* %n.addr, align 4, !dbg !167
  %cmp = icmp slt i32 %4, %5, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %6 = load double*, double** %x.addr, align 8, !dbg !170
  %7 = load double, double* %6, align 8, !dbg !172
  %mul4 = fmul double 0x3E80000000000000, %7, !dbg !173
  store double %mul4, double* %t1, align 8, !dbg !174
  %8 = load double, double* %t1, align 8, !dbg !175
  %conv5 = fptosi double %8 to i32, !dbg !176
  %conv6 = sitofp i32 %conv5 to double, !dbg !176
  store double %conv6, double* %x1, align 8, !dbg !177
  %9 = load double*, double** %x.addr, align 8, !dbg !178
  %10 = load double, double* %9, align 8, !dbg !179
  %11 = load double, double* %x1, align 8, !dbg !180
  %mul7 = fmul double 8.388608e+06, %11, !dbg !181
  %sub8 = fsub double %10, %mul7, !dbg !182
  store double %sub8, double* %x2, align 8, !dbg !183
  %12 = load double, double* %a1, align 8, !dbg !184
  %13 = load double, double* %x2, align 8, !dbg !185
  %mul9 = fmul double %12, %13, !dbg !186
  %14 = load double, double* %a2, align 8, !dbg !187
  %15 = load double, double* %x1, align 8, !dbg !188
  %mul10 = fmul double %14, %15, !dbg !189
  %add = fadd double %mul9, %mul10, !dbg !190
  store double %add, double* %t1, align 8, !dbg !191
  %16 = load double, double* %t1, align 8, !dbg !192
  %mul11 = fmul double 0x3E80000000000000, %16, !dbg !193
  %conv12 = fptosi double %mul11 to i32, !dbg !194
  %conv13 = sitofp i32 %conv12 to double, !dbg !194
  store double %conv13, double* %t2, align 8, !dbg !195
  %17 = load double, double* %t1, align 8, !dbg !196
  %18 = load double, double* %t2, align 8, !dbg !197
  %mul14 = fmul double 8.388608e+06, %18, !dbg !198
  %sub15 = fsub double %17, %mul14, !dbg !199
  store double %sub15, double* %z, align 8, !dbg !200
  %19 = load double, double* %z, align 8, !dbg !201
  %mul16 = fmul double 8.388608e+06, %19, !dbg !202
  %20 = load double, double* %a2, align 8, !dbg !203
  %21 = load double, double* %x2, align 8, !dbg !204
  %mul17 = fmul double %20, %21, !dbg !205
  %add18 = fadd double %mul16, %mul17, !dbg !206
  store double %add18, double* %t3, align 8, !dbg !207
  %22 = load double, double* %t3, align 8, !dbg !208
  %mul19 = fmul double 0x3D10000000000000, %22, !dbg !209
  %conv20 = fptosi double %mul19 to i32, !dbg !210
  %conv21 = sitofp i32 %conv20 to double, !dbg !210
  store double %conv21, double* %t4, align 8, !dbg !211
  %23 = load double, double* %t3, align 8, !dbg !212
  %24 = load double, double* %t4, align 8, !dbg !213
  %mul22 = fmul double 0x42D0000000000000, %24, !dbg !214
  %sub23 = fsub double %23, %mul22, !dbg !215
  %25 = load double*, double** %x.addr, align 8, !dbg !216
  store double %sub23, double* %25, align 8, !dbg !217
  %26 = load double*, double** %x.addr, align 8, !dbg !218
  %27 = load double, double* %26, align 8, !dbg !219
  %mul24 = fmul double 0x3D10000000000000, %27, !dbg !220
  %28 = load i32, i32* %i, align 4, !dbg !221
  %idxprom = sext i32 %28 to i64, !dbg !222
  %29 = load double*, double** %y.addr, align 8, !dbg !222
  %arrayidx = getelementptr inbounds double, double* %29, i64 %idxprom, !dbg !222
  store double %mul24, double* %arrayidx, align 8, !dbg !223
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %for.body
  %30 = load i32, i32* %i, align 4, !dbg !225
  %inc = add nsw i32 %30, 1, !dbg !225
  store i32 %inc, i32* %i, align 4, !dbg !225
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  ret void, !dbg !230
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !231 {
entry:
  %retval = alloca i32, align 4
  %begin = alloca double, align 8
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %i3 = alloca i32, align 4
  %d1 = alloca i32, align 4
  %e1 = alloca i32, align 4
  %e2 = alloca i32, align 4
  %e3 = alloca i32, align 4
  %xx = alloca double, align 8
  %x0 = alloca double, align 8
  %x1 = alloca double, align 8
  %a1 = alloca double, align 8
  %a2 = alloca double, align 8
  %ai = alloca double, align 8
  %x = alloca double, align 8
  %rdummy = alloca double, align 8
  %saved_stack = alloca i8*, align 8
  %a = alloca double, align 8
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  %end = alloca double, align 8
  %time_spent = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata double* %begin, metadata !234, metadata !14), !dbg !235
  %call = call double @omp_get_wtime(), !dbg !236
  store double %call, double* %begin, align 8, !dbg !235
  call void @llvm.dbg.declare(metadata i32* %i1, metadata !237, metadata !14), !dbg !238
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !239, metadata !14), !dbg !240
  call void @llvm.dbg.declare(metadata i32* %i3, metadata !241, metadata !14), !dbg !242
  call void @llvm.dbg.declare(metadata i32* %d1, metadata !243, metadata !14), !dbg !244
  call void @llvm.dbg.declare(metadata i32* %e1, metadata !245, metadata !14), !dbg !246
  call void @llvm.dbg.declare(metadata i32* %e2, metadata !247, metadata !14), !dbg !248
  call void @llvm.dbg.declare(metadata i32* %e3, metadata !249, metadata !14), !dbg !250
  call void @llvm.dbg.declare(metadata double* %xx, metadata !251, metadata !14), !dbg !252
  call void @llvm.dbg.declare(metadata double* %x0, metadata !253, metadata !14), !dbg !254
  call void @llvm.dbg.declare(metadata double* %x1, metadata !255, metadata !14), !dbg !256
  call void @llvm.dbg.declare(metadata double* %a1, metadata !257, metadata !14), !dbg !258
  call void @llvm.dbg.declare(metadata double* %a2, metadata !259, metadata !14), !dbg !260
  call void @llvm.dbg.declare(metadata double* %ai, metadata !261, metadata !14), !dbg !262
  call void @llvm.dbg.declare(metadata double* %x, metadata !263, metadata !14), !dbg !264
  store double 0x41B2B9B0A1000000, double* %x, align 8, !dbg !264
  call void @llvm.dbg.declare(metadata double* %rdummy, metadata !265, metadata !14), !dbg !266
  store double 2.560000e+02, double* %ai, align 8, !dbg !267
  store i32 257, i32* %d1, align 4, !dbg !268
  store i32 257, i32* %e1, align 4, !dbg !269
  store i32 257, i32* %e2, align 4, !dbg !270
  store i32 257, i32* %e3, align 4, !dbg !271
  store double 2.570000e+02, double* %a1, align 8, !dbg !272
  store double 2.570000e+02, double* %a2, align 8, !dbg !273
  store i32 257, i32* %e1, align 4, !dbg !274
  store i32 10, i32* %e2, align 4, !dbg !275
  store i32 10, i32* %d1, align 4, !dbg !276
  store i32 1000, i32* %e3, align 4, !dbg !277
  %2 = load i32, i32* %d1, align 4, !dbg !278
  %3 = zext i32 %2 to i64, !dbg !279
  %4 = call i8* @llvm.stacksave(), !dbg !279
  store i8* %4, i8** %saved_stack, align 8, !dbg !279
  %vla = alloca double, i64 %3, align 16, !dbg !279
  call void @llvm.dbg.declare(metadata double* %vla, metadata !280, metadata !284), !dbg !285
  call void @llvm.dbg.declare(metadata double* %a, metadata !286, metadata !14), !dbg !287
  store double 1.000000e+03, double* %a, align 8, !dbg !287
  %5 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !288
  store i8* getelementptr inbounds ([26 x i8], [26 x i8]* @3, i32 0, i32 0), i8** %5, align 8, !dbg !288
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* %.kmpc_loc.addr, i32 14, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, double*, double*, double*, double*, i32*, i32*, double*, double*, i32*, i32*, double*, i64, double*, double*)* @.omp_outlined. to void (i32*, i32*, ...)*), double* %x0, double* %x, double* %rdummy, double* %ai, i32* %i3, i32* %e3, double* %x1, double* %a2, i32* %e2, i32* %d1, double* %a, i64 %3, double* %vla, double* %a1), !dbg !288
  call void @llvm.dbg.declare(metadata double* %end, metadata !289, metadata !14), !dbg !290
  %call1 = call double @omp_get_wtime(), !dbg !291
  store double %call1, double* %end, align 8, !dbg !290
  call void @llvm.dbg.declare(metadata double* %time_spent, metadata !292, metadata !14), !dbg !293
  %6 = load double, double* %end, align 8, !dbg !294
  %7 = load double, double* %begin, align 8, !dbg !295
  %sub = fsub double %6, %7, !dbg !296
  store double %sub, double* %time_spent, align 8, !dbg !293
  %8 = load double, double* %time_spent, align 8, !dbg !297
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i32 0, i32 0), double %8), !dbg !298
  store i32 0, i32* %retval, align 4, !dbg !299
  %9 = load i8*, i8** %saved_stack, align 8, !dbg !300
  call void @llvm.stackrestore(i8* %9), !dbg !300
  %10 = load i32, i32* %retval, align 4, !dbg !300
  ret i32 %10, !dbg !300
}

declare double @omp_get_wtime() #2

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: nounwind uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., double* dereferenceable(8) %x0, double* dereferenceable(8) %x, double* dereferenceable(8) %rdummy, double* dereferenceable(8) %ai, i32* dereferenceable(4) %i3, i32* dereferenceable(4) %e3, double* dereferenceable(8) %x1, double* dereferenceable(8) %a2, i32* dereferenceable(4) %e2, i32* dereferenceable(4) %d1, double* dereferenceable(8) %a, i64 %vla, double* %z, double* dereferenceable(8) %a1) #0 !dbg !301 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %x0.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %rdummy.addr = alloca double*, align 8
  %ai.addr = alloca double*, align 8
  %i3.addr = alloca i32*, align 8
  %e3.addr = alloca i32*, align 8
  %x1.addr = alloca double*, align 8
  %a2.addr = alloca double*, align 8
  %e2.addr = alloca i32*, align 8
  %d1.addr = alloca i32*, align 8
  %a.addr = alloca double*, align 8
  %vla.addr = alloca i64, align 8
  %z.addr = alloca double*, align 8
  %a1.addr = alloca double*, align 8
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  %agg.captured = alloca %struct.anon, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !311, metadata !14), !dbg !312
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !313, metadata !14), !dbg !312
  store double* %x0, double** %x0.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x0.addr, metadata !314, metadata !14), !dbg !312
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !315, metadata !14), !dbg !312
  store double* %rdummy, double** %rdummy.addr, align 8
  call void @llvm.dbg.declare(metadata double** %rdummy.addr, metadata !316, metadata !14), !dbg !312
  store double* %ai, double** %ai.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ai.addr, metadata !317, metadata !14), !dbg !312
  store i32* %i3, i32** %i3.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i3.addr, metadata !318, metadata !14), !dbg !312
  store i32* %e3, i32** %e3.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %e3.addr, metadata !319, metadata !14), !dbg !312
  store double* %x1, double** %x1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x1.addr, metadata !320, metadata !14), !dbg !312
  store double* %a2, double** %a2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %a2.addr, metadata !321, metadata !14), !dbg !312
  store i32* %e2, i32** %e2.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %e2.addr, metadata !322, metadata !14), !dbg !312
  store i32* %d1, i32** %d1.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %d1.addr, metadata !323, metadata !14), !dbg !312
  store double* %a, double** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double** %a.addr, metadata !324, metadata !14), !dbg !312
  store i64 %vla, i64* %vla.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %vla.addr, metadata !325, metadata !14), !dbg !312
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !326, metadata !14), !dbg !312
  store double* %a1, double** %a1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %a1.addr, metadata !327, metadata !14), !dbg !312
  %2 = load double*, double** %x0.addr, align 8, !dbg !328
  %3 = load double*, double** %x.addr, align 8, !dbg !328
  %4 = load double*, double** %rdummy.addr, align 8, !dbg !328
  %5 = load double*, double** %ai.addr, align 8, !dbg !328
  %6 = load i32*, i32** %i3.addr, align 8, !dbg !328
  %7 = load i32*, i32** %e3.addr, align 8, !dbg !328
  %8 = load double*, double** %x1.addr, align 8, !dbg !328
  %9 = load double*, double** %a2.addr, align 8, !dbg !328
  %10 = load i32*, i32** %e2.addr, align 8, !dbg !328
  %11 = load i32*, i32** %d1.addr, align 8, !dbg !328
  %12 = load double*, double** %a.addr, align 8, !dbg !328
  %13 = load i64, i64* %vla.addr, align 8, !dbg !328
  %14 = load double*, double** %z.addr, align 8, !dbg !328
  %15 = load double*, double** %a1.addr, align 8, !dbg !328
  %16 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !329
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %16, align 8, !dbg !329
  %17 = load i32*, i32** %.global_tid..addr, align 8, !dbg !329
  %18 = load i32, i32* %17, align 4, !dbg !329
  %19 = call i32 @__kmpc_single(%ident_t* %.kmpc_loc.addr, i32 %18), !dbg !329
  %20 = icmp ne i32 %19, 0, !dbg !329
  br i1 %20, label %omp_if.then, label %omp_if.end, !dbg !329

omp_if.then:                                      ; preds = %entry
  store double 0x41B2B9B0A1000000, double* %2, align 8, !dbg !331
  %21 = load double, double* %5, align 8, !dbg !334
  %call = call double @randlc(double* %2, double %21), !dbg !335
  store double %call, double* %4, align 8, !dbg !336
  store i32 1, i32* %6, align 4, !dbg !337
  br label %for.cond, !dbg !339

for.cond:                                         ; preds = %for.inc, %omp_if.then
  %22 = load i32, i32* %6, align 4, !dbg !340
  %23 = load i32, i32* %7, align 4, !dbg !343
  %cmp = icmp slt i32 %22, %23, !dbg !344
  br i1 %cmp, label %for.body, label %for.end, !dbg !345

for.body:                                         ; preds = %for.cond
  %24 = load double, double* %2, align 8, !dbg !346
  store double %24, double* %8, align 8, !dbg !348
  %25 = load double, double* %9, align 8, !dbg !349
  %call1 = call double @randlc(double* %2, double %25), !dbg !350
  store double %call1, double* %4, align 8, !dbg !351
  %26 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 0, !dbg !352
  store i32* %10, i32** %26, align 8, !dbg !352
  %27 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 1, !dbg !352
  %28 = load double, double* %8, align 8, !dbg !353
  store double %28, double* %27, align 8, !dbg !352
  %29 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 2, !dbg !352
  store i32* %11, i32** %29, align 8, !dbg !352
  %30 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 3, !dbg !352
  store double* %12, double** %30, align 8, !dbg !352
  %31 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 4, !dbg !352
  store i64 %13, i64* %31, align 8, !dbg !352
  %32 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 5, !dbg !352
  store double* %14, double** %32, align 8, !dbg !352
  %33 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 6, !dbg !352
  store double* %4, double** %33, align 8, !dbg !352
  %34 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 7, !dbg !352
  store double* %15, double** %34, align 8, !dbg !352
  %35 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 8, !dbg !352
  %36 = load i32, i32* %6, align 4, !dbg !354
  store i32 %36, i32* %35, align 8, !dbg !352
  %37 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !352
  store i8* getelementptr inbounds ([28 x i8], [28 x i8]* @2, i32 0, i32 0), i8** %37, align 8, !dbg !352
  %38 = call i8* @__kmpc_omp_task_alloc(%ident_t* %.kmpc_loc.addr, i32 %18, i32 1, i64 64, i64 72, i32 (i32, i8*)* bitcast (i32 (i32, %struct.kmp_task_t_with_privates*)* @.omp_task_entry. to i32 (i32, i8*)*)), !dbg !352
  %39 = bitcast i8* %38 to %struct.kmp_task_t_with_privates*, !dbg !352
  %40 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %39, i32 0, i32 0, !dbg !352
  %41 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %40, i32 0, i32 0, !dbg !352
  %42 = load i8*, i8** %41, align 8, !dbg !352
  %43 = bitcast %struct.anon* %agg.captured to i8*, !dbg !352
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %42, i8* %43, i64 72, i32 8, i1 false), !dbg !355
  %44 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %39, i32 0, i32 1, !dbg !352
  %45 = bitcast i8* %42 to %struct.anon*, !dbg !352
  %46 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %44, i32 0, i32 1, !dbg !352
  %47 = getelementptr inbounds %struct.anon, %struct.anon* %45, i32 0, i32 1, !dbg !352
  %48 = load double, double* %47, align 8, !dbg !357
  store double %48, double* %46, align 8, !dbg !352
  %49 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %44, i32 0, i32 3, !dbg !352
  %50 = getelementptr inbounds %struct.anon, %struct.anon* %45, i32 0, i32 8, !dbg !352
  %51 = load i32, i32* %50, align 4, !dbg !359
  store i32 %51, i32* %49, align 4, !dbg !352
  %52 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !352
  store i8* getelementptr inbounds ([28 x i8], [28 x i8]* @2, i32 0, i32 0), i8** %52, align 8, !dbg !352
  %53 = call i32 @__kmpc_omp_task(%ident_t* %.kmpc_loc.addr, i32 %18, i8* %38), !dbg !360
  br label %for.inc, !dbg !362

for.inc:                                          ; preds = %for.body
  %54 = load i32, i32* %6, align 4, !dbg !363
  %inc = add nsw i32 %54, 1, !dbg !363
  store i32 %inc, i32* %6, align 4, !dbg !363
  br label %for.cond, !dbg !365, !llvm.loop !366

for.end:                                          ; preds = %for.cond
  call void @__kmpc_end_single(%ident_t* %.kmpc_loc.addr, i32 %18), !dbg !368
  br label %omp_if.end, !dbg !368

omp_if.end:                                       ; preds = %for.end, %entry
  %55 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !369
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %55, align 8, !dbg !369
  call void @__kmpc_barrier(%ident_t* %.kmpc_loc.addr, i32 %18), !dbg !369
  ret void, !dbg !371
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

declare void @__kmpc_end_single(%ident_t*, i32)

declare i32 @__kmpc_single(%ident_t*, i32)

; Function Attrs: alwaysinline nounwind uwtable
define internal void @.omp_task_privates_map.(%struct..kmp_privates.t* noalias, double** noalias, i32** noalias, double** noalias, i32** noalias) #5 {
entry:
  %.addr = alloca %struct..kmp_privates.t*, align 8
  %.addr1 = alloca double**, align 8
  %.addr2 = alloca i32**, align 8
  %.addr3 = alloca double**, align 8
  %.addr4 = alloca i32**, align 8
  store %struct..kmp_privates.t* %0, %struct..kmp_privates.t** %.addr, align 8
  store double** %1, double*** %.addr1, align 8
  store i32** %2, i32*** %.addr2, align 8
  store double** %3, double*** %.addr3, align 8
  store i32** %4, i32*** %.addr4, align 8
  %5 = load %struct..kmp_privates.t*, %struct..kmp_privates.t** %.addr, align 8
  %6 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %5, i32 0, i32 0
  %7 = load double**, double*** %.addr1, align 8
  store double* %6, double** %7, align 8
  %8 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %5, i32 0, i32 1
  %9 = load double**, double*** %.addr3, align 8
  store double* %8, double** %9, align 8
  %10 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %5, i32 0, i32 2
  %11 = load i32**, i32*** %.addr2, align 8
  store i32* %10, i32** %11, align 8
  %12 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %5, i32 0, i32 3
  %13 = load i32**, i32*** %.addr4, align 8
  store i32* %12, i32** %13, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @.omp_task_entry.(i32, %struct.kmp_task_t_with_privates* noalias) #0 {
entry:
  %.global_tid..addr.i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %.global_tid..addr.i, metadata !372, metadata !14), !dbg !386
  %.part_id..addr.i = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %.part_id..addr.i, metadata !387, metadata !14), !dbg !386
  %.privates..addr.i = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %.privates..addr.i, metadata !388, metadata !14), !dbg !386
  %.copy_fn..addr.i = alloca void (i8*, ...)*, align 8
  call void @llvm.dbg.declare(metadata void (i8*, ...)** %.copy_fn..addr.i, metadata !389, metadata !14), !dbg !386
  %.task_t..addr.i = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %.task_t..addr.i, metadata !390, metadata !14), !dbg !386
  %__context.addr.i = alloca %struct.anon*, align 8
  call void @llvm.dbg.declare(metadata %struct.anon** %__context.addr.i, metadata !391, metadata !14), !dbg !386
  %.priv.ptr.addr.i = alloca double*, align 8
  %.priv.ptr.addr1.i = alloca i32*, align 8
  %.firstpriv.ptr.addr.i = alloca double*, align 8
  %.firstpriv.ptr.addr2.i = alloca i32*, align 8
  %.addr = alloca i32, align 4
  %.addr1 = alloca %struct.kmp_task_t_with_privates*, align 8
  store i32 %0, i32* %.addr, align 4
  store %struct.kmp_task_t_with_privates* %1, %struct.kmp_task_t_with_privates** %.addr1, align 8
  %2 = load i32, i32* %.addr, align 4
  %3 = load %struct.kmp_task_t_with_privates*, %struct.kmp_task_t_with_privates** %.addr1, align 8
  %4 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %3, i32 0, i32 0
  %5 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %4, i32 0, i32 2
  %6 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %4, i32 0, i32 0
  %7 = load i8*, i8** %6, align 8
  %8 = bitcast i8* %7 to %struct.anon*
  %9 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %3, i32 0, i32 1
  %10 = bitcast %struct..kmp_privates.t* %9 to i8*
  %11 = bitcast %struct.kmp_task_t_with_privates* %3 to i8*
  store i32 %2, i32* %.global_tid..addr.i, align 4
  store i32* %5, i32** %.part_id..addr.i, align 8
  store i8* %10, i8** %.privates..addr.i, align 8
  store void (i8*, ...)* bitcast (void (%struct..kmp_privates.t*, double**, i32**, double**, i32**)* @.omp_task_privates_map. to void (i8*, ...)*), void (i8*, ...)** %.copy_fn..addr.i, align 8
  store i8* %11, i8** %.task_t..addr.i, align 8
  store %struct.anon* %8, %struct.anon** %__context.addr.i, align 8
  %12 = load %struct.anon*, %struct.anon** %__context.addr.i, align 8, !dbg !392
  %13 = getelementptr inbounds %struct.anon, %struct.anon* %12, i32 0, i32 4, !dbg !392
  %14 = load i64, i64* %13, align 8, !dbg !392
  %15 = load void (i8*, ...)*, void (i8*, ...)** %.copy_fn..addr.i, align 8, !dbg !392
  %16 = load i8*, i8** %.privates..addr.i, align 8, !dbg !392
  call void (i8*, ...) %15(i8* %16, double** %.priv.ptr.addr.i, i32** %.priv.ptr.addr1.i, double** %.firstpriv.ptr.addr.i, i32** %.firstpriv.ptr.addr2.i) #3, !dbg !392
  %17 = load double*, double** %.priv.ptr.addr.i, align 8, !dbg !392
  %18 = load i32*, i32** %.priv.ptr.addr1.i, align 8, !dbg !392
  %19 = load double*, double** %.firstpriv.ptr.addr.i, align 8, !dbg !392
  %20 = load i32*, i32** %.firstpriv.ptr.addr2.i, align 8, !dbg !392
  store i32 1, i32* %18, align 4, !dbg !393
  br label %for.cond.i, !dbg !395

for.cond.i:                                       ; preds = %for.body.i, %entry
  %21 = load i32, i32* %18, align 4, !dbg !396
  %22 = getelementptr inbounds %struct.anon, %struct.anon* %12, i32 0, i32 0, !dbg !399
  %ref.i = load i32*, i32** %22, align 8, !dbg !399
  %23 = load i32, i32* %ref.i, align 4, !dbg !399
  %cmp.i = icmp slt i32 %21, %23, !dbg !400
  br i1 %cmp.i, label %for.body.i, label %.omp_outlined..1.exit, !dbg !401

for.body.i:                                       ; preds = %for.cond.i
  %24 = load double, double* %19, align 8, !dbg !402
  store double %24, double* %17, align 8, !dbg !404
  %25 = getelementptr inbounds %struct.anon, %struct.anon* %12, i32 0, i32 2, !dbg !405
  %ref3.i = load i32*, i32** %25, align 8, !dbg !405
  %26 = load i32, i32* %ref3.i, align 4, !dbg !405
  %27 = getelementptr inbounds %struct.anon, %struct.anon* %12, i32 0, i32 5, !dbg !406
  %ref4.i = load double*, double** %27, align 8, !dbg !406
  call void @vranlc(i32 %26, double* %17, double 1.000000e+03, double* %ref4.i) #3, !dbg !407
  %28 = getelementptr inbounds %struct.anon, %struct.anon* %12, i32 0, i32 7, !dbg !408
  %ref5.i = load double*, double** %28, align 8, !dbg !408
  %29 = load double, double* %ref5.i, align 8, !dbg !408
  %call.i = call double @randlc(double* %19, double %29) #3, !dbg !409
  %30 = getelementptr inbounds %struct.anon, %struct.anon* %12, i32 0, i32 6, !dbg !410
  %ref6.i = load double*, double** %30, align 8, !dbg !410
  store double %call.i, double* %ref6.i, align 8, !dbg !411
  %31 = load i32, i32* %18, align 4, !dbg !412
  %inc.i = add nsw i32 %31, 1, !dbg !412
  store i32 %inc.i, i32* %18, align 4, !dbg !412
  br label %for.cond.i, !dbg !414, !llvm.loop !415

.omp_outlined..1.exit:                            ; preds = %for.cond.i
  ret i32 0
}

declare i8* @__kmpc_omp_task_alloc(%ident_t*, i32, i32, i64, i64, i32 (i32, i8*)*)

declare i32 @__kmpc_omp_task(%ident_t*, i32, i8*)

declare void @__kmpc_barrier(%ident_t*, i32)

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { alwaysinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.1 (tags/RELEASE_391/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "sourcefile.c", directory: "/home/amiryousefi/MasterThesis/Codes")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
!9 = distinct !DISubprogram(name: "randlc", scope: !1, file: !1, line: 4, type: !10, isLocal: false, isDefinition: true, scopeLine: 5, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!5, !12, !5}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!13 = !DILocalVariable(name: "x", arg: 1, scope: !9, file: !1, line: 4, type: !12)
!14 = !DIExpression()
!15 = !DILocation(line: 4, column: 24, scope: !9)
!16 = !DILocalVariable(name: "a", arg: 2, scope: !9, file: !1, line: 4, type: !5)
!17 = !DILocation(line: 4, column: 34, scope: !9)
!18 = !DILocalVariable(name: "r23", scope: !9, file: !1, line: 7, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!20 = !DILocation(line: 7, column: 16, scope: !9)
!21 = !DILocalVariable(name: "r46", scope: !9, file: !1, line: 8, type: !19)
!22 = !DILocation(line: 8, column: 16, scope: !9)
!23 = !DILocalVariable(name: "t23", scope: !9, file: !1, line: 9, type: !19)
!24 = !DILocation(line: 9, column: 16, scope: !9)
!25 = !DILocalVariable(name: "t46", scope: !9, file: !1, line: 10, type: !19)
!26 = !DILocation(line: 10, column: 16, scope: !9)
!27 = !DILocalVariable(name: "t1", scope: !9, file: !1, line: 12, type: !5)
!28 = !DILocation(line: 12, column: 10, scope: !9)
!29 = !DILocalVariable(name: "t2", scope: !9, file: !1, line: 12, type: !5)
!30 = !DILocation(line: 12, column: 14, scope: !9)
!31 = !DILocalVariable(name: "t3", scope: !9, file: !1, line: 12, type: !5)
!32 = !DILocation(line: 12, column: 18, scope: !9)
!33 = !DILocalVariable(name: "t4", scope: !9, file: !1, line: 12, type: !5)
!34 = !DILocation(line: 12, column: 22, scope: !9)
!35 = !DILocalVariable(name: "a1", scope: !9, file: !1, line: 12, type: !5)
!36 = !DILocation(line: 12, column: 26, scope: !9)
!37 = !DILocalVariable(name: "a2", scope: !9, file: !1, line: 12, type: !5)
!38 = !DILocation(line: 12, column: 30, scope: !9)
!39 = !DILocalVariable(name: "x1", scope: !9, file: !1, line: 12, type: !5)
!40 = !DILocation(line: 12, column: 34, scope: !9)
!41 = !DILocalVariable(name: "x2", scope: !9, file: !1, line: 12, type: !5)
!42 = !DILocation(line: 12, column: 38, scope: !9)
!43 = !DILocalVariable(name: "z", scope: !9, file: !1, line: 12, type: !5)
!44 = !DILocation(line: 12, column: 42, scope: !9)
!45 = !DILocalVariable(name: "r", scope: !9, file: !1, line: 13, type: !5)
!46 = !DILocation(line: 13, column: 10, scope: !9)
!47 = !DILocation(line: 15, column: 14, scope: !9)
!48 = !DILocation(line: 15, column: 12, scope: !9)
!49 = !DILocation(line: 15, column: 6, scope: !9)
!50 = !DILocation(line: 16, column: 14, scope: !9)
!51 = !DILocation(line: 16, column: 8, scope: !9)
!52 = !DILocation(line: 16, column: 6, scope: !9)
!53 = !DILocation(line: 17, column: 8, scope: !9)
!54 = !DILocation(line: 17, column: 18, scope: !9)
!55 = !DILocation(line: 17, column: 16, scope: !9)
!56 = !DILocation(line: 17, column: 10, scope: !9)
!57 = !DILocation(line: 17, column: 6, scope: !9)
!58 = !DILocation(line: 19, column: 16, scope: !9)
!59 = !DILocation(line: 19, column: 15, scope: !9)
!60 = !DILocation(line: 19, column: 12, scope: !9)
!61 = !DILocation(line: 19, column: 6, scope: !9)
!62 = !DILocation(line: 20, column: 14, scope: !9)
!63 = !DILocation(line: 20, column: 8, scope: !9)
!64 = !DILocation(line: 20, column: 6, scope: !9)
!65 = !DILocation(line: 21, column: 9, scope: !9)
!66 = !DILocation(line: 21, column: 8, scope: !9)
!67 = !DILocation(line: 21, column: 19, scope: !9)
!68 = !DILocation(line: 21, column: 17, scope: !9)
!69 = !DILocation(line: 21, column: 11, scope: !9)
!70 = !DILocation(line: 21, column: 6, scope: !9)
!71 = !DILocation(line: 22, column: 8, scope: !9)
!72 = !DILocation(line: 22, column: 13, scope: !9)
!73 = !DILocation(line: 22, column: 11, scope: !9)
!74 = !DILocation(line: 22, column: 18, scope: !9)
!75 = !DILocation(line: 22, column: 23, scope: !9)
!76 = !DILocation(line: 22, column: 21, scope: !9)
!77 = !DILocation(line: 22, column: 16, scope: !9)
!78 = !DILocation(line: 22, column: 6, scope: !9)
!79 = !DILocation(line: 23, column: 21, scope: !9)
!80 = !DILocation(line: 23, column: 19, scope: !9)
!81 = !DILocation(line: 23, column: 8, scope: !9)
!82 = !DILocation(line: 23, column: 6, scope: !9)
!83 = !DILocation(line: 24, column: 7, scope: !9)
!84 = !DILocation(line: 24, column: 18, scope: !9)
!85 = !DILocation(line: 24, column: 16, scope: !9)
!86 = !DILocation(line: 24, column: 10, scope: !9)
!87 = !DILocation(line: 24, column: 5, scope: !9)
!88 = !DILocation(line: 25, column: 14, scope: !9)
!89 = !DILocation(line: 25, column: 12, scope: !9)
!90 = !DILocation(line: 25, column: 18, scope: !9)
!91 = !DILocation(line: 25, column: 23, scope: !9)
!92 = !DILocation(line: 25, column: 21, scope: !9)
!93 = !DILocation(line: 25, column: 16, scope: !9)
!94 = !DILocation(line: 25, column: 6, scope: !9)
!95 = !DILocation(line: 26, column: 21, scope: !9)
!96 = !DILocation(line: 26, column: 19, scope: !9)
!97 = !DILocation(line: 26, column: 8, scope: !9)
!98 = !DILocation(line: 26, column: 6, scope: !9)
!99 = !DILocation(line: 27, column: 8, scope: !9)
!100 = !DILocation(line: 27, column: 19, scope: !9)
!101 = !DILocation(line: 27, column: 17, scope: !9)
!102 = !DILocation(line: 27, column: 11, scope: !9)
!103 = !DILocation(line: 27, column: 4, scope: !9)
!104 = !DILocation(line: 27, column: 6, scope: !9)
!105 = !DILocation(line: 28, column: 15, scope: !9)
!106 = !DILocation(line: 28, column: 14, scope: !9)
!107 = !DILocation(line: 28, column: 11, scope: !9)
!108 = !DILocation(line: 28, column: 5, scope: !9)
!109 = !DILocation(line: 30, column: 10, scope: !9)
!110 = !DILocation(line: 30, column: 3, scope: !9)
!111 = distinct !DISubprogram(name: "vranlc", scope: !1, file: !1, line: 34, type: !112, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!112 = !DISubroutineType(types: !113)
!113 = !{null, !4, !12, !5, !12}
!114 = !DILocalVariable(name: "n", arg: 1, scope: !111, file: !1, line: 34, type: !4)
!115 = !DILocation(line: 34, column: 18, scope: !111)
!116 = !DILocalVariable(name: "x", arg: 2, scope: !111, file: !1, line: 34, type: !12)
!117 = !DILocation(line: 34, column: 29, scope: !111)
!118 = !DILocalVariable(name: "a", arg: 3, scope: !111, file: !1, line: 34, type: !5)
!119 = !DILocation(line: 34, column: 39, scope: !111)
!120 = !DILocalVariable(name: "y", arg: 4, scope: !111, file: !1, line: 34, type: !12)
!121 = !DILocation(line: 34, column: 49, scope: !111)
!122 = !DILocalVariable(name: "r23", scope: !111, file: !1, line: 37, type: !19)
!123 = !DILocation(line: 37, column: 16, scope: !111)
!124 = !DILocalVariable(name: "r46", scope: !111, file: !1, line: 38, type: !19)
!125 = !DILocation(line: 38, column: 16, scope: !111)
!126 = !DILocalVariable(name: "t23", scope: !111, file: !1, line: 39, type: !19)
!127 = !DILocation(line: 39, column: 16, scope: !111)
!128 = !DILocalVariable(name: "t46", scope: !111, file: !1, line: 40, type: !19)
!129 = !DILocation(line: 40, column: 16, scope: !111)
!130 = !DILocalVariable(name: "t1", scope: !111, file: !1, line: 42, type: !5)
!131 = !DILocation(line: 42, column: 10, scope: !111)
!132 = !DILocalVariable(name: "t2", scope: !111, file: !1, line: 42, type: !5)
!133 = !DILocation(line: 42, column: 14, scope: !111)
!134 = !DILocalVariable(name: "t3", scope: !111, file: !1, line: 42, type: !5)
!135 = !DILocation(line: 42, column: 18, scope: !111)
!136 = !DILocalVariable(name: "t4", scope: !111, file: !1, line: 42, type: !5)
!137 = !DILocation(line: 42, column: 22, scope: !111)
!138 = !DILocalVariable(name: "a1", scope: !111, file: !1, line: 42, type: !5)
!139 = !DILocation(line: 42, column: 26, scope: !111)
!140 = !DILocalVariable(name: "a2", scope: !111, file: !1, line: 42, type: !5)
!141 = !DILocation(line: 42, column: 30, scope: !111)
!142 = !DILocalVariable(name: "x1", scope: !111, file: !1, line: 42, type: !5)
!143 = !DILocation(line: 42, column: 34, scope: !111)
!144 = !DILocalVariable(name: "x2", scope: !111, file: !1, line: 42, type: !5)
!145 = !DILocation(line: 42, column: 38, scope: !111)
!146 = !DILocalVariable(name: "z", scope: !111, file: !1, line: 42, type: !5)
!147 = !DILocation(line: 42, column: 42, scope: !111)
!148 = !DILocalVariable(name: "i", scope: !111, file: !1, line: 44, type: !4)
!149 = !DILocation(line: 44, column: 7, scope: !111)
!150 = !DILocation(line: 46, column: 14, scope: !111)
!151 = !DILocation(line: 46, column: 12, scope: !111)
!152 = !DILocation(line: 46, column: 6, scope: !111)
!153 = !DILocation(line: 47, column: 14, scope: !111)
!154 = !DILocation(line: 47, column: 8, scope: !111)
!155 = !DILocation(line: 47, column: 6, scope: !111)
!156 = !DILocation(line: 48, column: 8, scope: !111)
!157 = !DILocation(line: 48, column: 18, scope: !111)
!158 = !DILocation(line: 48, column: 16, scope: !111)
!159 = !DILocation(line: 48, column: 10, scope: !111)
!160 = !DILocation(line: 48, column: 6, scope: !111)
!161 = !DILocation(line: 50, column: 11, scope: !162)
!162 = distinct !DILexicalBlock(scope: !111, file: !1, line: 50, column: 3)
!163 = !DILocation(line: 50, column: 9, scope: !162)
!164 = !DILocation(line: 50, column: 16, scope: !165)
!165 = !DILexicalBlockFile(scope: !166, file: !1, discriminator: 1)
!166 = distinct !DILexicalBlock(scope: !162, file: !1, line: 50, column: 3)
!167 = !DILocation(line: 50, column: 20, scope: !165)
!168 = !DILocation(line: 50, column: 18, scope: !165)
!169 = !DILocation(line: 50, column: 3, scope: !165)
!170 = !DILocation(line: 52, column: 18, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !1, line: 50, column: 29)
!172 = !DILocation(line: 52, column: 17, scope: !171)
!173 = !DILocation(line: 52, column: 14, scope: !171)
!174 = !DILocation(line: 52, column: 8, scope: !171)
!175 = !DILocation(line: 53, column: 16, scope: !171)
!176 = !DILocation(line: 53, column: 10, scope: !171)
!177 = !DILocation(line: 53, column: 8, scope: !171)
!178 = !DILocation(line: 54, column: 11, scope: !171)
!179 = !DILocation(line: 54, column: 10, scope: !171)
!180 = !DILocation(line: 54, column: 21, scope: !171)
!181 = !DILocation(line: 54, column: 19, scope: !171)
!182 = !DILocation(line: 54, column: 13, scope: !171)
!183 = !DILocation(line: 54, column: 8, scope: !171)
!184 = !DILocation(line: 55, column: 10, scope: !171)
!185 = !DILocation(line: 55, column: 15, scope: !171)
!186 = !DILocation(line: 55, column: 13, scope: !171)
!187 = !DILocation(line: 55, column: 20, scope: !171)
!188 = !DILocation(line: 55, column: 25, scope: !171)
!189 = !DILocation(line: 55, column: 23, scope: !171)
!190 = !DILocation(line: 55, column: 18, scope: !171)
!191 = !DILocation(line: 55, column: 8, scope: !171)
!192 = !DILocation(line: 56, column: 23, scope: !171)
!193 = !DILocation(line: 56, column: 21, scope: !171)
!194 = !DILocation(line: 56, column: 10, scope: !171)
!195 = !DILocation(line: 56, column: 8, scope: !171)
!196 = !DILocation(line: 57, column: 9, scope: !171)
!197 = !DILocation(line: 57, column: 20, scope: !171)
!198 = !DILocation(line: 57, column: 18, scope: !171)
!199 = !DILocation(line: 57, column: 12, scope: !171)
!200 = !DILocation(line: 57, column: 7, scope: !171)
!201 = !DILocation(line: 58, column: 16, scope: !171)
!202 = !DILocation(line: 58, column: 14, scope: !171)
!203 = !DILocation(line: 58, column: 20, scope: !171)
!204 = !DILocation(line: 58, column: 25, scope: !171)
!205 = !DILocation(line: 58, column: 23, scope: !171)
!206 = !DILocation(line: 58, column: 18, scope: !171)
!207 = !DILocation(line: 58, column: 8, scope: !171)
!208 = !DILocation(line: 59, column: 23, scope: !171)
!209 = !DILocation(line: 59, column: 21, scope: !171)
!210 = !DILocation(line: 59, column: 10, scope: !171)
!211 = !DILocation(line: 59, column: 8, scope: !171)
!212 = !DILocation(line: 60, column: 10, scope: !171)
!213 = !DILocation(line: 60, column: 21, scope: !171)
!214 = !DILocation(line: 60, column: 19, scope: !171)
!215 = !DILocation(line: 60, column: 13, scope: !171)
!216 = !DILocation(line: 60, column: 6, scope: !171)
!217 = !DILocation(line: 60, column: 8, scope: !171)
!218 = !DILocation(line: 61, column: 20, scope: !171)
!219 = !DILocation(line: 61, column: 19, scope: !171)
!220 = !DILocation(line: 61, column: 16, scope: !171)
!221 = !DILocation(line: 61, column: 7, scope: !171)
!222 = !DILocation(line: 61, column: 5, scope: !171)
!223 = !DILocation(line: 61, column: 10, scope: !171)
!224 = !DILocation(line: 62, column: 3, scope: !171)
!225 = !DILocation(line: 50, column: 24, scope: !226)
!226 = !DILexicalBlockFile(scope: !166, file: !1, discriminator: 2)
!227 = !DILocation(line: 50, column: 3, scope: !226)
!228 = distinct !{!228, !229}
!229 = !DILocation(line: 50, column: 3, scope: !111)
!230 = !DILocation(line: 64, column: 3, scope: !111)
!231 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 67, type: !232, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!232 = !DISubroutineType(types: !233)
!233 = !{!4}
!234 = !DILocalVariable(name: "begin", scope: !231, file: !1, line: 69, type: !5)
!235 = !DILocation(line: 69, column: 8, scope: !231)
!236 = !DILocation(line: 69, column: 16, scope: !231)
!237 = !DILocalVariable(name: "i1", scope: !231, file: !1, line: 70, type: !4)
!238 = !DILocation(line: 70, column: 6, scope: !231)
!239 = !DILocalVariable(name: "i2", scope: !231, file: !1, line: 70, type: !4)
!240 = !DILocation(line: 70, column: 10, scope: !231)
!241 = !DILocalVariable(name: "i3", scope: !231, file: !1, line: 70, type: !4)
!242 = !DILocation(line: 70, column: 14, scope: !231)
!243 = !DILocalVariable(name: "d1", scope: !231, file: !1, line: 70, type: !4)
!244 = !DILocation(line: 70, column: 18, scope: !231)
!245 = !DILocalVariable(name: "e1", scope: !231, file: !1, line: 70, type: !4)
!246 = !DILocation(line: 70, column: 22, scope: !231)
!247 = !DILocalVariable(name: "e2", scope: !231, file: !1, line: 70, type: !4)
!248 = !DILocation(line: 70, column: 26, scope: !231)
!249 = !DILocalVariable(name: "e3", scope: !231, file: !1, line: 70, type: !4)
!250 = !DILocation(line: 70, column: 30, scope: !231)
!251 = !DILocalVariable(name: "xx", scope: !231, file: !1, line: 71, type: !5)
!252 = !DILocation(line: 71, column: 8, scope: !231)
!253 = !DILocalVariable(name: "x0", scope: !231, file: !1, line: 71, type: !5)
!254 = !DILocation(line: 71, column: 12, scope: !231)
!255 = !DILocalVariable(name: "x1", scope: !231, file: !1, line: 71, type: !5)
!256 = !DILocation(line: 71, column: 16, scope: !231)
!257 = !DILocalVariable(name: "a1", scope: !231, file: !1, line: 71, type: !5)
!258 = !DILocation(line: 71, column: 20, scope: !231)
!259 = !DILocalVariable(name: "a2", scope: !231, file: !1, line: 71, type: !5)
!260 = !DILocation(line: 71, column: 24, scope: !231)
!261 = !DILocalVariable(name: "ai", scope: !231, file: !1, line: 71, type: !5)
!262 = !DILocation(line: 71, column: 28, scope: !231)
!263 = !DILocalVariable(name: "x", scope: !231, file: !1, line: 72, type: !19)
!264 = !DILocation(line: 72, column: 14, scope: !231)
!265 = !DILocalVariable(name: "rdummy", scope: !231, file: !1, line: 73, type: !5)
!266 = !DILocation(line: 73, column: 8, scope: !231)
!267 = !DILocation(line: 74, column: 4, scope: !231)
!268 = !DILocation(line: 75, column: 6, scope: !231)
!269 = !DILocation(line: 76, column: 6, scope: !231)
!270 = !DILocation(line: 77, column: 6, scope: !231)
!271 = !DILocation(line: 78, column: 6, scope: !231)
!272 = !DILocation(line: 80, column: 6, scope: !231)
!273 = !DILocation(line: 81, column: 6, scope: !231)
!274 = !DILocation(line: 84, column: 6, scope: !231)
!275 = !DILocation(line: 85, column: 11, scope: !231)
!276 = !DILocation(line: 85, column: 6, scope: !231)
!277 = !DILocation(line: 86, column: 6, scope: !231)
!278 = !DILocation(line: 88, column: 12, scope: !231)
!279 = !DILocation(line: 88, column: 3, scope: !231)
!280 = !DILocalVariable(name: "z", scope: !231, file: !1, line: 88, type: !281)
!281 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, align: 64, elements: !282)
!282 = !{!283}
!283 = !DISubrange(count: -1)
!284 = !DIExpression(DW_OP_deref)
!285 = !DILocation(line: 88, column: 10, scope: !231)
!286 = !DILocalVariable(name: "a", scope: !231, file: !1, line: 90, type: !19)
!287 = !DILocation(line: 90, column: 16, scope: !231)
!288 = !DILocation(line: 92, column: 9, scope: !231)
!289 = !DILocalVariable(name: "end", scope: !231, file: !1, line: 111, type: !5)
!290 = !DILocation(line: 111, column: 8, scope: !231)
!291 = !DILocation(line: 111, column: 14, scope: !231)
!292 = !DILocalVariable(name: "time_spent", scope: !231, file: !1, line: 112, type: !5)
!293 = !DILocation(line: 112, column: 12, scope: !231)
!294 = !DILocation(line: 112, column: 34, scope: !231)
!295 = !DILocation(line: 112, column: 40, scope: !231)
!296 = !DILocation(line: 112, column: 38, scope: !231)
!297 = !DILocation(line: 113, column: 35, scope: !231)
!298 = !DILocation(line: 113, column: 5, scope: !231)
!299 = !DILocation(line: 114, column: 5, scope: !231)
!300 = !DILocation(line: 115, column: 1, scope: !231)
!301 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 92, type: !302, isLocal: true, isDefinition: true, scopeLine: 93, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!302 = !DISubroutineType(types: !303)
!303 = !{null, !304, !304, !307, !308, !307, !307, !309, !309, !307, !307, !309, !309, !307, !310, !12, !307}
!304 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !305)
!305 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !306)
!306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, align: 64)
!307 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !5, size: 64, align: 64)
!308 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !19, size: 64, align: 64)
!309 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4, size: 64, align: 64)
!310 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!311 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !301, type: !304, flags: DIFlagArtificial | DIFlagObjectPointer)
!312 = !DILocation(line: 0, scope: !301)
!313 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !301, type: !304, flags: DIFlagArtificial)
!314 = !DILocalVariable(name: "x0", arg: 3, scope: !301, type: !307, flags: DIFlagArtificial)
!315 = !DILocalVariable(name: "x", arg: 4, scope: !301, type: !308, flags: DIFlagArtificial)
!316 = !DILocalVariable(name: "rdummy", arg: 5, scope: !301, type: !307, flags: DIFlagArtificial)
!317 = !DILocalVariable(name: "ai", arg: 6, scope: !301, type: !307, flags: DIFlagArtificial)
!318 = !DILocalVariable(name: "i3", arg: 7, scope: !301, type: !309, flags: DIFlagArtificial)
!319 = !DILocalVariable(name: "e3", arg: 8, scope: !301, type: !309, flags: DIFlagArtificial)
!320 = !DILocalVariable(name: "x1", arg: 9, scope: !301, type: !307, flags: DIFlagArtificial)
!321 = !DILocalVariable(name: "a2", arg: 10, scope: !301, type: !307, flags: DIFlagArtificial)
!322 = !DILocalVariable(name: "e2", arg: 11, scope: !301, type: !309, flags: DIFlagArtificial)
!323 = !DILocalVariable(name: "d1", arg: 12, scope: !301, type: !309, flags: DIFlagArtificial)
!324 = !DILocalVariable(name: "a", arg: 13, scope: !301, type: !307, flags: DIFlagArtificial)
!325 = !DILocalVariable(name: "vla", arg: 14, scope: !301, type: !310, flags: DIFlagArtificial)
!326 = !DILocalVariable(name: "z", arg: 15, scope: !301, type: !12, flags: DIFlagArtificial)
!327 = !DILocalVariable(name: "a1", arg: 16, scope: !301, type: !307, flags: DIFlagArtificial)
!328 = !DILocation(line: 93, column: 1, scope: !301)
!329 = !DILocation(line: 94, column: 11, scope: !330)
!330 = distinct !DILexicalBlock(scope: !301, file: !1, line: 93, column: 1)
!331 = !DILocation(line: 96, column: 8, scope: !332)
!332 = distinct !DILexicalBlock(scope: !333, file: !1, line: 95, column: 3)
!333 = distinct !DILexicalBlock(scope: !330, file: !1, line: 94, column: 11)
!334 = !DILocation(line: 97, column: 26, scope: !332)
!335 = !DILocation(line: 97, column: 14, scope: !332)
!336 = !DILocation(line: 97, column: 12, scope: !332)
!337 = !DILocation(line: 99, column: 13, scope: !338)
!338 = distinct !DILexicalBlock(scope: !332, file: !1, line: 99, column: 5)
!339 = !DILocation(line: 99, column: 10, scope: !338)
!340 = !DILocation(line: 99, column: 18, scope: !341)
!341 = !DILexicalBlockFile(scope: !342, file: !1, discriminator: 1)
!342 = distinct !DILexicalBlock(scope: !338, file: !1, line: 99, column: 5)
!343 = !DILocation(line: 99, column: 23, scope: !341)
!344 = !DILocation(line: 99, column: 21, scope: !341)
!345 = !DILocation(line: 99, column: 5, scope: !341)
!346 = !DILocation(line: 100, column: 14, scope: !347)
!347 = distinct !DILexicalBlock(scope: !342, file: !1, line: 99, column: 33)
!348 = !DILocation(line: 100, column: 12, scope: !347)
!349 = !DILocation(line: 101, column: 30, scope: !347)
!350 = !DILocation(line: 101, column: 18, scope: !347)
!351 = !DILocation(line: 101, column: 16, scope: !347)
!352 = !DILocation(line: 102, column: 15, scope: !347)
!353 = !DILocation(line: 104, column: 14, scope: !347)
!354 = !DILocation(line: 102, column: 40, scope: !347)
!355 = !DILocation(line: 102, column: 15, scope: !356)
!356 = !DILexicalBlockFile(scope: !347, file: !1, discriminator: 1)
!357 = !DILocation(line: 102, column: 37, scope: !358)
!358 = distinct !DILexicalBlock(scope: !347, file: !1, line: 102, column: 15)
!359 = !DILocation(line: 102, column: 40, scope: !358)
!360 = !DILocation(line: 102, column: 15, scope: !361)
!361 = !DILexicalBlockFile(scope: !347, file: !1, discriminator: 2)
!362 = !DILocation(line: 108, column: 5, scope: !347)
!363 = !DILocation(line: 99, column: 29, scope: !364)
!364 = !DILexicalBlockFile(scope: !342, file: !1, discriminator: 2)
!365 = !DILocation(line: 99, column: 5, scope: !364)
!366 = distinct !{!366, !367}
!367 = !DILocation(line: 99, column: 5, scope: !332)
!368 = !DILocation(line: 109, column: 3, scope: !332)
!369 = !DILocation(line: 94, column: 21, scope: !370)
!370 = !DILexicalBlockFile(scope: !333, file: !1, discriminator: 1)
!371 = !DILocation(line: 110, column: 1, scope: !301)
!372 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !373, type: !4, flags: DIFlagArtificial | DIFlagObjectPointer)
!373 = distinct !DISubprogram(name: ".omp_outlined..1", scope: !1, file: !1, line: 102, type: !374, isLocal: true, isDefinition: true, scopeLine: 103, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!374 = !DISubroutineType(types: !375)
!375 = !{null, !4, !306, !376, !378, !376, !384}
!376 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !377)
!377 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!378 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !379)
!379 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !380, size: 64, align: 64)
!380 = !DISubroutineType(types: !381)
!381 = !{null, !382, null}
!382 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !383)
!383 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !377)
!384 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64, align: 64)
!385 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 102, size: 576, align: 64, elements: !2)
!386 = !DILocation(line: 0, scope: !373)
!387 = !DILocalVariable(name: ".part_id.", arg: 2, scope: !373, type: !306, flags: DIFlagArtificial)
!388 = !DILocalVariable(name: ".privates.", arg: 3, scope: !373, type: !376, flags: DIFlagArtificial)
!389 = !DILocalVariable(name: ".copy_fn.", arg: 4, scope: !373, type: !378, flags: DIFlagArtificial)
!390 = !DILocalVariable(name: ".task_t.", arg: 5, scope: !373, type: !376, flags: DIFlagArtificial)
!391 = !DILocalVariable(name: "__context", arg: 6, scope: !373, type: !384, flags: DIFlagArtificial)
!392 = !DILocation(line: 103, column: 7, scope: !373)
!393 = !DILocation(line: 103, column: 15, scope: !394)
!394 = distinct !DILexicalBlock(scope: !373, file: !1, line: 103, column: 7)
!395 = !DILocation(line: 103, column: 12, scope: !394)
!396 = !DILocation(line: 103, column: 20, scope: !397)
!397 = !DILexicalBlockFile(scope: !398, file: !1, discriminator: 1)
!398 = distinct !DILexicalBlock(scope: !394, file: !1, line: 103, column: 7)
!399 = !DILocation(line: 103, column: 25, scope: !397)
!400 = !DILocation(line: 103, column: 23, scope: !397)
!401 = !DILocation(line: 103, column: 7, scope: !397)
!402 = !DILocation(line: 104, column: 14, scope: !403)
!403 = distinct !DILexicalBlock(scope: !398, file: !1, line: 103, column: 35)
!404 = !DILocation(line: 104, column: 12, scope: !403)
!405 = !DILocation(line: 105, column: 16, scope: !403)
!406 = !DILocation(line: 105, column: 28, scope: !403)
!407 = !DILocation(line: 105, column: 9, scope: !403)
!408 = !DILocation(line: 106, column: 29, scope: !403)
!409 = !DILocation(line: 106, column: 18, scope: !403)
!410 = !DILocation(line: 106, column: 9, scope: !403)
!411 = !DILocation(line: 106, column: 16, scope: !403)
!412 = !DILocation(line: 103, column: 31, scope: !413)
!413 = !DILexicalBlockFile(scope: !398, file: !1, discriminator: 2)
!414 = !DILocation(line: 103, column: 7, scope: !413)
!415 = distinct !{!415, !392}
