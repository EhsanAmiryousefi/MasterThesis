; ModuleID = '<stdin>'
source_filename = "sourcefile.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;38;10;;\00"
@2 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;38;43;;\00"
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer
@N = constant i32 1000000, align 4
@.str.1 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.2 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@3 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.3 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@4 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.4 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@5 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.5 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@6 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.6 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@7 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.7 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@8 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.8 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@9 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.9 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@10 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.10 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@11 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.11 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@12 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.12 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@13 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.13 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@14 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.14 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@15 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.15 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@16 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.16 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@17 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.17 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@18 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.18 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@19 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.19 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@20 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.20 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@21 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.21 = private unnamed_addr constant [30 x i8] c".omp.reduction.reduction_func\00"
@.str.22 = private unnamed_addr constant [30 x i8] c".omp.reduction.reduction_func\00"
@.str.23 = private unnamed_addr constant [30 x i8] c".omp.reduction.reduction_func\00"
@.str.24 = private unnamed_addr constant [30 x i8] c".omp.reduction.reduction_func\00"
@.str.25 = private unnamed_addr constant [30 x i8] c".omp.reduction.reduction_func\00"
@22 = private unnamed_addr constant [5 x i8] c".str\00"
@.str.26 = private unnamed_addr constant [30 x i8] c".omp.reduction.reduction_func\00"
@23 = private unnamed_addr constant [5 x i8] c".str\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !10 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca [1000000 x i32], align 16
  %sum = alloca i32, align 4
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  %2 = ptrtoint i32* %retval to i64
  store i32 0, i32* %retval, align 4
  call void @__DiscoPoPOpenMPInitialize()
  call void @llvm.dbg.declare(metadata i32* %i, metadata !13, metadata !14), !dbg !15
  call void @llvm.dbg.declare(metadata [1000000 x i32]* %a, metadata !16, metadata !14), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !21, metadata !14), !dbg !22
  %3 = ptrtoint i32* %sum to i64
  store i32 0, i32* %sum, align 4, !dbg !22
  %4 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !23
  %5 = ptrtoint i8** %4 to i64
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %4, align 8, !dbg !23
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* %.kmpc_loc.addr, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*, [1000000 x i32]*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %i, i32* %sum, [1000000 x i32]* %a), !dbg !23
  call void @__DiscoPoPOpenMPFinalize()
  ret i32 0, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %i, i32* dereferenceable(4) %sum, [1000000 x i32]* dereferenceable(4000000) %a) #0 !dbg !25 !omp.region.ID !33 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %i.addr = alloca i32*, align 8
  %sum.addr = alloca i32*, align 8
  %a.addr = alloca [1000000 x i32]*, align 8
  %.omp.iv = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %sum1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  %.omp.reduction.red_list = alloca [1 x i8*], align 8
  %2 = ptrtoint i32** %.global_tid..addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %2)
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !34, metadata !14), !dbg !35
  %3 = ptrtoint i32** %.bound_tid..addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %3)
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !36, metadata !14), !dbg !35
  %4 = ptrtoint i32** %i.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %4)
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !37, metadata !14), !dbg !35
  %5 = ptrtoint i32** %sum.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %5)
  store i32* %sum, i32** %sum.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %sum.addr, metadata !38, metadata !14), !dbg !35
  %6 = ptrtoint [1000000 x i32]** %a.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %6)
  store [1000000 x i32]* %a, [1000000 x i32]** %a.addr, align 8
  call void @llvm.dbg.declare(metadata [1000000 x i32]** %a.addr, metadata !39, metadata !14), !dbg !35
  %7 = ptrtoint i32** %i.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i32 0, i32 -1, i32 8)
  %8 = load i32*, i32** %i.addr, align 8, !dbg !40
  %9 = ptrtoint i32** %sum.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %9, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @3, i32 0, i32 0), i32 1, i32 -1, i32 8)
  %10 = load i32*, i32** %sum.addr, align 8, !dbg !40
  %11 = ptrtoint [1000000 x i32]** %a.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %11, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @4, i32 0, i32 0), i32 1, i32 -1, i32 8)
  %12 = load [1000000 x i32]*, [1000000 x i32]** %a.addr, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !41, metadata !14), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !42, metadata !14), !dbg !35
  %13 = ptrtoint i32* %.omp.lb to i64
  call void @__DiscoPoPOpenMPWrite(i64 %13)
  store i32 0, i32* %.omp.lb, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !44, metadata !14), !dbg !35
  %14 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPWrite(i64 %14)
  store i32 999999, i32* %.omp.ub, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !45, metadata !14), !dbg !35
  %15 = ptrtoint i32* %.omp.stride to i64
  call void @__DiscoPoPOpenMPWrite(i64 %15)
  store i32 1, i32* %.omp.stride, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !46, metadata !14), !dbg !35
  %16 = ptrtoint i32* %.omp.is_last to i64
  call void @__DiscoPoPOpenMPWrite(i64 %16)
  store i32 0, i32* %.omp.is_last, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %sum1, metadata !47, metadata !14), !dbg !35
  %17 = ptrtoint i32* %sum1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %17)
  store i32 0, i32* %sum1, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !49, metadata !14), !dbg !35
  %18 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !40
  %19 = ptrtoint i8** %18 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %19)
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %18, align 8, !dbg !40
  %20 = ptrtoint i32** %.global_tid..addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %20, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @5, i32 0, i32 0), i32 1, i32 -1, i32 8)
  %21 = load i32*, i32** %.global_tid..addr, align 8, !dbg !40
  %22 = ptrtoint i32* %21 to i64
  call void @__DiscoPoPOpenMPRead(i64 %22, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %23 = load i32, i32* %21, align 4, !dbg !40
  call void @__kmpc_for_static_init_4(%ident_t* %.kmpc_loc.addr, i32 %23, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !40
  %24 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPRead(i64 %24, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @7, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %25 = load i32, i32* %.omp.ub, align 4, !dbg !43
  %cmp = icmp sgt i32 %25, 999999, !dbg !43
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !43

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !50

cond.false:                                       ; preds = %entry
  %26 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPRead(i64 %26, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @8, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %27 = load i32, i32* %.omp.ub, align 4, !dbg !52
  br label %cond.end, !dbg !52

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 999999, %cond.true ], [ %27, %cond.false ], !dbg !54
  %28 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPWrite(i64 %28)
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !54
  %29 = ptrtoint i32* %.omp.lb to i64
  call void @__DiscoPoPOpenMPRead(i64 %29, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @9, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %30 = load i32, i32* %.omp.lb, align 4, !dbg !54
  %31 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPWrite(i64 %31)
  store i32 %30, i32* %.omp.iv, align 4, !dbg !54
  br label %omp.inner.for.cond, !dbg !56

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %32 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPRead(i64 %32, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @10, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %33 = load i32, i32* %.omp.iv, align 4, !dbg !57
  %34 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPRead(i64 %34, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @11, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %35 = load i32, i32* %.omp.ub, align 4, !dbg !57
  %cmp3 = icmp sle i32 %33, %35, !dbg !35
  br i1 %cmp3, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !59

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %36 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPRead(i64 %36, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @12, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %37 = load i32, i32* %.omp.iv, align 4, !dbg !60
  %mul = mul nsw i32 %37, 1, !dbg !62
  %add = add nsw i32 0, %mul, !dbg !62
  %38 = ptrtoint i32* %i2 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %38)
  store i32 %add, i32* %i2, align 4, !dbg !62
  %39 = ptrtoint i32* %i2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %39, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %40 = load i32, i32* %i2, align 4, !dbg !63
  %idxprom = sext i32 %40 to i64, !dbg !65
  %arrayidx = getelementptr inbounds [1000000 x i32], [1000000 x i32]* %12, i64 0, i64 %idxprom, !dbg !65
  %41 = ptrtoint i32* %arrayidx to i64
  call void @__DiscoPoPOpenMPRead(i64 %41, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %42 = load i32, i32* %arrayidx, align 4, !dbg !65
  %43 = ptrtoint i32* %sum1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %43, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @15, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %44 = load i32, i32* %sum1, align 4, !dbg !66
  %add4 = add nsw i32 %44, %42, !dbg !66
  %45 = ptrtoint i32* %sum1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %45)
  store i32 %add4, i32* %sum1, align 4, !dbg !66
  %46 = ptrtoint i32* %sum1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %46, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @16, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %47 = load i32, i32* %sum1, align 4, !dbg !67
  %48 = ptrtoint i32* %i2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %48, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @17, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %49 = load i32, i32* %i2, align 4, !dbg !68
  %idxprom5 = sext i32 %49 to i64, !dbg !69
  %arrayidx6 = getelementptr inbounds [1000000 x i32], [1000000 x i32]* %12, i64 0, i64 %idxprom5, !dbg !69
  %50 = ptrtoint i32* %arrayidx6 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %50)
  store i32 %47, i32* %arrayidx6, align 4, !dbg !70
  br label %omp.body.continue, !dbg !71

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !72

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %51 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPRead(i64 %51, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @18, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %52 = load i32, i32* %.omp.iv, align 4, !dbg !73
  %add7 = add nsw i32 %52, 1, !dbg !75
  %53 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPWrite(i64 %53)
  store i32 %add7, i32* %.omp.iv, align 4, !dbg !75
  br label %omp.inner.for.cond, !dbg !76, !llvm.loop !77

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !78

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  %54 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !79
  %55 = ptrtoint i8** %54 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %55)
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0), i8** %54, align 8, !dbg !79
  call void @__kmpc_for_static_fini(%ident_t* %.kmpc_loc.addr, i32 %23), !dbg !79
  %56 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list, i64 0, i64 0, !dbg !79
  %57 = bitcast i32* %sum1 to i8*, !dbg !79
  %58 = ptrtoint i8** %56 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %58)
  store i8* %57, i8** %56, align 8, !dbg !79
  %59 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !79
  %60 = ptrtoint i8** %59 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %60)
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0), i8** %59, align 8, !dbg !79
  %61 = bitcast [1 x i8*]* %.omp.reduction.red_list to i8*, !dbg !79
  %62 = call i32 @__kmpc_reduce_nowait(%ident_t* %.kmpc_loc.addr, i32 %23, i32 1, i64 8, i8* %61, void (i8*, i8*)* @.omp.reduction.reduction_func, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !80
  switch i32 %62, label %.omp.reduction.default [
    i32 1, label %.omp.reduction.case1
    i32 2, label %.omp.reduction.case2
  ], !dbg !79

.omp.reduction.case1:                             ; preds = %omp.loop.exit
  %63 = ptrtoint i32* %10 to i64
  call void @__DiscoPoPOpenMPRead(i64 %63, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @19, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %64 = load i32, i32* %10, align 4, !dbg !82
  %65 = ptrtoint i32* %sum1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %65, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @20, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %66 = load i32, i32* %sum1, align 4, !dbg !82
  %add8 = add nsw i32 %64, %66, !dbg !83
  %67 = ptrtoint i32* %10 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %67)
  store i32 %add8, i32* %10, align 4, !dbg !83
  call void @__kmpc_end_reduce_nowait(%ident_t* %.kmpc_loc.addr, i32 %23, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !84
  br label %.omp.reduction.default, !dbg !84

.omp.reduction.case2:                             ; preds = %omp.loop.exit
  %68 = ptrtoint i32* %sum1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %68, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @21, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %69 = load i32, i32* %sum1, align 4, !dbg !85
  %70 = atomicrmw add i32* %10, i32 %69 monotonic, !dbg !86
  br label %.omp.reduction.default, !dbg !86

.omp.reduction.default:                           ; preds = %.omp.reduction.case2, %.omp.reduction.case1, %omp.loop.exit
  ret void, !dbg !87
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare void @__kmpc_for_static_init_4(%ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare void @__kmpc_for_static_fini(%ident_t*, i32)

; Function Attrs: nounwind uwtable
define internal void @.omp.reduction.reduction_func(i8*, i8*) #0 !dbg !88 !omp.region.ID !90 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i8*, align 8
  %2 = ptrtoint i8** %.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %2)
  store i8* %0, i8** %.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr, metadata !91, metadata !14), !dbg !93
  %3 = ptrtoint i8** %.addr1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %3)
  store i8* %1, i8** %.addr1, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr1, metadata !94, metadata !14), !dbg !93
  %4 = ptrtoint i8** %.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %4, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.21, i32 0, i32 0), i32 0, i32 -1, i32 8)
  %5 = load i8*, i8** %.addr, align 8
  %6 = bitcast i8* %5 to [1 x i8*]*
  %7 = ptrtoint i8** %.addr1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %7, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.22, i32 0, i32 0), i32 1, i32 -1, i32 8)
  %8 = load i8*, i8** %.addr1, align 8
  %9 = bitcast i8* %8 to [1 x i8*]*
  %10 = getelementptr inbounds [1 x i8*], [1 x i8*]* %9, i64 0, i64 0
  %11 = ptrtoint i8** %10 to i64
  call void @__DiscoPoPOpenMPRead(i64 %11, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23, i32 0, i32 0), i32 1, i32 -1, i32 8)
  %12 = load i8*, i8** %10, align 8
  %13 = bitcast i8* %12 to i32*
  %14 = getelementptr inbounds [1 x i8*], [1 x i8*]* %6, i64 0, i64 0
  %15 = ptrtoint i8** %14 to i64
  call void @__DiscoPoPOpenMPRead(i64 %15, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.24, i32 0, i32 0), i32 1, i32 -1, i32 8)
  %16 = load i8*, i8** %14, align 8
  %17 = bitcast i8* %16 to i32*
  %18 = ptrtoint i32* %17 to i64
  call void @__DiscoPoPOpenMPRead(i64 %18, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @22, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %19 = load i32, i32* %17, align 4, !dbg !95
  %20 = ptrtoint i32* %13 to i64
  call void @__DiscoPoPOpenMPRead(i64 %20, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @23, i32 0, i32 0), i32 1, i32 -1, i32 4)
  %21 = load i32, i32* %13, align 4, !dbg !95
  %add = add nsw i32 %19, %21, !dbg !96
  %22 = ptrtoint i32* %17 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %22)
  store i32 %add, i32* %17, align 4, !dbg !96
  ret void, !dbg !95
}

