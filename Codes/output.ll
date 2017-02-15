; ModuleID = 'sourcefile.c'
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
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !13, metadata !14), !dbg !15
  call void @llvm.dbg.declare(metadata [1000000 x i32]* %a, metadata !16, metadata !14), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !21, metadata !14), !dbg !22
  store i32 0, i32* %sum, align 4, !dbg !22
  %2 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !23
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %2, align 8, !dbg !23
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* %.kmpc_loc.addr, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*, [1000000 x i32]*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %i, i32* %sum, [1000000 x i32]* %a), !dbg !23
  ret i32 0, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %i, i32* dereferenceable(4) %sum, [1000000 x i32]* dereferenceable(4000000) %a) #0 !dbg !25 {
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
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !33, metadata !14), !dbg !34
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !35, metadata !14), !dbg !34
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !36, metadata !14), !dbg !34
  store i32* %sum, i32** %sum.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %sum.addr, metadata !37, metadata !14), !dbg !34
  store [1000000 x i32]* %a, [1000000 x i32]** %a.addr, align 8
  call void @llvm.dbg.declare(metadata [1000000 x i32]** %a.addr, metadata !38, metadata !14), !dbg !34
  %2 = load i32*, i32** %i.addr, align 8, !dbg !39
  %3 = load i32*, i32** %sum.addr, align 8, !dbg !39
  %4 = load [1000000 x i32]*, [1000000 x i32]** %a.addr, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !40, metadata !14), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !41, metadata !14), !dbg !34
  store i32 0, i32* %.omp.lb, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !43, metadata !14), !dbg !34
  store i32 999999, i32* %.omp.ub, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !44, metadata !14), !dbg !34
  store i32 1, i32* %.omp.stride, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !45, metadata !14), !dbg !34
  store i32 0, i32* %.omp.is_last, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %sum1, metadata !46, metadata !14), !dbg !34
  store i32 0, i32* %sum1, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !48, metadata !14), !dbg !34
  %5 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !39
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %5, align 8, !dbg !39
  %6 = load i32*, i32** %.global_tid..addr, align 8, !dbg !39
  %7 = load i32, i32* %6, align 4, !dbg !39
  call void @__kmpc_for_static_init_4(%ident_t* %.kmpc_loc.addr, i32 %7, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !39
  %8 = load i32, i32* %.omp.ub, align 4, !dbg !42
  %cmp = icmp sgt i32 %8, 999999, !dbg !42
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !42

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !49

cond.false:                                       ; preds = %entry
  %9 = load i32, i32* %.omp.ub, align 4, !dbg !51
  br label %cond.end, !dbg !51

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 999999, %cond.true ], [ %9, %cond.false ], !dbg !53
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !53
  %10 = load i32, i32* %.omp.lb, align 4, !dbg !53
  store i32 %10, i32* %.omp.iv, align 4, !dbg !53
  br label %omp.inner.for.cond, !dbg !55

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %11 = load i32, i32* %.omp.iv, align 4, !dbg !56
  %12 = load i32, i32* %.omp.ub, align 4, !dbg !56
  %cmp3 = icmp sle i32 %11, %12, !dbg !34
  br i1 %cmp3, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !58

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %13 = load i32, i32* %.omp.iv, align 4, !dbg !59
  %mul = mul nsw i32 %13, 1, !dbg !61
  %add = add nsw i32 0, %mul, !dbg !61
  store i32 %add, i32* %i2, align 4, !dbg !61
  %14 = load i32, i32* %i2, align 4, !dbg !62
  %idxprom = sext i32 %14 to i64, !dbg !64
  %arrayidx = getelementptr inbounds [1000000 x i32], [1000000 x i32]* %4, i64 0, i64 %idxprom, !dbg !64
  %15 = load i32, i32* %arrayidx, align 4, !dbg !64
  %16 = load i32, i32* %sum1, align 4, !dbg !65
  %add4 = add nsw i32 %16, %15, !dbg !65
  store i32 %add4, i32* %sum1, align 4, !dbg !65
  %17 = load i32, i32* %sum1, align 4, !dbg !66
  %18 = load i32, i32* %i2, align 4, !dbg !67
  %idxprom5 = sext i32 %18 to i64, !dbg !68
  %arrayidx6 = getelementptr inbounds [1000000 x i32], [1000000 x i32]* %4, i64 0, i64 %idxprom5, !dbg !68
  store i32 %17, i32* %arrayidx6, align 4, !dbg !69
  br label %omp.body.continue, !dbg !70

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !71

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %19 = load i32, i32* %.omp.iv, align 4, !dbg !72
  %add7 = add nsw i32 %19, 1, !dbg !74
  store i32 %add7, i32* %.omp.iv, align 4, !dbg !74
  br label %omp.inner.for.cond, !dbg !75, !llvm.loop !76

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !77

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  %20 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !78
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0), i8** %20, align 8, !dbg !78
  call void @__kmpc_for_static_fini(%ident_t* %.kmpc_loc.addr, i32 %7), !dbg !78
  %21 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list, i64 0, i64 0, !dbg !78
  %22 = bitcast i32* %sum1 to i8*, !dbg !78
  store i8* %22, i8** %21, align 8, !dbg !78
  %23 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !78
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0), i8** %23, align 8, !dbg !78
  %24 = bitcast [1 x i8*]* %.omp.reduction.red_list to i8*, !dbg !78
  %25 = call i32 @__kmpc_reduce_nowait(%ident_t* %.kmpc_loc.addr, i32 %7, i32 1, i64 8, i8* %24, void (i8*, i8*)* @.omp.reduction.reduction_func, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !79
  switch i32 %25, label %.omp.reduction.default [
    i32 1, label %.omp.reduction.case1
    i32 2, label %.omp.reduction.case2
  ], !dbg !78

.omp.reduction.case1:                             ; preds = %omp.loop.exit
  %26 = load i32, i32* %3, align 4, !dbg !81
  %27 = load i32, i32* %sum1, align 4, !dbg !81
  %add8 = add nsw i32 %26, %27, !dbg !82
  store i32 %add8, i32* %3, align 4, !dbg !82
  call void @__kmpc_end_reduce_nowait(%ident_t* %.kmpc_loc.addr, i32 %7, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !83
  br label %.omp.reduction.default, !dbg !83

.omp.reduction.case2:                             ; preds = %omp.loop.exit
  %28 = load i32, i32* %sum1, align 4, !dbg !84
  %29 = atomicrmw add i32* %3, i32 %28 monotonic, !dbg !85
  br label %.omp.reduction.default, !dbg !85

.omp.reduction.default:                           ; preds = %.omp.reduction.case2, %.omp.reduction.case1, %omp.loop.exit
  ret void, !dbg !86
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare void @__kmpc_for_static_init_4(%ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare void @__kmpc_for_static_fini(%ident_t*, i32)

; Function Attrs: nounwind uwtable
define internal void @.omp.reduction.reduction_func(i8*, i8*) #0 !dbg !87 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i8*, align 8
  store i8* %0, i8** %.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr, metadata !89, metadata !14), !dbg !91
  store i8* %1, i8** %.addr1, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr1, metadata !92, metadata !14), !dbg !91
  %2 = load i8*, i8** %.addr, align 8
  %3 = bitcast i8* %2 to [1 x i8*]*
  %4 = load i8*, i8** %.addr1, align 8
  %5 = bitcast i8* %4 to [1 x i8*]*
  %6 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0
  %7 = load i8*, i8** %6, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %3, i64 0, i64 0
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32, i32* %11, align 4, !dbg !93
  %13 = load i32, i32* %8, align 4, !dbg !93
  %add = add nsw i32 %12, %13, !dbg !94
  store i32 %add, i32* %11, align 4, !dbg !94
  ret void, !dbg !93
}

