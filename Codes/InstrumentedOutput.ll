; ModuleID = '<stdin>'
source_filename = "sourcefile.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;10;10;;\00"
@2 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;14;11;;\00"
@.gomp_critical_user_.var = common global [8 x i32] zeroinitializer
@3 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;10;36;;\00"
@4 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;17;10;;\00"
@.str.1 = private unnamed_addr constant [17 x i8] c"test source file\00", align 1
@n = constant i32 20, align 4
@.str.2 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.3 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.4 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.5 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.6 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.7 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.8 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.9 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.10 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.11 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.12 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.13 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.14 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.15 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.16 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.17 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.18 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.19 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.20 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.21 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.22 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.23 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.24 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.25 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.26 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.27 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.28 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.29 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.30 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.31 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.32 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"
@.str.33 = private unnamed_addr constant [20 x i8] c"NO VARNAME ATTACHED\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !10 {
  %1 = alloca i32, align 4
  %2 = alloca [20 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %ident_t, align 8
  %6 = bitcast %ident_t* %5 to i8*
  %7 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 24, i32 8, i1 false)
  %8 = getelementptr inbounds %ident_t, %ident_t* %5, i32 0, i32 4
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @4, i32 0, i32 0), i8** %8, align 8
  %9 = call i32 @__kmpc_global_thread_num(%ident_t* %5)
  store i32 0, i32* %1, align 4
  call void @__DiscoPoPOpenMPInitialize()
  call void @llvm.dbg.declare(metadata [20 x i32]* %2, metadata !13, metadata !17), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %3, metadata !19, metadata !17), !dbg !20
  %10 = ptrtoint i32* %3 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16392, i64 %10, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i32 0, i32 0))
  store i32 1000, i32* %3, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %4, metadata !21, metadata !17), !dbg !22
  %11 = ptrtoint i32* %4 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16393, i64 %11, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %4, align 4, !dbg !22
  %12 = getelementptr inbounds %ident_t, %ident_t* %5, i32 0, i32 4, !dbg !23
  %13 = ptrtoint i8** %12 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16394, i64 %13, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %12, align 8, !dbg !23
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* %5, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, [20 x i32]*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), [20 x i32]* %2, i32* %3, i32* %4), !dbg !23
  %14 = getelementptr inbounds %ident_t, %ident_t* %5, i32 0, i32 4, !dbg !24
  %15 = ptrtoint i8** %14 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16401, i64 %15, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @4, i32 0, i32 0), i8** %14, align 8, !dbg !24
  call void @__kmpc_barrier(%ident_t* %5, i32 %9), !dbg !24
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0)), !dbg !25
  call void @__DiscoPoPOpenMPFinalize()
  ret i32 0, !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define internal void @.omp_outlined.(i32* noalias, i32* noalias, [20 x i32]* dereferenceable(80), i32* dereferenceable(4), i32* dereferenceable(4)) #0 !dbg !27 {
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca [20 x i32]*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca %ident_t, align 8
  %18 = bitcast %ident_t* %17 to i8*
  %19 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 24, i32 8, i1 false)
  store i32* %0, i32** %6, align 8
  call void @llvm.dbg.declare(metadata i32** %6, metadata !35, metadata !17), !dbg !36
  store i32* %1, i32** %7, align 8
  call void @llvm.dbg.declare(metadata i32** %7, metadata !37, metadata !17), !dbg !36
  store [20 x i32]* %2, [20 x i32]** %8, align 8
  call void @llvm.dbg.declare(metadata [20 x i32]** %8, metadata !38, metadata !17), !dbg !36
  store i32* %3, i32** %9, align 8
  call void @llvm.dbg.declare(metadata i32** %9, metadata !39, metadata !17), !dbg !36
  store i32* %4, i32** %10, align 8
  call void @llvm.dbg.declare(metadata i32** %10, metadata !40, metadata !17), !dbg !36
  %20 = ptrtoint [20 x i32]** %8 to i64
  call void @__DiscoPoPOpenMPRead(i32 16395, i64 %20, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i32 0, i32 0))
  %21 = load [20 x i32]*, [20 x i32]** %8, align 8, !dbg !41
  %22 = ptrtoint i32** %9 to i64
  call void @__DiscoPoPOpenMPRead(i32 16395, i64 %22, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i32 0, i32 0))
  %23 = load i32*, i32** %9, align 8, !dbg !41
  %24 = ptrtoint i32** %10 to i64
  call void @__DiscoPoPOpenMPRead(i32 16395, i64 %24, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i32 0, i32 0))
  %25 = load i32*, i32** %10, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %11, metadata !42, metadata !17), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %12, metadata !43, metadata !17), !dbg !36
  %26 = ptrtoint i32* %12 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16395, i64 %26, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i32 0, i32 0))
  store i32 0, i32* %12, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %13, metadata !45, metadata !17), !dbg !36
  %27 = ptrtoint i32* %13 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16395, i64 %27, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.10, i32 0, i32 0))
  store i32 19, i32* %13, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %14, metadata !46, metadata !17), !dbg !36
  %28 = ptrtoint i32* %14 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16395, i64 %28, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.11, i32 0, i32 0))
  store i32 1, i32* %14, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %15, metadata !47, metadata !17), !dbg !36
  %29 = ptrtoint i32* %15 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16395, i64 %29, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i32 0, i32 0))
  store i32 0, i32* %15, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %16, metadata !48, metadata !17), !dbg !36
  %30 = getelementptr inbounds %ident_t, %ident_t* %17, i32 0, i32 4, !dbg !41
  %31 = ptrtoint i8** %30 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16395, i64 %31, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.13, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %30, align 8, !dbg !41
  %32 = ptrtoint i32** %6 to i64
  call void @__DiscoPoPOpenMPRead(i32 16395, i64 %32, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.14, i32 0, i32 0))
  %33 = load i32*, i32** %6, align 8, !dbg !41
  %34 = ptrtoint i32* %33 to i64
  call void @__DiscoPoPOpenMPRead(i32 16395, i64 %34, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.15, i32 0, i32 0))
  %35 = load i32, i32* %33, align 4, !dbg !41
  call void @__kmpc_for_static_init_4(%ident_t* %17, i32 %35, i32 34, i32* %15, i32* %12, i32* %13, i32* %14, i32 1, i32 1), !dbg !41
  %36 = ptrtoint i32* %13 to i64
  call void @__DiscoPoPOpenMPRead(i32 16395, i64 %36, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.16, i32 0, i32 0))
  %37 = load i32, i32* %13, align 4, !dbg !44
  %38 = icmp sgt i32 %37, 19, !dbg !44
  br i1 %38, label %39, label %40, !dbg !44

