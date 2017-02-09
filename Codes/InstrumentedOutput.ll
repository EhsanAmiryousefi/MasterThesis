; ModuleID = '<stdin>'
source_filename = "sourcefile.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;15;10;;\00"
@2 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;19;11;;\00"
@.gomp_critical_user_.var = common global [8 x i32] zeroinitializer
@3 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;15;36;;\00"
@4 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;22;10;;\00"
@.str.1 = private unnamed_addr constant [17 x i8] c"test source file\00", align 1
@n = constant i32 20, align 4
@.str.2 = private unnamed_addr constant [6 x i8] c"Ehsan\00"
@.str.3 = private unnamed_addr constant [2 x i8] c"b\00"
@.str.4 = private unnamed_addr constant [2 x i8] c"x\00"
@.str.5 = private unnamed_addr constant [6 x i8] c"hasan\00"
@.str.6 = private unnamed_addr constant [2 x i8] c"x\00"
@.str.7 = private unnamed_addr constant [6 x i8] c"Ehsan\00"
@.str.8 = private unnamed_addr constant [6 x i8] c"hasan\00"
@.str.9 = private unnamed_addr constant [6 x i8] c"Ehsan\00"
@.str.10 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.11 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.12 = private unnamed_addr constant [7 x i8] c"a.addr\00"
@.str.13 = private unnamed_addr constant [7 x i8] c"b.addr\00"
@.str.14 = private unnamed_addr constant [7 x i8] c"x.addr\00"
@.str.15 = private unnamed_addr constant [8 x i8] c".omp.lb\00"
@.str.16 = private unnamed_addr constant [8 x i8] c".omp.ub\00"
@.str.17 = private unnamed_addr constant [12 x i8] c".omp.stride\00"
@.str.18 = private unnamed_addr constant [13 x i8] c".omp.is_last\00"
@.str.19 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.20 = private unnamed_addr constant [18 x i8] c".global_tid..addr\00"
@.str.21 = private unnamed_addr constant [18 x i8] c".global_tid..addr\00"
@.str.22 = private unnamed_addr constant [8 x i8] c".omp.ub\00"
@.str.23 = private unnamed_addr constant [8 x i8] c".omp.ub\00"
@.str.24 = private unnamed_addr constant [8 x i8] c".omp.ub\00"
@.str.25 = private unnamed_addr constant [8 x i8] c".omp.lb\00"
@.str.26 = private unnamed_addr constant [8 x i8] c".omp.iv\00"
@.str.27 = private unnamed_addr constant [8 x i8] c".omp.iv\00"
@.str.28 = private unnamed_addr constant [8 x i8] c".omp.ub\00"
@.str.29 = private unnamed_addr constant [8 x i8] c".omp.iv\00"
@.str.30 = private unnamed_addr constant [2 x i8] c"i\00"
@.str.31 = private unnamed_addr constant [7 x i8] c"b.addr\00"
@.str.32 = private unnamed_addr constant [2 x i8] c"i\00"
@.str.33 = private unnamed_addr constant [2 x i8] c"i\00"
@.str.34 = private unnamed_addr constant [7 x i8] c"a.addr\00"
@.str.35 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.36 = private unnamed_addr constant [7 x i8] c"x.addr\00"
@.str.37 = private unnamed_addr constant [7 x i8] c"x.addr\00"
@.str.38 = private unnamed_addr constant [8 x i8] c".omp.iv\00"
@.str.39 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !10 {
entry:
  %retval = alloca i32, align 4
  %Ehsan = alloca i32, align 4
  %a = alloca [20 x i32], align 16
  %b = alloca i32, align 4
  %x = alloca i32, align 4
  %hasan = alloca i32, align 4
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  %2 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @4, i32 0, i32 0), i8** %2, align 8
  %3 = call i32 @__kmpc_global_thread_num(%ident_t* %.kmpc_loc.addr)
  store i32 0, i32* %retval, align 4
  call void @__DiscoPoPOpenMPInitialize()
  call void @llvm.dbg.declare(metadata i32* %Ehsan, metadata !13, metadata !14), !dbg !15
  %4 = ptrtoint i32* %Ehsan to i64
  call void @__DiscoPoPOpenMPWrite(i32 16391, i64 %4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0))
  store i32 100, i32* %Ehsan, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata [20 x i32]* %a, metadata !16, metadata !14), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %b, metadata !21, metadata !14), !dbg !22
  %5 = ptrtoint i32* %b to i64
  call void @__DiscoPoPOpenMPWrite(i32 16393, i64 %5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 1000, i32* %b, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %x, metadata !23, metadata !14), !dbg !24
  %6 = ptrtoint i32* %x to i64
  call void @__DiscoPoPOpenMPWrite(i32 16394, i64 %6, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store i32 0, i32* %x, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %hasan, metadata !25, metadata !14), !dbg !26
  %7 = ptrtoint i32* %hasan to i64
  call void @__DiscoPoPOpenMPWrite(i32 16395, i64 %7, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0))
  store i32 12, i32* %hasan, align 4, !dbg !26
  %8 = ptrtoint i32* %x to i64
  call void @__DiscoPoPOpenMPRead(i32 16396, i64 %8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  %9 = load i32, i32* %x, align 4, !dbg !27
  %10 = ptrtoint i32* %Ehsan to i64
  call void @__DiscoPoPOpenMPWrite(i32 16396, i64 %10, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0))
  store i32 %9, i32* %Ehsan, align 4, !dbg !28
  %11 = ptrtoint i32* %hasan to i64
  call void @__DiscoPoPOpenMPRead(i32 16397, i64 %11, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i32 0, i32 0))
  %12 = load i32, i32* %hasan, align 4, !dbg !29
  %13 = ptrtoint i32* %Ehsan to i64
  call void @__DiscoPoPOpenMPWrite(i32 16397, i64 %13, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i32 0, i32 0))
  store i32 %12, i32* %Ehsan, align 4, !dbg !30
  %14 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !31
  %15 = ptrtoint i8** %14 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16399, i64 %15, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.10, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %14, align 8, !dbg !31
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* %.kmpc_loc.addr, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, [20 x i32]*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), [20 x i32]* %a, i32* %b, i32* %x), !dbg !31
  %16 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !32
  %17 = ptrtoint i8** %16 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16406, i64 %17, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.11, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @4, i32 0, i32 0), i8** %16, align 8, !dbg !32
  call void @__kmpc_barrier(%ident_t* %.kmpc_loc.addr, i32 %3), !dbg !32
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0)), !dbg !33
  call void @__DiscoPoPOpenMPFinalize()
  ret i32 0, !dbg !34
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., [20 x i32]* dereferenceable(80) %a, i32* dereferenceable(4) %b, i32* dereferenceable(4) %x) #0 !dbg !35 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %a.addr = alloca [20 x i32]*, align 8
  %b.addr = alloca i32*, align 8
  %x.addr = alloca i32*, align 8
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
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !43, metadata !14), !dbg !44
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !45, metadata !14), !dbg !44
  store [20 x i32]* %a, [20 x i32]** %a.addr, align 8
  call void @llvm.dbg.declare(metadata [20 x i32]** %a.addr, metadata !46, metadata !14), !dbg !44
  store i32* %b, i32** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %b.addr, metadata !47, metadata !14), !dbg !44
  store i32* %x, i32** %x.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !48, metadata !14), !dbg !44
  %2 = ptrtoint [20 x i32]** %a.addr to i64
  call void @__DiscoPoPOpenMPRead(i32 16400, i64 %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0))
  %3 = load [20 x i32]*, [20 x i32]** %a.addr, align 8, !dbg !49
  %4 = ptrtoint i32** %b.addr to i64
  call void @__DiscoPoPOpenMPRead(i32 16400, i64 %4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i32 0, i32 0))
  %5 = load i32*, i32** %b.addr, align 8, !dbg !49
  %6 = ptrtoint i32** %x.addr to i64
  call void @__DiscoPoPOpenMPRead(i32 16400, i64 %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14, i32 0, i32 0))
  %7 = load i32*, i32** %x.addr, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !50, metadata !14), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !51, metadata !14), !dbg !44
  %8 = ptrtoint i32* %.omp.lb to i64
  call void @__DiscoPoPOpenMPWrite(i32 16400, i64 %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.15, i32 0, i32 0))
  store i32 0, i32* %.omp.lb, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !53, metadata !14), !dbg !44
  %9 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPWrite(i32 16400, i64 %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.16, i32 0, i32 0))
  store i32 19, i32* %.omp.ub, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !54, metadata !14), !dbg !44
  %10 = ptrtoint i32* %.omp.stride to i64
  call void @__DiscoPoPOpenMPWrite(i32 16400, i64 %10, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.17, i32 0, i32 0))
  store i32 1, i32* %.omp.stride, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !55, metadata !14), !dbg !44
  %11 = ptrtoint i32* %.omp.is_last to i64
  call void @__DiscoPoPOpenMPWrite(i32 16400, i64 %11, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.18, i32 0, i32 0))
  store i32 0, i32* %.omp.is_last, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %i, metadata !56, metadata !14), !dbg !44
  %12 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !49
  %13 = ptrtoint i8** %12 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16400, i64 %13, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.19, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %12, align 8, !dbg !49
  %14 = ptrtoint i32** %.global_tid..addr to i64
  call void @__DiscoPoPOpenMPRead(i32 16400, i64 %14, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.20, i32 0, i32 0))
  %15 = load i32*, i32** %.global_tid..addr, align 8, !dbg !49
  %16 = ptrtoint i32* %15 to i64
  call void @__DiscoPoPOpenMPRead(i32 16400, i64 %16, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.21, i32 0, i32 0))
  %17 = load i32, i32* %15, align 4, !dbg !49
  call void @__kmpc_for_static_init_4(%ident_t* %.kmpc_loc.addr, i32 %17, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !49
  %18 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPRead(i32 16400, i64 %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.22, i32 0, i32 0))
  %19 = load i32, i32* %.omp.ub, align 4, !dbg !52
  %cmp = icmp sgt i32 %19, 19, !dbg !52
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !52

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !57