declare i32 @__kmpc_reduce_nowait(%ident_t*, i32, i32, i64, i8*, void (i8*, i8*)*, [8 x i32]*)

declare void @__kmpc_end_reduce_nowait(%ident_t*, i32, [8 x i32]*)

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

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
!33 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !25, type: !28, flags: DIFlagArtificial | DIFlagObjectPointer)
!34 = !DILocation(line: 0, scope: !25)
!35 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !25, type: !28, flags: DIFlagArtificial)
!36 = !DILocalVariable(name: "i", arg: 3, scope: !25, type: !31, flags: DIFlagArtificial)
!37 = !DILocalVariable(name: "sum", arg: 4, scope: !25, type: !31, flags: DIFlagArtificial)
!38 = !DILocalVariable(name: "a", arg: 5, scope: !25, type: !32, flags: DIFlagArtificial)
!39 = !DILocation(line: 39, column: 2, scope: !25)
!40 = !DILocalVariable(name: ".omp.iv", scope: !25, type: !6, flags: DIFlagArtificial)
!41 = !DILocalVariable(name: ".omp.lb", scope: !25, type: !6, flags: DIFlagArtificial)
!42 = !DILocation(line: 39, column: 7, scope: !25)
!43 = !DILocalVariable(name: ".omp.ub", scope: !25, type: !6, flags: DIFlagArtificial)
!44 = !DILocalVariable(name: ".omp.stride", scope: !25, type: !6, flags: DIFlagArtificial)
!45 = !DILocalVariable(name: ".omp.is_last", scope: !25, type: !6, flags: DIFlagArtificial)
!46 = !DILocalVariable(name: "sum", scope: !25, type: !6, flags: DIFlagArtificial)
!47 = !DILocation(line: 38, column: 39, scope: !25)
!48 = !DILocalVariable(name: "i", scope: !25, type: !6, flags: DIFlagArtificial)
!49 = !DILocation(line: 39, column: 7, scope: !50)
!50 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 1)
!51 = !DILocation(line: 39, column: 7, scope: !52)
!52 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 2)
!53 = !DILocation(line: 39, column: 7, scope: !54)
!54 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 3)
!55 = !DILocation(line: 39, column: 2, scope: !54)
!56 = !DILocation(line: 39, column: 7, scope: !57)
!57 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 4)
!58 = !DILocation(line: 39, column: 2, scope: !57)
!59 = !DILocation(line: 39, column: 7, scope: !60)
!60 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 5)
!61 = !DILocation(line: 39, column: 19, scope: !60)
!62 = !DILocation(line: 40, column: 12, scope: !63)
!63 = distinct !DILexicalBlock(scope: !25, file: !1, line: 39, column: 24)
!64 = !DILocation(line: 40, column: 10, scope: !63)
!65 = !DILocation(line: 40, column: 7, scope: !63)
!66 = !DILocation(line: 41, column: 8, scope: !63)
!67 = !DILocation(line: 41, column: 5, scope: !63)
!68 = !DILocation(line: 41, column: 3, scope: !63)
!69 = !DILocation(line: 41, column: 7, scope: !63)
!70 = !DILocation(line: 42, column: 2, scope: !63)
!71 = !DILocation(line: 38, column: 10, scope: !50)
!72 = !DILocation(line: 39, column: 7, scope: !73)
!73 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 6)
!74 = !DILocation(line: 0, scope: !50)
!75 = !DILocation(line: 38, column: 10, scope: !52)
!76 = distinct !{!76, !39}
!77 = !DILocation(line: 38, column: 10, scope: !54)
!78 = !DILocation(line: 38, column: 10, scope: !57)
!79 = !DILocation(line: 38, column: 10, scope: !80)
!80 = !DILexicalBlockFile(scope: !57, file: !1, discriminator: 7)
!81 = !DILocation(line: 38, column: 39, scope: !60)
!82 = !DILocation(line: 38, column: 37, scope: !60)
!83 = !DILocation(line: 38, column: 10, scope: !60)
!84 = !DILocation(line: 38, column: 39, scope: !73)
!85 = !DILocation(line: 38, column: 10, scope: !73)
!86 = !DILocation(line: 42, column: 2, scope: !50)
!87 = distinct !DISubprogram(linkageName: ".omp.reduction.reduction_func", scope: !1, file: !1, type: !88, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !0, variables: !2)
!88 = !DISubroutineType(types: !2)
!89 = !DILocalVariable(arg: 1, scope: !87, type: !90, flags: DIFlagArtificial | DIFlagObjectPointer)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!91 = !DILocation(line: 0, scope: !87)
!92 = !DILocalVariable(arg: 2, scope: !87, type: !90, flags: DIFlagArtificial)
!93 = !DILocation(line: 38, column: 39, scope: !87)
!94 = !DILocation(line: 38, column: 37, scope: !87)