; <label>:39:                                     ; preds = %5
  br label %43, !dbg !49

; <label>:40:                                     ; preds = %5
  %41 = ptrtoint i32* %13 to i64
  call void @__DiscoPoPOpenMPRead(i32 16395, i64 %41, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.17, i32 0, i32 0))
  %42 = load i32, i32* %13, align 4, !dbg !51
  br label %43, !dbg !51

; <label>:43:                                     ; preds = %40, %39
  %44 = phi i32 [ 19, %39 ], [ %42, %40 ], !dbg !53
  %45 = ptrtoint i32* %13 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16395, i64 %45, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.18, i32 0, i32 0))
  store i32 %44, i32* %13, align 4, !dbg !53
  %46 = ptrtoint i32* %12 to i64
  call void @__DiscoPoPOpenMPRead(i32 16395, i64 %46, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.19, i32 0, i32 0))
  %47 = load i32, i32* %12, align 4, !dbg !53
  %48 = ptrtoint i32* %11 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16395, i64 %48, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.20, i32 0, i32 0))
  store i32 %47, i32* %11, align 4, !dbg !53
  br label %49, !dbg !55

; <label>:49:                                     ; preds = %78, %43
  %50 = ptrtoint i32* %11 to i64
  call void @__DiscoPoPOpenMPRead(i32 16395, i64 %50, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.21, i32 0, i32 0))
  %51 = load i32, i32* %11, align 4, !dbg !56
  %52 = ptrtoint i32* %13 to i64
  call void @__DiscoPoPOpenMPRead(i32 16395, i64 %52, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.22, i32 0, i32 0))
  %53 = load i32, i32* %13, align 4, !dbg !56
  %54 = icmp sle i32 %51, %53, !dbg !36
  br i1 %54, label %55, label %82, !dbg !58

