; ModuleID = '<stdin>'
source_filename = "sourcefile.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [39 x i8] c"outer parallel region Thread ID == %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;29;21;;\00"
@2 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;33;23;;\00"
@.gomp_critical_user_.var = common global [8 x i32] zeroinitializer
@3 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;29;55;;\00"
@.str.2 = private unnamed_addr constant [10 x i8] c"blablabla\00"
@.str.3 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.4 = private unnamed_addr constant [12 x i8] c"Main Thread\00"
@.str.5 = private unnamed_addr constant [71 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c: main :: line No: 10\00"
@.str.6 = private unnamed_addr constant [12 x i8] c"Main Thread\00"
@.str.7 = private unnamed_addr constant [81 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c: .omp_outlined. :: line No: 30\00"
@.str.8 = private unnamed_addr constant [18 x i8] c".global_tid..addr\00"
@.str.9 = private unnamed_addr constant [17 x i8] c".bound_tid..addr\00"
@.str.10 = private unnamed_addr constant [15 x i8] c"blablabla.addr\00"
@.str.11 = private unnamed_addr constant [15 x i8] c"blablabla.addr\00"
@.str.12 = private unnamed_addr constant [8 x i8] c".omp.lb\00"
@.str.13 = private unnamed_addr constant [8 x i8] c".omp.ub\00"
@.str.14 = private unnamed_addr constant [12 x i8] c".omp.stride\00"
@.str.15 = private unnamed_addr constant [13 x i8] c".omp.is_last\00"
@.str.16 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.17 = private unnamed_addr constant [18 x i8] c".global_tid..addr\00"
@.str.18 = private unnamed_addr constant [18 x i8] c".global_tid..addr\00"
@.str.19 = private unnamed_addr constant [12 x i8] c"Main Thread\00"
@.str.20 = private unnamed_addr constant [81 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c: .omp_outlined. :: line No: 30\00"
@.str.21 = private unnamed_addr constant [8 x i8] c".omp.ub\00"
@.str.22 = private unnamed_addr constant [8 x i8] c".omp.ub\00"
@.str.23 = private unnamed_addr constant [8 x i8] c".omp.ub\00"
@.str.24 = private unnamed_addr constant [8 x i8] c".omp.lb\00"
@.str.25 = private unnamed_addr constant [8 x i8] c".omp.iv\00"
@.str.26 = private unnamed_addr constant [8 x i8] c".omp.iv\00"
@.str.27 = private unnamed_addr constant [8 x i8] c".omp.ub\00"
@.str.28 = private unnamed_addr constant [8 x i8] c".omp.iv\00"
@.str.29 = private unnamed_addr constant [2 x i8] c"i\00"
@.str.30 = private unnamed_addr constant [15 x i8] c"blablabla.addr\00"
@.str.31 = private unnamed_addr constant [2 x i8] c"c\00"
@.str.32 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.33 = private unnamed_addr constant [12 x i8] c"Main Thread\00"
@.str.34 = private unnamed_addr constant [81 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c: .omp_outlined. :: line No: 30\00"
@.str.35 = private unnamed_addr constant [15 x i8] c"blablabla.addr\00"
@.str.36 = private unnamed_addr constant [15 x i8] c"blablabla.addr\00"
@.str.37 = private unnamed_addr constant [8 x i8] c".omp.iv\00"
@.str.38 = private unnamed_addr constant [8 x i8] c".omp.iv\00"
@.str.39 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.40 = private unnamed_addr constant [12 x i8] c"Main Thread\00"
@.str.41 = private unnamed_addr constant [81 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c: .omp_outlined. :: line No: 30\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !6 {
entry:
  call void @__DiscoPoPOpenMPInitialize()
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %blablabla = alloca i32, align 4
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !10, metadata !11), !dbg !12
  call void @omp_set_num_threads(i32 32), !dbg !13
  call void @llvm.dbg.declare(metadata i32* %blablabla, metadata !14, metadata !11), !dbg !15
  %call = call i32 @omp_get_thread_num(), !dbg !16
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str, i32 0, i32 0), i32 %call), !dbg !17
  %2 = ptrtoint i32* %blablabla to i64
  call void @__DiscoPoPOpenMPWrite(i64 %2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0))
  store i32 10000, i32* %blablabla, align 4, !dbg !19
  %3 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !20
  %4 = ptrtoint i8** %3 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %4, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %3, align 8, !dbg !20
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.5, i32 0, i32 0))
  call void @__DiscoPoPOpenMPAfterCall()
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* %.kmpc_loc.addr, i32 1, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %blablabla), !dbg !20
  call void @__DiscoPoPOpenMPFinalize()
  ret i32 0, !dbg !21
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @omp_set_num_threads(i32) #2

