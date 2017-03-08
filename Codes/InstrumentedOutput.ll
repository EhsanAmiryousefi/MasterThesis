; ModuleID = '<stdin>'
source_filename = "sourcefile.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;24;19;;\00"
@.gomp_critical_user_.var = common global [8 x i32] zeroinitializer
@2 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;31;21;;\00"
@3 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;31;45;;\00"
@4 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;22;17;;\00"
@5 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;15;13;;\00"
@.str.1 = private unnamed_addr constant [12 x i8] c"Main Thread\00"
@.str.2 = private unnamed_addr constant [79 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::__kmpc_fork_call line: 0:15\00"
@.str.3 = private unnamed_addr constant [12 x i8] c"Main Thread\00"
@.str.4 = private unnamed_addr constant [79 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::__kmpc_fork_call line: 0:22\00"
@.str.5 = private unnamed_addr constant [12 x i8] c"Main Thread\00"
@.str.6 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::__kmpc_critical line: 0:24\00"
@.str.7 = private unnamed_addr constant [12 x i8] c"Main Thread\00"
@.str.8 = private unnamed_addr constant [87 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::__kmpc_for_static_init_4 line: 0:31\00"
@.str.9 = private unnamed_addr constant [12 x i8] c"Main Thread\00"
@.str.10 = private unnamed_addr constant [85 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::__kmpc_for_static_fini line: 0:31\00"
@.str.11 = private unnamed_addr constant [12 x i8] c"Main Thread\00"
@.str.12 = private unnamed_addr constant [77 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::__kmpc_barrier line: 0:31\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !6 {
entry:
  call void @__DiscoPoPOpenMPInitialize()
  %retval = alloca i32, align 4
  %number = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca i32, align 4
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %number, metadata !10, metadata !11), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %i, metadata !13, metadata !11), !dbg !14
  call void @omp_set_num_threads(i32 4), !dbg !15
  call void @omp_set_nested(i32 1), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %a, metadata !17, metadata !11), !dbg !18
  %2 = ptrtoint i32* %a to i64
  call void @__DiscoPoPOpenMPWrite(i64 %2)
  store i32 10, i32* %a, align 4, !dbg !18
  %3 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !19
  %4 = ptrtoint i8** %3 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %4)
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @5, i32 0, i32 0), i8** %3, align 8, !dbg !19
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([79 x i8], [79 x i8]* @.str.2, i32 0, i32 0))
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* %.kmpc_loc.addr, i32 2, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %a, i32* %i), !dbg !19
  call void @__DiscoPoPOpenMPAfterCall()
  call void @__DiscoPoPOpenMPFinalize()
  ret i32 0, !dbg !20
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @omp_set_num_threads(i32) #2

declare void @omp_set_nested(i32) #2

; Function Attrs: nounwind uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %a, i32* dereferenceable(4) %i) #0 !dbg !21 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %a.addr = alloca i32*, align 8
  %i.addr = alloca i32*, align 8
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  %2 = ptrtoint i32** %.global_tid..addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %2)
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !28, metadata !11), !dbg !29
  %3 = ptrtoint i32** %.bound_tid..addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %3)
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !30, metadata !11), !dbg !29
  %4 = ptrtoint i32** %a.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %4)
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !31, metadata !11), !dbg !29
  %5 = ptrtoint i32** %i.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %5)
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !32, metadata !11), !dbg !29
  %6 = ptrtoint i32** %a.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %6, i32 8, i32 0, i32 0)
  %7 = load i32*, i32** %a.addr, align 8, !dbg !33
  %8 = ptrtoint i32** %i.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %8, i32 8, i32 0, i32 0)
  %9 = load i32*, i32** %i.addr, align 8, !dbg !33
  %10 = ptrtoint i32* %7 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %10)
  store i32 12, i32* %7, align 4, !dbg !34
  %11 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !36
  %12 = ptrtoint i8** %11 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %12)
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @4, i32 0, i32 0), i8** %11, align 8, !dbg !36
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([79 x i8], [79 x i8]* @.str.4, i32 0, i32 0))
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* %.kmpc_loc.addr, i32 2, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*)* @.omp_outlined..1 to void (i32*, i32*, ...)*), i32* %7, i32* %9), !dbg !36
  call void @__DiscoPoPOpenMPAfterCall()
  ret void, !dbg !37
}

