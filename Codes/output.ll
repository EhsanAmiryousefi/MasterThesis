; ModuleID = 'sourcefile.c'
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
@.str.1 = private unnamed_addr constant [17 x i8] c"test source file\00", align 1
@n = constant i32 20, align 4

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
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [20 x i32]* %2, metadata !13, metadata !17), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %3, metadata !19, metadata !17), !dbg !20
  store i32 1000, i32* %3, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %4, metadata !21, metadata !17), !dbg !22
  store i32 0, i32* %4, align 4, !dbg !22
  %8 = getelementptr inbounds %ident_t, %ident_t* %5, i32 0, i32 4, !dbg !23
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %8, align 8, !dbg !23
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* %5, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, [20 x i32]*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), [20 x i32]* %2, i32* %3, i32* %4), !dbg !23
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0)), !dbg !24
  ret i32 0, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define internal void @.omp_outlined.(i32* noalias, i32* noalias, [20 x i32]* dereferenceable(80), i32* dereferenceable(4), i32* dereferenceable(4)) #0 !dbg !26 {
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
  call void @llvm.dbg.declare(metadata i32** %6, metadata !34, metadata !17), !dbg !35
  store i32* %1, i32** %7, align 8
  call void @llvm.dbg.declare(metadata i32** %7, metadata !36, metadata !17), !dbg !35
  store [20 x i32]* %2, [20 x i32]** %8, align 8
  call void @llvm.dbg.declare(metadata [20 x i32]** %8, metadata !37, metadata !17), !dbg !35
  store i32* %3, i32** %9, align 8
  call void @llvm.dbg.declare(metadata i32** %9, metadata !38, metadata !17), !dbg !35
  store i32* %4, i32** %10, align 8
  call void @llvm.dbg.declare(metadata i32** %10, metadata !39, metadata !17), !dbg !35
  %20 = load [20 x i32]*, [20 x i32]** %8, align 8, !dbg !40
  %21 = load i32*, i32** %9, align 8, !dbg !40
  %22 = load i32*, i32** %10, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %11, metadata !41, metadata !17), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %12, metadata !42, metadata !17), !dbg !35
  store i32 0, i32* %12, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %13, metadata !44, metadata !17), !dbg !35
  store i32 19, i32* %13, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %14, metadata !45, metadata !17), !dbg !35
  store i32 1, i32* %14, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %15, metadata !46, metadata !17), !dbg !35
  store i32 0, i32* %15, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %16, metadata !47, metadata !17), !dbg !35
  %23 = getelementptr inbounds %ident_t, %ident_t* %17, i32 0, i32 4, !dbg !40
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %23, align 8, !dbg !40
  %24 = load i32*, i32** %6, align 8, !dbg !40
  %25 = load i32, i32* %24, align 4, !dbg !40
  call void @__kmpc_for_static_init_4(%ident_t* %17, i32 %25, i32 34, i32* %15, i32* %12, i32* %13, i32* %14, i32 1, i32 1), !dbg !40
  %26 = load i32, i32* %13, align 4, !dbg !43
  %27 = icmp sgt i32 %26, 19, !dbg !43
  br i1 %27, label %28, label %29, !dbg !43

; <label>:28:                                     ; preds = %5
  br label %31, !dbg !48

; <label>:29:                                     ; preds = %5
  %30 = load i32, i32* %13, align 4, !dbg !50
  br label %31, !dbg !50

; <label>:31:                                     ; preds = %29, %28
  %32 = phi i32 [ 19, %28 ], [ %30, %29 ], !dbg !52
  store i32 %32, i32* %13, align 4, !dbg !52
  %33 = load i32, i32* %12, align 4, !dbg !52
  store i32 %33, i32* %11, align 4, !dbg !52
  br label %34, !dbg !54

; <label>:34:                                     ; preds = %52, %31
  %35 = load i32, i32* %11, align 4, !dbg !55
  %36 = load i32, i32* %13, align 4, !dbg !55
  %37 = icmp sle i32 %35, %36, !dbg !35
  br i1 %37, label %38, label %55, !dbg !57

; <label>:38:                                     ; preds = %34
  %39 = load i32, i32* %11, align 4, !dbg !58
  %40 = mul nsw i32 %39, 1, !dbg !60
  %41 = add nsw i32 0, %40, !dbg !60
  store i32 %41, i32* %16, align 4, !dbg !60
  %42 = load i32, i32* %21, align 4, !dbg !61
  %43 = load i32, i32* %16, align 4, !dbg !63
  %44 = add nsw i32 %42, %43, !dbg !64
  %45 = load i32, i32* %16, align 4, !dbg !65
  %46 = sext i32 %45 to i64, !dbg !66
  %47 = getelementptr inbounds [20 x i32], [20 x i32]* %20, i64 0, i64 %46, !dbg !66
  store i32 %44, i32* %47, align 4, !dbg !67
  %48 = getelementptr inbounds %ident_t, %ident_t* %17, i32 0, i32 4, !dbg !68
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0), i8** %48, align 8, !dbg !68
  call void @__kmpc_critical(%ident_t* %17, i32 %25, [8 x i32]* @.gomp_critical_user_.var), !dbg !68
  %49 = load i32, i32* %22, align 4, !dbg !69
  %50 = add nsw i32 %49, 1, !dbg !69
  store i32 %50, i32* %22, align 4, !dbg !69
  call void @__kmpc_end_critical(%ident_t* %17, i32 %25, [8 x i32]* @.gomp_critical_user_.var), !dbg !71
  br label %51, !dbg !72