; <label>:55:                                     ; preds = %49
  %56 = ptrtoint i32* %11 to i64
  call void @__DiscoPoPOpenMPRead(i32 16395, i64 %56, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.23, i32 0, i32 0))
  %57 = load i32, i32* %11, align 4, !dbg !59
  %58 = mul nsw i32 %57, 1, !dbg !61
  %59 = add nsw i32 0, %58, !dbg !61
  %60 = ptrtoint i32* %16 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16395, i64 %60, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.24, i32 0, i32 0))
  store i32 %59, i32* %16, align 4, !dbg !61
  %61 = ptrtoint i32* %23 to i64
  call void @__DiscoPoPOpenMPRead(i32 16397, i64 %61, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.25, i32 0, i32 0))
  %62 = load i32, i32* %23, align 4, !dbg !62
  %63 = ptrtoint i32* %16 to i64
  call void @__DiscoPoPOpenMPRead(i32 16397, i64 %63, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.26, i32 0, i32 0))
  %64 = load i32, i32* %16, align 4, !dbg !64
  %65 = add nsw i32 %62, %64, !dbg !65
  %66 = ptrtoint i32* %16 to i64
  call void @__DiscoPoPOpenMPRead(i32 16397, i64 %66, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.27, i32 0, i32 0))
  %67 = load i32, i32* %16, align 4, !dbg !66
  %68 = sext i32 %67 to i64, !dbg !67
  %69 = getelementptr inbounds [20 x i32], [20 x i32]* %21, i64 0, i64 %68, !dbg !67
  %70 = ptrtoint i32* %69 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16397, i64 %70, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.28, i32 0, i32 0))
  store i32 %65, i32* %69, align 4, !dbg !68
  %71 = getelementptr inbounds %ident_t, %ident_t* %17, i32 0, i32 4, !dbg !69
  %72 = ptrtoint i8** %71 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16398, i64 %72, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.29, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0), i8** %71, align 8, !dbg !69
  call void @__kmpc_critical(%ident_t* %17, i32 %35, [8 x i32]* @.gomp_critical_user_.var), !dbg !69
  %73 = ptrtoint i32* %25 to i64
  call void @__DiscoPoPOpenMPRead(i32 16399, i64 %73, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.30, i32 0, i32 0))
  %74 = load i32, i32* %25, align 4, !dbg !70
  %75 = add nsw i32 %74, 1, !dbg !70
  %76 = ptrtoint i32* %25 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16399, i64 %76, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.31, i32 0, i32 0))
  store i32 %75, i32* %25, align 4, !dbg !70
  call void @__kmpc_end_critical(%ident_t* %17, i32 %35, [8 x i32]* @.gomp_critical_user_.var), !dbg !72
  br label %77, !dbg !73

; <label>:77:                                     ; preds = %55
  br label %78, !dbg !74

; <label>:78:                                     ; preds = %77
  %79 = ptrtoint i32* %11 to i64
  call void @__DiscoPoPOpenMPRead(i32 16395, i64 %79, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.32, i32 0, i32 0))
  %80 = load i32, i32* %11, align 4, !dbg !75
  %81 = add nsw i32 %80, 1, !dbg !77
  store i32 %81, i32* %11, align 4, !dbg !77
  br label %49, !dbg !78, !llvm.loop !79

; <label>:82:                                     ; preds = %49
  br label %83, !dbg !80