; Function Attrs: nounwind uwtable
define internal void @.omp_outlined..1(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %a, i32* dereferenceable(4) %i) #0 !dbg !38 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %a.addr = alloca i32*, align 8
  %i.addr = alloca i32*, align 8
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  %.omp.iv = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %a1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %b = alloca i32, align 4
  %2 = ptrtoint i32** %.global_tid..addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %2)
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !39, metadata !11), !dbg !40
  %3 = ptrtoint i32** %.bound_tid..addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %3)
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !41, metadata !11), !dbg !40
  %4 = ptrtoint i32** %a.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %4)
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !42, metadata !11), !dbg !40
  %5 = ptrtoint i32** %i.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %5)
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !43, metadata !11), !dbg !40
  %6 = ptrtoint i32** %a.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %6, i32 8, i32 0, i32 0)
  %7 = load i32*, i32** %a.addr, align 8, !dbg !44
  %8 = ptrtoint i32** %i.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %8, i32 8, i32 0, i32 0)
  %9 = load i32*, i32** %i.addr, align 8, !dbg !44
  %10 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !45
  %11 = ptrtoint i8** %10 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %11)
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %10, align 8, !dbg !45
  %12 = ptrtoint i32** %.global_tid..addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %12, i32 8, i32 0, i32 0)
  %13 = load i32*, i32** %.global_tid..addr, align 8, !dbg !45
  %14 = ptrtoint i32* %13 to i64
  call void @__DiscoPoPOpenMPRead(i64 %14, i32 4, i32 0, i32 0)
  %15 = load i32, i32* %13, align 4, !dbg !45
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.6, i32 0, i32 0))
  call void @__kmpc_critical(%ident_t* %.kmpc_loc.addr, i32 %15, [8 x i32]* @.gomp_critical_user_.var), !dbg !45
  call void @__DiscoPoPOpenMPAfterCall()
  %16 = ptrtoint i32* %7 to i64
  call void @__DiscoPoPOpenMPRead(i64 %16, i32 4, i32 0, i32 0)
  %17 = load i32, i32* %7, align 4, !dbg !47
  %inc = add nsw i32 %17, 1, !dbg !47
  %18 = ptrtoint i32* %7 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %18)
  store i32 %inc, i32* %7, align 4, !dbg !47
  call void @__kmpc_end_critical(%ident_t* %.kmpc_loc.addr, i32 %15, [8 x i32]* @.gomp_critical_user_.var), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !50, metadata !11), !dbg !52
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !53, metadata !11), !dbg !52
  %19 = ptrtoint i32* %.omp.lb to i64
  call void @__DiscoPoPOpenMPWrite(i64 %19)
  store i32 0, i32* %.omp.lb, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !55, metadata !11), !dbg !52
  %20 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPWrite(i64 %20)
  store i32 19, i32* %.omp.ub, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !56, metadata !11), !dbg !52
  %21 = ptrtoint i32* %.omp.stride to i64
  call void @__DiscoPoPOpenMPWrite(i64 %21)
  store i32 1, i32* %.omp.stride, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !57, metadata !11), !dbg !52
  %22 = ptrtoint i32* %.omp.is_last to i64
  call void @__DiscoPoPOpenMPWrite(i64 %22)
  store i32 0, i32* %.omp.is_last, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata i32* %a1, metadata !58, metadata !11), !dbg !52
  %23 = ptrtoint i32* %7 to i64
  call void @__DiscoPoPOpenMPRead(i64 %23, i32 4, i32 0, i32 0)
  %24 = load i32, i32* %7, align 4, !dbg !59
  %25 = ptrtoint i32* %a1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %25)
  store i32 %24, i32* %a1, align 4, !dbg !59
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !60, metadata !11), !dbg !52
  %26 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !61
  %27 = ptrtoint i8** %26 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %27)
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0), i8** %26, align 8, !dbg !61
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([87 x i8], [87 x i8]* @.str.8, i32 0, i32 0))
  call void @__kmpc_for_static_init_4(%ident_t* %.kmpc_loc.addr, i32 %15, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !61
  call void @__DiscoPoPOpenMPAfterCall()
  %28 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPRead(i64 %28, i32 4, i32 0, i32 0)
  %29 = load i32, i32* %.omp.ub, align 4, !dbg !54
  %cmp = icmp sgt i32 %29, 19, !dbg !54
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !54

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !62

cond.false:                                       ; preds = %entry
  %30 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPRead(i64 %30, i32 4, i32 0, i32 0)
  %31 = load i32, i32* %.omp.ub, align 4, !dbg !64
  br label %cond.end, !dbg !64

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 19, %cond.true ], [ %31, %cond.false ], !dbg !66
  %32 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPWrite(i64 %32)
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !66
  %33 = ptrtoint i32* %.omp.lb to i64
  call void @__DiscoPoPOpenMPRead(i64 %33, i32 4, i32 0, i32 0)
  %34 = load i32, i32* %.omp.lb, align 4, !dbg !66
  %35 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPWrite(i64 %35)
  store i32 %34, i32* %.omp.iv, align 4, !dbg !66
  br label %omp.inner.for.cond, !dbg !68

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %36 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPRead(i64 %36, i32 4, i32 0, i32 0)
  %37 = load i32, i32* %.omp.iv, align 4, !dbg !70
  %38 = ptrtoint i32* %.omp.ub to i64
  call void @__DiscoPoPOpenMPRead(i64 %38, i32 4, i32 0, i32 0)
  %39 = load i32, i32* %.omp.ub, align 4, !dbg !70
  %cmp3 = icmp sle i32 %37, %39, !dbg !52
  br i1 %cmp3, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !72

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %40 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPRead(i64 %40, i32 4, i32 0, i32 0)
  %41 = load i32, i32* %.omp.iv, align 4, !dbg !74
  %mul = mul nsw i32 %41, 1, !dbg !76
  %add = add nsw i32 0, %mul, !dbg !76
  %42 = ptrtoint i32* %i2 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %42)
  store i32 %add, i32* %i2, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata i32* %b, metadata !77, metadata !11), !dbg !79
  %43 = ptrtoint i32* %a1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %43, i32 4, i32 0, i32 0)
  %44 = load i32, i32* %a1, align 4, !dbg !80
  %45 = ptrtoint i32* %b to i64
  call void @__DiscoPoPOpenMPWrite(i64 %45)
  store i32 %44, i32* %b, align 4, !dbg !79
  br label %omp.body.continue, !dbg !81

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !82

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %46 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPRead(i64 %46, i32 4, i32 0, i32 0)
  %47 = load i32, i32* %.omp.iv, align 4, !dbg !83
  %add4 = add nsw i32 %47, 1, !dbg !85
  %48 = ptrtoint i32* %.omp.iv to i64
  call void @__DiscoPoPOpenMPWrite(i64 %48)
  store i32 %add4, i32* %.omp.iv, align 4, !dbg !85
  br label %omp.inner.for.cond, !dbg !86, !llvm.loop !87

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !88

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  %49 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !89
  %50 = ptrtoint i8** %49 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %50)
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @3, i32 0, i32 0), i8** %49, align 8, !dbg !89
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.10, i32 0, i32 0))
  call void @__kmpc_for_static_fini(%ident_t* %.kmpc_loc.addr, i32 %15), !dbg !89
  call void @__DiscoPoPOpenMPAfterCall()
  %51 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !90
  %52 = ptrtoint i8** %51 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %52)
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0), i8** %51, align 8, !dbg !90
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.12, i32 0, i32 0))
  call void @__kmpc_barrier(%ident_t* %.kmpc_loc.addr, i32 %15), !dbg !91
  call void @__DiscoPoPOpenMPAfterCall()
  ret void, !dbg !93
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