declare i32 @printf(i8*, ...) #2

declare i32 @omp_get_thread_num() #2

; Function Attrs: nounwind uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %blablabla) #0 !dbg !22 {
entry:
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.7, i32 0, i32 0))
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %blablabla.addr = alloca i32*, align 8
  %.omp.iv = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %i = alloca i32, align 4
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  %c = alloca i32, align 4
  %2 = ptrtoint i32** %.global_tid..addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %2, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.8, i32 0, i32 0))
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !29, metadata !11), !dbg !30
  %3 = ptrtoint i32** %.bound_tid..addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %3, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.9, i32 0, i32 0))
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !31, metadata !11), !dbg !30
  %4 = ptrtoint i32** %blablabla.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.10, i32 0, i32 0))
  store i32* %blablabla, i32** %blablabla.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %blablabla.addr, metadata !32, metadata !11), !dbg !30
  %5 = ptrtoint i32** %blablabla.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %5, i32 8, i32 0, i32 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i32 0, i32 0))
  %6 = load i32*, i32** %blablabla.addr, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !34, metadata !11), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !35, metadata !11), !dbg !30
  %7 = ptrtoint i32* %.omp.lb to i64
  call void @__DiscoPoPOpenMPWrite(i64 %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.12, i32 0, i32 0))
  store i32 0, i32* %.omp.lb, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !37, metadata !11), !dbg !30
  %8 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPWrite(i64 %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.13, i32 0, i32 0))
  store i32 3, i32* %.omp.ub, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !38, metadata !11), !dbg !30
  %9 = ptrtoint i32* %.omp.stride to i64
  call void @__DiscoPoPOpenMPWrite(i64 %9, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.14, i32 0, i32 0))
  store i32 1, i32* %.omp.stride, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !39, metadata !11), !dbg !30
  %10 = ptrtoint i32* %.omp.is_last to i64
  call void @__DiscoPoPOpenMPWrite(i64 %10, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.15, i32 0, i32 0))
  store i32 0, i32* %.omp.is_last, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %i, metadata !40, metadata !11), !dbg !30
  %11 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !33
  %12 = ptrtoint i8** %11 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %12, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.16, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %11, align 8, !dbg !33
  %13 = ptrtoint i32** %.global_tid..addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %13, i32 8, i32 0, i32 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.17, i32 0, i32 0))
  %14 = load i32*, i32** %.global_tid..addr, align 8, !dbg !33
  %15 = ptrtoint i32* %14 to i64
  call void @__DiscoPoPOpenMPRead(i64 %15, i32 4, i32 0, i32 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.18, i32 0, i32 0))
  %16 = load i32, i32* %14, align 4, !dbg !33
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.20, i32 0, i32 0))
  call void @__DiscoPoPOpenMPAfterCall()
  call void @__kmpc_for_static_init_4(%ident_t* %.kmpc_loc.addr, i32 %16, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !33
  %17 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPRead(i64 %17, i32 4, i32 0, i32 0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.21, i32 0, i32 0))
  %18 = load i32, i32* %.omp.ub, align 4, !dbg !36
  %cmp = icmp sgt i32 %18, 3, !dbg !36
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !36

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !41