; <label>:83:                                     ; preds = %82
  %84 = getelementptr inbounds %ident_t, %ident_t* %17, i32 0, i32 4, !dbg !81
  %85 = ptrtoint i8** %84 to i64
  call void @__DiscoPoPOpenMPWrite(i32 16394, i64 %85, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.33, i32 0, i32 0))
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @3, i32 0, i32 0), i8** %84, align 8, !dbg !81
  call void @__kmpc_for_static_fini(%ident_t* %17, i32 %35), !dbg !81
  ret void, !dbg !82
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
!13 = !DILocalVariable(name: "a", scope: !10, file: !1, line: 7, type: !14)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 640, align: 32, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 20)
!17 = !DIExpression()
!18 = !DILocation(line: 7, column: 6, scope: !10)
!19 = !DILocalVariable(name: "b", scope: !10, file: !1, line: 8, type: !6)
!20 = !DILocation(line: 8, column: 6, scope: !10)
!21 = !DILocalVariable(name: "x", scope: !10, file: !1, line: 9, type: !6)
!22 = !DILocation(line: 9, column: 6, scope: !10)
!23 = !DILocation(line: 10, column: 10, scope: !10)
!24 = !DILocation(line: 17, column: 10, scope: !10)
!25 = !DILocation(line: 18, column: 1, scope: !10)
!26 = !DILocation(line: 19, column: 1, scope: !10)
!27 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 10, type: !28, isLocal: true, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !30, !30, !33, !34, !34}
!30 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!31 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !32)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!33 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !14, size: 64, align: 64)
!34 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !6, size: 64, align: 64)
!35 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !27, type: !30, flags: DIFlagArtificial | DIFlagObjectPointer)
!36 = !DILocation(line: 0, scope: !27)
!37 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !27, type: !30, flags: DIFlagArtificial)
!38 = !DILocalVariable(name: "a", arg: 3, scope: !27, type: !33, flags: DIFlagArtificial)
!39 = !DILocalVariable(name: "b", arg: 4, scope: !27, type: !34, flags: DIFlagArtificial)
!40 = !DILocalVariable(name: "x", arg: 5, scope: !27, type: !34, flags: DIFlagArtificial)
!41 = !DILocation(line: 11, column: 2, scope: !27)
!42 = !DILocalVariable(name: ".omp.iv", scope: !27, type: !6, flags: DIFlagArtificial)
!43 = !DILocalVariable(name: ".omp.lb", scope: !27, type: !6, flags: DIFlagArtificial)
!44 = !DILocation(line: 11, column: 7, scope: !27)
!45 = !DILocalVariable(name: ".omp.ub", scope: !27, type: !6, flags: DIFlagArtificial)
!46 = !DILocalVariable(name: ".omp.stride", scope: !27, type: !6, flags: DIFlagArtificial)
!47 = !DILocalVariable(name: ".omp.is_last", scope: !27, type: !6, flags: DIFlagArtificial)
!48 = !DILocalVariable(name: "i", scope: !27, type: !6, flags: DIFlagArtificial)
!49 = !DILocation(line: 11, column: 7, scope: !50)
!50 = !DILexicalBlockFile(scope: !27, file: !1, discriminator: 1)
!51 = !DILocation(line: 11, column: 7, scope: !52)
!52 = !DILexicalBlockFile(scope: !27, file: !1, discriminator: 2)
!53 = !DILocation(line: 11, column: 7, scope: !54)
!54 = !DILexicalBlockFile(scope: !27, file: !1, discriminator: 3)
!55 = !DILocation(line: 11, column: 2, scope: !54)
!56 = !DILocation(line: 11, column: 7, scope: !57)
!57 = !DILexicalBlockFile(scope: !27, file: !1, discriminator: 4)
!58 = !DILocation(line: 11, column: 2, scope: !57)
!59 = !DILocation(line: 11, column: 7, scope: !60)
!60 = !DILexicalBlockFile(scope: !27, file: !1, discriminator: 5)
!61 = !DILocation(line: 11, column: 25, scope: !60)
!62 = !DILocation(line: 13, column: 8, scope: !63)
!63 = distinct !DILexicalBlock(scope: !27, file: !1, line: 12, column: 2)
!64 = !DILocation(line: 13, column: 10, scope: !63)
!65 = !DILocation(line: 13, column: 9, scope: !63)
!66 = !DILocation(line: 13, column: 5, scope: !63)
!67 = !DILocation(line: 13, column: 3, scope: !63)
!68 = !DILocation(line: 13, column: 7, scope: !63)
!69 = !DILocation(line: 14, column: 11, scope: !63)
!70 = !DILocation(line: 15, column: 4, scope: !71)
!71 = distinct !DILexicalBlock(scope: !63, file: !1, line: 14, column: 11)
!72 = !DILocation(line: 15, column: 3, scope: !71)
!73 = !DILocation(line: 16, column: 2, scope: !63)
!74 = !DILocation(line: 10, column: 10, scope: !27)
!75 = !DILocation(line: 11, column: 7, scope: !76)
!76 = !DILexicalBlockFile(scope: !27, file: !1, discriminator: 6)
!77 = !DILocation(line: 0, scope: !50)
!78 = !DILocation(line: 10, column: 10, scope: !50)
!79 = distinct !{!79, !41}
!80 = !DILocation(line: 10, column: 10, scope: !52)
!81 = !DILocation(line: 10, column: 10, scope: !54)
!82 = !DILocation(line: 16, column: 2, scope: !50)