cond.false:                                       ; preds = %entry
  %20 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPRead(i32 16400, i64 %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.23, i32 0, i32 0))
  %21 = load i32, i32* %.omp.ub, align 4, !dbg !59
  br label %cond.end, !dbg !59

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 19, %cond.true ], [ %21, %cond.false ], !dbg !61
  %22 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPWrite(i32 16400, i64 %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0))
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !61
  %23 = ptrtoint i32* %.omp.lb to i64
  call void @__DiscoPoPOpenMPRead(i32 16400, i64 %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.25, i32 0, i32 0))
  %24 = load i32, i32* %.omp.lb, align 4, !dbg !61
  %25 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPWrite(i32 16400, i64 %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.26, i32 0, i32 0))
  store i32 %24, i32* %.omp.iv, align 4, !dbg !61
  br label %omp.inner.for.cond, !dbg !63

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %26 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPRead(i32 16400, i64 %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.27, i32 0, i32 0))
  %27 = load i32, i32* %.omp.iv, align 4, !dbg !64
  %28 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPRead(i32 16400, i64 %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.28, i32 0, i32 0))
  %29 = load i32, i32* %.omp.ub, align 4, !dbg !64
  %cmp1 = icmp sle i32 %27, %29, !dbg !44
  br i1 %cmp1, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !66

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %30 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPRead(i32 16400, i64 %30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.29, i32 0, i32 0))
  %31 = load i32, i32* %.omp.iv, align 4, !dbg !67
  %mul = mul nsw i32 %31, 1, !dbg !69
  %add = add nsw i32 0, %mul, !dbg !69
  %32 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPWrite(i32 16400, i64 %32, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30, i32 0, i32 0))
  store i32 %add, i32* %i, align 4, !dbg !69
  %33 = ptrtoint i32* %5 to i64
  call void @__DiscoPoPOpenMPRead(i32 16402, i64 %33, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.31, i32 0, i32 0))
  %34 = load i32, i32* %5, align 4, !dbg !70
  %35 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPRead(i32 16402, i64 %35, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.32, i32 0, i32 0))
  %36 = load i32, i32* %i, align 4, !dbg !72
  %add2 = add nsw i32 %34, %36, !dbg !73
  %37 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPRead(i32 16402, i64 %37, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.33, i32 0, i32 0))
  %38 = load i32, i32* %i, align 4, !dbg !74
  %idxprom = sext i32 %38 to i64, !dbg !75
  %arrayidx = getelementptr inbounds [20 x i32], [20 x i32]* %3, i64 0, i64 %idxprom, !dbg !75
  %39 = ptrtoint i32* %arrayidx to i64
  call void @__DiscoPoPOpenMPWrite(i32 16402, i64 %39, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.34, i32 0, i32 0))
  store i32 %add2, i32* %arrayidx, align 4, !dbg !76
  %40 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !77
  %41 = ptrtoint i8** %40 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16403, i64 %41, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.35, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0), i8** %40, align 8, !dbg !77
  call void @__kmpc_critical(%ident_t* %.kmpc_loc.addr, i32 %17, [8 x i32]* @.gomp_critical_user_.var), !dbg !77
  %42 = ptrtoint i32* %7 to i64
  call void @__DiscoPoPOpenMPRead(i32 16404, i64 %42, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i32 0, i32 0))
  %43 = load i32, i32* %7, align 4, !dbg !78
  %inc = add nsw i32 %43, 1, !dbg !78
  %44 = ptrtoint i32* %7 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16404, i64 %44, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.37, i32 0, i32 0))
  store i32 %inc, i32* %7, align 4, !dbg !78
  call void @__kmpc_end_critical(%ident_t* %.kmpc_loc.addr, i32 %17, [8 x i32]* @.gomp_critical_user_.var), !dbg !80
  br label %omp.body.continue, !dbg !81

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !82

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %45 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPRead(i32 16400, i64 %45, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i32 0, i32 0))
  %46 = load i32, i32* %.omp.iv, align 4, !dbg !83
  %add3 = add nsw i32 %46, 1, !dbg !85
  store i32 %add3, i32* %.omp.iv, align 4, !dbg !85
  br label %omp.inner.for.cond, !dbg !86, !llvm.loop !87

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !88

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  %47 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !89
  %48 = ptrtoint i8** %47 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16399, i64 %48, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.39, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @3, i32 0, i32 0), i8** %47, align 8, !dbg !89
  call void @__kmpc_for_static_fini(%ident_t* %.kmpc_loc.addr, i32 %17), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare void @__kmpc_for_static_init_4(%ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare void @__kmpc_end_critical(%ident_t*, i32, [8 x i32]*)

declare void @__kmpc_critical(%ident_t*, i32, [8 x i32]*)

declare void @__kmpc_for_static_fini(%ident_t*, i32)

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

declare i32 @__kmpc_global_thread_num(%ident_t*)

declare void @__kmpc_barrier(%ident_t*, i32)

declare i32 @printf(i8*, ...) #3

declare void @__DiscoPoPOpenMPInitialize()

declare void @__DiscoPoPOpenMPFinalize()

declare void @__DiscoPoPOpenMPRead(i32, i64, i8*)

declare void @__DiscoPoPOpenMPWrite(i32, i64, i8*)

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.1 (tags/RELEASE_391/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3)
!1 = !DIFile(filename: "sourcefile.c", directory: "/home/amiryousefi/MasterThesis/Codes")
!2 = !{}
!3 = !{!4}
!4 = distinct !DIGlobalVariable(name: "n", scope: !0, file: !1, line: 4, type: !5, isLocal: false, isDefinition: true, variable: i32* @n)
!5 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!6 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !11, isLocal: false, isDefinition: true, scopeLine: 6, isOptimized: false, unit: !0, variables: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!6}
!13 = !DILocalVariable(name: "Ehsan", scope: !10, file: !1, line: 7, type: !6)
!14 = !DIExpression()
!15 = !DILocation(line: 7, column: 6, scope: !10)
!16 = !DILocalVariable(name: "a", scope: !10, file: !1, line: 8, type: !17)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 640, align: 32, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 20)
!20 = !DILocation(line: 8, column: 6, scope: !10)
!21 = !DILocalVariable(name: "b", scope: !10, file: !1, line: 9, type: !6)
!22 = !DILocation(line: 9, column: 6, scope: !10)
!23 = !DILocalVariable(name: "x", scope: !10, file: !1, line: 10, type: !6)
!24 = !DILocation(line: 10, column: 6, scope: !10)
!25 = !DILocalVariable(name: "hasan", scope: !10, file: !1, line: 11, type: !6)
!26 = !DILocation(line: 11, column: 6, scope: !10)
!27 = !DILocation(line: 12, column: 8, scope: !10)
!28 = !DILocation(line: 12, column: 7, scope: !10)
!29 = !DILocation(line: 13, column: 8, scope: !10)
!30 = !DILocation(line: 13, column: 7, scope: !10)
!31 = !DILocation(line: 15, column: 10, scope: !10)
!32 = !DILocation(line: 22, column: 10, scope: !10)
!33 = !DILocation(line: 23, column: 1, scope: !10)
!34 = !DILocation(line: 24, column: 1, scope: !10)
!35 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 15, type: !36, isLocal: true, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !38, !38, !41, !42, !42}
!38 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !39)
!39 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !40)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!41 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !17, size: 64, align: 64)
!42 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !6, size: 64, align: 64)
!43 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !35, type: !38, flags: DIFlagArtificial | DIFlagObjectPointer)
!44 = !DILocation(line: 0, scope: !35)
!45 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !35, type: !38, flags: DIFlagArtificial)
!46 = !DILocalVariable(name: "a", arg: 3, scope: !35, type: !41, flags: DIFlagArtificial)
!47 = !DILocalVariable(name: "b", arg: 4, scope: !35, type: !42, flags: DIFlagArtificial)
!48 = !DILocalVariable(name: "x", arg: 5, scope: !35, type: !42, flags: DIFlagArtificial)
!49 = !DILocation(line: 16, column: 2, scope: !35)
!50 = !DILocalVariable(name: ".omp.iv", scope: !35, type: !6, flags: DIFlagArtificial)
!51 = !DILocalVariable(name: ".omp.lb", scope: !35, type: !6, flags: DIFlagArtificial)
!52 = !DILocation(line: 16, column: 7, scope: !35)
!53 = !DILocalVariable(name: ".omp.ub", scope: !35, type: !6, flags: DIFlagArtificial)
!54 = !DILocalVariable(name: ".omp.stride", scope: !35, type: !6, flags: DIFlagArtificial)
!55 = !DILocalVariable(name: ".omp.is_last", scope: !35, type: !6, flags: DIFlagArtificial)
!56 = !DILocalVariable(name: "i", scope: !35, type: !6, flags: DIFlagArtificial)
!57 = !DILocation(line: 16, column: 7, scope: !58)
!58 = !DILexicalBlockFile(scope: !35, file: !1, discriminator: 1)
!59 = !DILocation(line: 16, column: 7, scope: !60)
!60 = !DILexicalBlockFile(scope: !35, file: !1, discriminator: 2)
!61 = !DILocation(line: 16, column: 7, scope: !62)
!62 = !DILexicalBlockFile(scope: !35, file: !1, discriminator: 3)
!63 = !DILocation(line: 16, column: 2, scope: !62)
!64 = !DILocation(line: 16, column: 7, scope: !65)
!65 = !DILexicalBlockFile(scope: !35, file: !1, discriminator: 4)
!66 = !DILocation(line: 16, column: 2, scope: !65)
!67 = !DILocation(line: 16, column: 7, scope: !68)
!68 = !DILexicalBlockFile(scope: !35, file: !1, discriminator: 5)
!69 = !DILocation(line: 16, column: 25, scope: !68)
!70 = !DILocation(line: 18, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !35, file: !1, line: 17, column: 2)
!72 = !DILocation(line: 18, column: 10, scope: !71)
!73 = !DILocation(line: 18, column: 9, scope: !71)
!74 = !DILocation(line: 18, column: 5, scope: !71)
!75 = !DILocation(line: 18, column: 3, scope: !71)
!76 = !DILocation(line: 18, column: 7, scope: !71)
!77 = !DILocation(line: 19, column: 11, scope: !71)
!78 = !DILocation(line: 20, column: 4, scope: !79)
!79 = distinct !DILexicalBlock(scope: !71, file: !1, line: 19, column: 11)
!80 = !DILocation(line: 20, column: 3, scope: !79)
!81 = !DILocation(line: 21, column: 2, scope: !71)
!82 = !DILocation(line: 15, column: 10, scope: !35)
!83 = !DILocation(line: 16, column: 7, scope: !84)
!84 = !DILexicalBlockFile(scope: !35, file: !1, discriminator: 6)
!85 = !DILocation(line: 0, scope: !58)
!86 = !DILocation(line: 15, column: 10, scope: !58)
!87 = distinct !{!87, !49}
!88 = !DILocation(line: 15, column: 10, scope: !60)
!89 = !DILocation(line: 15, column: 10, scope: !62)
!90 = !DILocation(line: 21, column: 2, scope: !58)