; <label>:51:                                     ; preds = %38
  br label %52, !dbg !73

; <label>:52:                                     ; preds = %51
  %53 = load i32, i32* %11, align 4, !dbg !74
  %54 = add nsw i32 %53, 1, !dbg !76
  store i32 %54, i32* %11, align 4, !dbg !76
  br label %34, !dbg !77, !llvm.loop !78

; <label>:55:                                     ; preds = %34
  br label %56, !dbg !79

; <label>:56:                                     ; preds = %55
  %57 = getelementptr inbounds %ident_t, %ident_t* %17, i32 0, i32 4, !dbg !80
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @3, i32 0, i32 0), i8** %57, align 8, !dbg !80
  call void @__kmpc_for_static_fini(%ident_t* %17, i32 %25), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare void @__kmpc_for_static_init_4(%ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare void @__kmpc_end_critical(%ident_t*, i32, [8 x i32]*)

declare void @__kmpc_critical(%ident_t*, i32, [8 x i32]*)

declare void @__kmpc_for_static_fini(%ident_t*, i32)

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

declare i32 @printf(i8*, ...) #3

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
!24 = !DILocation(line: 17, column: 1, scope: !10)
!25 = !DILocation(line: 18, column: 1, scope: !10)
!26 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 10, type: !27, isLocal: true, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !29, !29, !32, !33, !33}
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !31)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!32 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !14, size: 64, align: 64)
!33 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !6, size: 64, align: 64)
!34 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !26, type: !29, flags: DIFlagArtificial | DIFlagObjectPointer)
!35 = !DILocation(line: 0, scope: !26)
!36 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !26, type: !29, flags: DIFlagArtificial)
!37 = !DILocalVariable(name: "a", arg: 3, scope: !26, type: !32, flags: DIFlagArtificial)
!38 = !DILocalVariable(name: "b", arg: 4, scope: !26, type: !33, flags: DIFlagArtificial)
!39 = !DILocalVariable(name: "x", arg: 5, scope: !26, type: !33, flags: DIFlagArtificial)
!40 = !DILocation(line: 11, column: 2, scope: !26)
!41 = !DILocalVariable(name: ".omp.iv", scope: !26, type: !6, flags: DIFlagArtificial)
!42 = !DILocalVariable(name: ".omp.lb", scope: !26, type: !6, flags: DIFlagArtificial)
!43 = !DILocation(line: 11, column: 7, scope: !26)
!44 = !DILocalVariable(name: ".omp.ub", scope: !26, type: !6, flags: DIFlagArtificial)
!45 = !DILocalVariable(name: ".omp.stride", scope: !26, type: !6, flags: DIFlagArtificial)
!46 = !DILocalVariable(name: ".omp.is_last", scope: !26, type: !6, flags: DIFlagArtificial)
!47 = !DILocalVariable(name: "i", scope: !26, type: !6, flags: DIFlagArtificial)
!48 = !DILocation(line: 11, column: 7, scope: !49)
!49 = !DILexicalBlockFile(scope: !26, file: !1, discriminator: 1)
!50 = !DILocation(line: 11, column: 7, scope: !51)
!51 = !DILexicalBlockFile(scope: !26, file: !1, discriminator: 2)
!52 = !DILocation(line: 11, column: 7, scope: !53)
!53 = !DILexicalBlockFile(scope: !26, file: !1, discriminator: 3)
!54 = !DILocation(line: 11, column: 2, scope: !53)
!55 = !DILocation(line: 11, column: 7, scope: !56)
!56 = !DILexicalBlockFile(scope: !26, file: !1, discriminator: 4)
!57 = !DILocation(line: 11, column: 2, scope: !56)
!58 = !DILocation(line: 11, column: 7, scope: !59)
!59 = !DILexicalBlockFile(scope: !26, file: !1, discriminator: 5)
!60 = !DILocation(line: 11, column: 25, scope: !59)
!61 = !DILocation(line: 13, column: 8, scope: !62)
!62 = distinct !DILexicalBlock(scope: !26, file: !1, line: 12, column: 2)
!63 = !DILocation(line: 13, column: 10, scope: !62)
!64 = !DILocation(line: 13, column: 9, scope: !62)
!65 = !DILocation(line: 13, column: 5, scope: !62)
!66 = !DILocation(line: 13, column: 3, scope: !62)
!67 = !DILocation(line: 13, column: 7, scope: !62)
!68 = !DILocation(line: 14, column: 11, scope: !62)
!69 = !DILocation(line: 15, column: 4, scope: !70)
!70 = distinct !DILexicalBlock(scope: !62, file: !1, line: 14, column: 11)
!71 = !DILocation(line: 15, column: 3, scope: !70)
!72 = !DILocation(line: 16, column: 2, scope: !62)
!73 = !DILocation(line: 10, column: 10, scope: !26)
!74 = !DILocation(line: 11, column: 7, scope: !75)
!75 = !DILexicalBlockFile(scope: !26, file: !1, discriminator: 6)
!76 = !DILocation(line: 0, scope: !49)
!77 = !DILocation(line: 10, column: 10, scope: !49)
!78 = distinct !{!78, !40}
!79 = !DILocation(line: 10, column: 10, scope: !51)
!80 = !DILocation(line: 10, column: 10, scope: !53)
!81 = !DILocation(line: 16, column: 2, scope: !49)