declare i32 @__kmpc_reduce_nowait(%ident_t*, i32, i32, i64, i8*, void (i8*, i8*)*, [8 x i32]*)

declare void @__kmpc_end_reduce_nowait(%ident_t*, i32, [8 x i32]*)

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

declare void @__DiscoPoPOpenMPInitialize()

declare void @__CollectThreadInfo()

declare void @__DiscoPoPOpenMPFinalize()

declare void @__DiscoPoPOpenMPRead(i64, i8*, i32, i32, i32)

declare void @__DiscoPoPOpenMPWrite(i64)

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.1 (tags/RELEASE_391/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3)
!1 = !DIFile(filename: "sourcefile.c", directory: "/home/amiryousefi/MasterThesis/Codes")
!2 = !{}
!3 = !{!4}
!4 = distinct !DIGlobalVariable(name: "N", scope: !0, file: !1, line: 4, type: !5, isLocal: false, isDefinition: true, variable: i32* @N)
!5 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!6 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !11, isLocal: false, isDefinition: true, scopeLine: 6, isOptimized: false, unit: !0, variables: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!6}
!13 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 34, type: !6)
!14 = !DIExpression()
!15 = !DILocation(line: 34, column: 6, scope: !10)
!16 = !DILocalVariable(name: "a", scope: !10, file: !1, line: 35, type: !17)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32000000, align: 32, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 1000000)
!20 = !DILocation(line: 35, column: 6, scope: !10)
!21 = !DILocalVariable(name: "sum", scope: !10, file: !1, line: 36, type: !6)
!22 = !DILocation(line: 36, column: 6, scope: !10)
!23 = !DILocation(line: 38, column: 10, scope: !10)
!24 = !DILocation(line: 45, column: 1, scope: !10)
!25 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 38, type: !26, isLocal: true, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !28, !28, !31, !31, !32}
!28 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!31 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !6, size: 64, align: 64)
!32 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !17, size: 64, align: 64)
!33 = !{i32 0}
!34 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !25, type: !28, flags: DIFlagArtificial | DIFlagObjectPointer)
!35 = !DILocation(line: 0, scope: !25)
!36 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !25, type: !28, flags: DIFlagArtificial)
!37 = !DILocalVariable(name: "i", arg: 3, scope: !25, type: !31, flags: DIFlagArtificial)
!38 = !DILocalVariable(name: "sum", arg: 4, scope: !25, type: !31, flags: DIFlagArtificial)
!39 = !DILocalVariable(name: "a", arg: 5, scope: !25, type: !32, flags: DIFlagArtificial)
!40 = !DILocation(line: 39, column: 2, scope: !25)
!41 = !DILocalVariable(name: ".omp.iv", scope: !25, type: !6, flags: DIFlagArtificial)
!42 = !DILocalVariable(name: ".omp.lb", scope: !25, type: !6, flags: DIFlagArtificial)
!43 = !DILocation(line: 39, column: 7, scope: !25)
!44 = !DILocalVariable(name: ".omp.ub", scope: !25, type: !6, flags: DIFlagArtificial)
!45 = !DILocalVariable(name: ".omp.stride", scope: !25, type: !6, flags: DIFlagArtificial)
!46 = !DILocalVariable(name: ".omp.is_last", scope: !25, type: !6, flags: DIFlagArtificial)
!47 = !DILocalVariable(name: "sum", scope: !25, type: !6, flags: DIFlagArtificial)
!48 = !DILocation(line: 38, column: 39, scope: !25)
!49 = !DILocalVariable(name: "i", scope: !25, type: !6, flags: DIFlagArtificial)
!50 = !DILocation(line: 39, column: 7, scope: !51)
!51 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 1)
!52 = !DILocation(line: 39, column: 7, scope: !53)
!53 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 2)
!54 = !DILocation(line: 39, column: 7, scope: !55)
!55 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 3)
!56 = !DILocation(line: 39, column: 2, scope: !55)
!57 = !DILocation(line: 39, column: 7, scope: !58)
!58 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 4)
!59 = !DILocation(line: 39, column: 2, scope: !58)
!60 = !DILocation(line: 39, column: 7, scope: !61)
!61 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 5)
!62 = !DILocation(line: 39, column: 19, scope: !61)
!63 = !DILocation(line: 40, column: 12, scope: !64)
!64 = distinct !DILexicalBlock(scope: !25, file: !1, line: 39, column: 24)
!65 = !DILocation(line: 40, column: 10, scope: !64)
!66 = !DILocation(line: 40, column: 7, scope: !64)
!67 = !DILocation(line: 41, column: 8, scope: !64)
!68 = !DILocation(line: 41, column: 5, scope: !64)
!69 = !DILocation(line: 41, column: 3, scope: !64)
!70 = !DILocation(line: 41, column: 7, scope: !64)
!71 = !DILocation(line: 42, column: 2, scope: !64)
!72 = !DILocation(line: 38, column: 10, scope: !51)
!73 = !DILocation(line: 39, column: 7, scope: !74)
!74 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 6)
!75 = !DILocation(line: 0, scope: !51)
!76 = !DILocation(line: 38, column: 10, scope: !53)
!77 = distinct !{!77, !40}
!78 = !DILocation(line: 38, column: 10, scope: !55)
!79 = !DILocation(line: 38, column: 10, scope: !58)
!80 = !DILocation(line: 38, column: 10, scope: !81)
!81 = !DILexicalBlockFile(scope: !58, file: !1, discriminator: 7)
!82 = !DILocation(line: 38, column: 39, scope: !61)
!83 = !DILocation(line: 38, column: 37, scope: !61)
!84 = !DILocation(line: 38, column: 10, scope: !61)
!85 = !DILocation(line: 38, column: 39, scope: !74)
!86 = !DILocation(line: 38, column: 10, scope: !74)
!87 = !DILocation(line: 42, column: 2, scope: !51)
!88 = distinct !DISubprogram(linkageName: ".omp.reduction.reduction_func", scope: !1, file: !1, type: !89, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !0, variables: !2)
!89 = !DISubroutineType(types: !2)
!90 = !{i32 1}
!91 = !DILocalVariable(arg: 1, scope: !88, type: !92, flags: DIFlagArtificial | DIFlagObjectPointer)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!93 = !DILocation(line: 0, scope: !88)
!94 = !DILocalVariable(arg: 2, scope: !88, type: !92, flags: DIFlagArtificial)
!95 = !DILocation(line: 38, column: 39, scope: !88)
!96 = !DILocation(line: 38, column: 37, scope: !88)