cond.false:                                       ; preds = %entry
  %19 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPRead(i64 %19, i32 4, i32 0, i32 0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.22, i32 0, i32 0))
  %20 = load i32, i32* %.omp.ub, align 4, !dbg !43
  br label %cond.end, !dbg !43

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 3, %cond.true ], [ %20, %cond.false ], !dbg !45
  %21 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPWrite(i64 %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.23, i32 0, i32 0))
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !45
  %22 = ptrtoint i32* %.omp.lb to i64
  call void @__DiscoPoPOpenMPRead(i64 %22, i32 4, i32 0, i32 0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0))
  %23 = load i32, i32* %.omp.lb, align 4, !dbg !45
  %24 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPWrite(i64 %24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.25, i32 0, i32 0))
  store i32 %23, i32* %.omp.iv, align 4, !dbg !45
  br label %omp.inner.for.cond, !dbg !47

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %25 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPRead(i64 %25, i32 4, i32 0, i32 0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.26, i32 0, i32 0))
  %26 = load i32, i32* %.omp.iv, align 4, !dbg !48
  %27 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPRead(i64 %27, i32 4, i32 0, i32 0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.27, i32 0, i32 0))
  %28 = load i32, i32* %.omp.ub, align 4, !dbg !48
  %cmp1 = icmp sle i32 %26, %28, !dbg !30
  br i1 %cmp1, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !50

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %29 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPRead(i64 %29, i32 4, i32 0, i32 0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.28, i32 0, i32 0))
  %30 = load i32, i32* %.omp.iv, align 4, !dbg !51
  %mul = mul nsw i32 %30, 1, !dbg !53
  %add = add nsw i32 0, %mul, !dbg !53
  %31 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPWrite(i64 %31, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.29, i32 0, i32 0))
  store i32 %add, i32* %i, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %c, metadata !54, metadata !11), !dbg !56
  %32 = ptrtoint i32* %6 to i64
  call void @__DiscoPoPOpenMPRead(i64 %32, i32 4, i32 0, i32 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.30, i32 0, i32 0))
  %33 = load i32, i32* %6, align 4, !dbg !57
  %add2 = add nsw i32 %33, 9, !dbg !58
  %34 = ptrtoint i32* %c to i64
  call void @__DiscoPoPOpenMPWrite(i64 %34, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.31, i32 0, i32 0))
  store i32 %add2, i32* %c, align 4, !dbg !56
  %35 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !59
  %36 = ptrtoint i8** %35 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %36, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.32, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0), i8** %35, align 8, !dbg !59
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.34, i32 0, i32 0))
  call void @__kmpc_critical(%ident_t* %.kmpc_loc.addr, i32 %16, [8 x i32]* @.gomp_critical_user_.var), !dbg !59
  %37 = ptrtoint i32* %6 to i64
  call void @__DiscoPoPOpenMPRead(i64 %37, i32 4, i32 0, i32 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.35, i32 0, i32 0))
  %38 = load i32, i32* %6, align 4, !dbg !60
  %inc = add nsw i32 %38, 1, !dbg !60
  %39 = ptrtoint i32* %6 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %39, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.36, i32 0, i32 0))
  store i32 %inc, i32* %6, align 4, !dbg !60
  call void @__DiscoPoPOpenMPAfterCall()
  call void @__kmpc_end_critical(%ident_t* %.kmpc_loc.addr, i32 %16, [8 x i32]* @.gomp_critical_user_.var), !dbg !62
  br label %omp.body.continue, !dbg !63

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !64

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %40 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPRead(i64 %40, i32 4, i32 0, i32 0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.37, i32 0, i32 0))
  %41 = load i32, i32* %.omp.iv, align 4, !dbg !65
  %add3 = add nsw i32 %41, 1, !dbg !67
  %42 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPWrite(i64 %42, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i32 0, i32 0))
  store i32 %add3, i32* %.omp.iv, align 4, !dbg !67
  br label %omp.inner.for.cond, !dbg !68, !llvm.loop !69

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !70

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  %43 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !71
  %44 = ptrtoint i8** %43 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %44, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.39, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @3, i32 0, i32 0), i8** %43, align 8, !dbg !71
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.41, i32 0, i32 0))
  call void @__DiscoPoPOpenMPAfterCall()
  call void @__kmpc_for_static_fini(%ident_t* %.kmpc_loc.addr, i32 %16), !dbg !71
  call void @__DiscoPoPOpenMPAfterCall()
  ret void, !dbg !72
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