declare void @__kmpc_end_critical(%ident_t*, i32, [8 x i32]*)

declare void @__kmpc_critical(%ident_t*, i32, [8 x i32]*)

declare void @__kmpc_for_static_init_4(%ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare void @__kmpc_for_static_fini(%ident_t*, i32)

declare void @__kmpc_barrier(%ident_t*, i32)

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

declare void @__DiscoPoPOpenMPInitialize()

declare void @__CollectThreadInfo()

declare void @__DiscoPoPOpenMPFinalize()

declare void @__DiscoPoPOpenMPRead(i64, i32, i32, i32)

declare void @__DiscoPoPOpenMPWrite(i64)

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
!10 = !DILocalVariable(name: "number", scope: !6, file: !1, line: 9, type: !9)
!11 = !DIExpression()
!12 = !DILocation(line: 9, column: 9, scope: !6)
!13 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 10, type: !9)
!14 = !DILocation(line: 10, column: 9, scope: !6)
!15 = !DILocation(line: 11, column: 5, scope: !6)
!16 = !DILocation(line: 12, column: 5, scope: !6)
!17 = !DILocalVariable(name: "a", scope: !6, file: !1, line: 14, type: !9)
!18 = !DILocation(line: 14, column: 9, scope: !6)
!19 = !DILocation(line: 15, column: 13, scope: !6)
!20 = !DILocation(line: 40, column: 5, scope: !6)
!21 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 15, type: !22, isLocal: true, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24, !24, !27, !27}
!24 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!27 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !9, size: 64, align: 64)
!28 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !21, type: !24, flags: DIFlagArtificial | DIFlagObjectPointer)
!29 = !DILocation(line: 0, scope: !21)
!30 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !21, type: !24, flags: DIFlagArtificial)
!31 = !DILocalVariable(name: "a", arg: 3, scope: !21, type: !27, flags: DIFlagArtificial)
!32 = !DILocalVariable(name: "i", arg: 4, scope: !21, type: !27, flags: DIFlagArtificial)
!33 = !DILocation(line: 16, column: 5, scope: !21)
!34 = !DILocation(line: 17, column: 11, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !1, line: 16, column: 5)
!36 = !DILocation(line: 22, column: 17, scope: !35)
!37 = !DILocation(line: 39, column: 5, scope: !21)
!38 = distinct !DISubprogram(name: ".omp_outlined..1", scope: !1, file: !1, line: 22, type: !22, isLocal: true, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!39 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !38, type: !24, flags: DIFlagArtificial | DIFlagObjectPointer)
!40 = !DILocation(line: 0, scope: !38)
!41 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !38, type: !24, flags: DIFlagArtificial)
!42 = !DILocalVariable(name: "a", arg: 3, scope: !38, type: !27, flags: DIFlagArtificial)
!43 = !DILocalVariable(name: "i", arg: 4, scope: !38, type: !27, flags: DIFlagArtificial)
!44 = !DILocation(line: 23, column: 9, scope: !38)
!45 = !DILocation(line: 24, column: 19, scope: !46)
!46 = distinct !DILexicalBlock(scope: !38, file: !1, line: 23, column: 9)
!47 = !DILocation(line: 25, column: 12, scope: !48)
!48 = distinct !DILexicalBlock(scope: !46, file: !1, line: 24, column: 19)
!49 = !DILocation(line: 25, column: 11, scope: !48)
!50 = !DILocalVariable(name: ".omp.iv", scope: !51, type: !9, flags: DIFlagArtificial)
!51 = distinct !DILexicalBlock(scope: !46, file: !1, line: 31, column: 21)
!52 = !DILocation(line: 0, scope: !51)
!53 = !DILocalVariable(name: ".omp.lb", scope: !51, type: !9, flags: DIFlagArtificial)
!54 = !DILocation(line: 32, column: 17, scope: !51)
!55 = !DILocalVariable(name: ".omp.ub", scope: !51, type: !9, flags: DIFlagArtificial)
!56 = !DILocalVariable(name: ".omp.stride", scope: !51, type: !9, flags: DIFlagArtificial)
!57 = !DILocalVariable(name: ".omp.is_last", scope: !51, type: !9, flags: DIFlagArtificial)
!58 = !DILocalVariable(name: "a", scope: !51, type: !9, flags: DIFlagArtificial)
!59 = !DILocation(line: 31, column: 42, scope: !51)
!60 = !DILocalVariable(name: "i", scope: !51, type: !9, flags: DIFlagArtificial)
!61 = !DILocation(line: 31, column: 21, scope: !46)
!62 = !DILocation(line: 32, column: 17, scope: !63)
!63 = !DILexicalBlockFile(scope: !51, file: !1, discriminator: 1)
!64 = !DILocation(line: 32, column: 17, scope: !65)
!65 = !DILexicalBlockFile(scope: !51, file: !1, discriminator: 2)
!66 = !DILocation(line: 32, column: 17, scope: !67)
!67 = !DILexicalBlockFile(scope: !51, file: !1, discriminator: 3)
!68 = !DILocation(line: 31, column: 21, scope: !69)
!69 = !DILexicalBlockFile(scope: !46, file: !1, discriminator: 1)
!70 = !DILocation(line: 32, column: 17, scope: !71)
!71 = !DILexicalBlockFile(scope: !51, file: !1, discriminator: 4)
!72 = !DILocation(line: 31, column: 21, scope: !73)
!73 = !DILexicalBlockFile(scope: !46, file: !1, discriminator: 2)
!74 = !DILocation(line: 32, column: 17, scope: !75)
!75 = !DILexicalBlockFile(scope: !51, file: !1, discriminator: 5)
!76 = !DILocation(line: 32, column: 26, scope: !75)
!77 = !DILocalVariable(name: "b", scope: !78, file: !1, line: 35, type: !9)
!78 = distinct !DILexicalBlock(scope: !51, file: !1, line: 33, column: 13)
!79 = !DILocation(line: 35, column: 19, scope: !78)
!80 = !DILocation(line: 35, column: 21, scope: !78)
!81 = !DILocation(line: 37, column: 13, scope: !78)
!82 = !DILocation(line: 31, column: 21, scope: !67)
!83 = !DILocation(line: 32, column: 17, scope: !84)
!84 = !DILexicalBlockFile(scope: !51, file: !1, discriminator: 6)
!85 = !DILocation(line: 0, scope: !63)
!86 = !DILocation(line: 31, column: 21, scope: !71)
!87 = distinct !{!87, !61}
!88 = !DILocation(line: 31, column: 21, scope: !75)
!89 = !DILocation(line: 31, column: 21, scope: !84)
!90 = !DILocation(line: 31, column: 45, scope: !84)
!91 = !DILocation(line: 31, column: 45, scope: !92)
!92 = !DILexicalBlockFile(scope: !84, file: !1, discriminator: 7)
!93 = !DILocation(line: 38, column: 9, scope: !38)