declare void @__kmpc_for_static_init_4(%ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare void @__kmpc_end_critical(%ident_t*, i32, [8 x i32]*)

declare void @__kmpc_critical(%ident_t*, i32, [8 x i32]*)

declare void @__kmpc_for_static_fini(%ident_t*, i32)

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

declare void @__DiscoPoPOpenMPInitialize()

declare void @__CollectThreadInfo()

declare void @__DiscoPoPOpenMPFinalize()

declare void @__DiscoPoPOpenMPRead(i64, i32, i32, i32, i8*)

declare void @__DiscoPoPOpenMPWrite(i64, i8*)

declare void @__DiscoPoPOpenMPBeforeCall(i8*)

declare void @__DiscoPoPOpenMPAfterCall()

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.1 (tags/RELEASE_391/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "sourcefile.c", directory: "/home/amiryousefi/MasterThesis/Codes")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
!6 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 7, type: !7, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, unit: !0, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{!9}
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 10, type: !9)
!11 = !DIExpression()
!12 = !DILocation(line: 10, column: 9, scope: !6)
!13 = !DILocation(line: 11, column: 5, scope: !6)
!14 = !DILocalVariable(name: "blablabla", scope: !6, file: !1, line: 13, type: !9)
!15 = !DILocation(line: 13, column: 9, scope: !6)
!16 = !DILocation(line: 17, column: 58, scope: !6)
!17 = !DILocation(line: 17, column: 8, scope: !18)
!18 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!19 = !DILocation(line: 21, column: 14, scope: !6)
!20 = !DILocation(line: 29, column: 21, scope: !6)
!21 = !DILocation(line: 39, column: 5, scope: !6)
!22 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 29, type: !23, isLocal: true, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !25, !25, !28}
!25 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!28 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !9, size: 64, align: 64)
!29 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !22, type: !25, flags: DIFlagArtificial | DIFlagObjectPointer)
!30 = !DILocation(line: 0, scope: !22)
!31 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !22, type: !25, flags: DIFlagArtificial)
!32 = !DILocalVariable(name: "blablabla", arg: 3, scope: !22, type: !28, flags: DIFlagArtificial)
!33 = !DILocation(line: 30, column: 13, scope: !22)
!34 = !DILocalVariable(name: ".omp.iv", scope: !22, type: !9, flags: DIFlagArtificial)
!35 = !DILocalVariable(name: ".omp.lb", scope: !22, type: !9, flags: DIFlagArtificial)
!36 = !DILocation(line: 30, column: 17, scope: !22)
!37 = !DILocalVariable(name: ".omp.ub", scope: !22, type: !9, flags: DIFlagArtificial)
!38 = !DILocalVariable(name: ".omp.stride", scope: !22, type: !9, flags: DIFlagArtificial)
!39 = !DILocalVariable(name: ".omp.is_last", scope: !22, type: !9, flags: DIFlagArtificial)
!40 = !DILocalVariable(name: "i", scope: !22, type: !9, flags: DIFlagArtificial)
!41 = !DILocation(line: 30, column: 17, scope: !42)
!42 = !DILexicalBlockFile(scope: !22, file: !1, discriminator: 1)
!43 = !DILocation(line: 30, column: 17, scope: !44)
!44 = !DILexicalBlockFile(scope: !22, file: !1, discriminator: 2)
!45 = !DILocation(line: 30, column: 17, scope: !46)
!46 = !DILexicalBlockFile(scope: !22, file: !1, discriminator: 3)
!47 = !DILocation(line: 30, column: 13, scope: !46)
!48 = !DILocation(line: 30, column: 17, scope: !49)
!49 = !DILexicalBlockFile(scope: !22, file: !1, discriminator: 4)
!50 = !DILocation(line: 30, column: 13, scope: !49)
!51 = !DILocation(line: 30, column: 17, scope: !52)
!52 = !DILexicalBlockFile(scope: !22, file: !1, discriminator: 5)
!53 = !DILocation(line: 30, column: 29, scope: !52)
!54 = !DILocalVariable(name: "c", scope: !55, file: !1, line: 32, type: !9)
!55 = distinct !DILexicalBlock(scope: !22, file: !1, line: 31, column: 13)
!56 = !DILocation(line: 32, column: 19, scope: !55)
!57 = !DILocation(line: 32, column: 23, scope: !55)
!58 = !DILocation(line: 32, column: 32, scope: !55)
!59 = !DILocation(line: 33, column: 23, scope: !55)
!60 = !DILocation(line: 34, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !1, line: 33, column: 23)
!62 = !DILocation(line: 34, column: 15, scope: !61)
!63 = !DILocation(line: 36, column: 13, scope: !55)
!64 = !DILocation(line: 29, column: 21, scope: !22)
!65 = !DILocation(line: 30, column: 17, scope: !66)
!66 = !DILexicalBlockFile(scope: !22, file: !1, discriminator: 6)
!67 = !DILocation(line: 0, scope: !42)
!68 = !DILocation(line: 29, column: 21, scope: !42)
!69 = distinct !{!69, !33}
!70 = !DILocation(line: 29, column: 21, scope: !44)
!71 = !DILocation(line: 29, column: 21, scope: !46)
!72 = !DILocation(line: 36, column: 13, scope: !42)
