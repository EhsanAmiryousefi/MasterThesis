; ModuleID = 'sourcefile.c'
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
  call void @llvm.dbg.declare(metadata i32* %Ehsan, metadata !13, metadata !14), !dbg !15
  store i32 100, i32* %Ehsan, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata [20 x i32]* %a, metadata !16, metadata !14), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %b, metadata !21, metadata !14), !dbg !22
  store i32 1000, i32* %b, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %x, metadata !23, metadata !14), !dbg !24
  store i32 0, i32* %x, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %hasan, metadata !25, metadata !14), !dbg !26
  store i32 12, i32* %hasan, align 4, !dbg !26
  %4 = load i32, i32* %x, align 4, !dbg !27
  store i32 %4, i32* %Ehsan, align 4, !dbg !28
  %5 = load i32, i32* %hasan, align 4, !dbg !29
  store i32 %5, i32* %Ehsan, align 4, !dbg !30
  %6 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !31
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %6, align 8, !dbg !31
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* %.kmpc_loc.addr, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, [20 x i32]*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), [20 x i32]* %a, i32* %b, i32* %x), !dbg !31
  %7 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !32
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @4, i32 0, i32 0), i8** %7, align 8, !dbg !32
  call void @__kmpc_barrier(%ident_t* %.kmpc_loc.addr, i32 %3), !dbg !32
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0)), !dbg !33
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
  %2 = load [20 x i32]*, [20 x i32]** %a.addr, align 8, !dbg !49
  %3 = load i32*, i32** %b.addr, align 8, !dbg !49
  %4 = load i32*, i32** %x.addr, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !50, metadata !14), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !51, metadata !14), !dbg !44
  store i32 0, i32* %.omp.lb, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !53, metadata !14), !dbg !44
  store i32 19, i32* %.omp.ub, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !54, metadata !14), !dbg !44
  store i32 1, i32* %.omp.stride, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !55, metadata !14), !dbg !44
  store i32 0, i32* %.omp.is_last, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %i, metadata !56, metadata !14), !dbg !44
  %5 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !49
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %5, align 8, !dbg !49
  %6 = load i32*, i32** %.global_tid..addr, align 8, !dbg !49
  %7 = load i32, i32* %6, align 4, !dbg !49
  call void @__kmpc_for_static_init_4(%ident_t* %.kmpc_loc.addr, i32 %7, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !49
  %8 = load i32, i32* %.omp.ub, align 4, !dbg !52
  %cmp = icmp sgt i32 %8, 19, !dbg !52
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !52

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !57

cond.false:                                       ; preds = %entry
  %9 = load i32, i32* %.omp.ub, align 4, !dbg !59
  br label %cond.end, !dbg !59

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 19, %cond.true ], [ %9, %cond.false ], !dbg !61
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !61
  %10 = load i32, i32* %.omp.lb, align 4, !dbg !61
  store i32 %10, i32* %.omp.iv, align 4, !dbg !61
  br label %omp.inner.for.cond, !dbg !63

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %11 = load i32, i32* %.omp.iv, align 4, !dbg !64
  %12 = load i32, i32* %.omp.ub, align 4, !dbg !64
  %cmp1 = icmp sle i32 %11, %12, !dbg !44
  br i1 %cmp1, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !66

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %13 = load i32, i32* %.omp.iv, align 4, !dbg !67
  %mul = mul nsw i32 %13, 1, !dbg !69
  %add = add nsw i32 0, %mul, !dbg !69
  store i32 %add, i32* %i, align 4, !dbg !69
  %14 = load i32, i32* %3, align 4, !dbg !70
  %15 = load i32, i32* %i, align 4, !dbg !72
  %add2 = add nsw i32 %14, %15, !dbg !73
  %16 = load i32, i32* %i, align 4, !dbg !74
  %idxprom = sext i32 %16 to i64, !dbg !75
  %arrayidx = getelementptr inbounds [20 x i32], [20 x i32]* %2, i64 0, i64 %idxprom, !dbg !75
  store i32 %add2, i32* %arrayidx, align 4, !dbg !76
  %17 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !77
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0), i8** %17, align 8, !dbg !77
  call void @__kmpc_critical(%ident_t* %.kmpc_loc.addr, i32 %7, [8 x i32]* @.gomp_critical_user_.var), !dbg !77
  %18 = load i32, i32* %4, align 4, !dbg !78
  %inc = add nsw i32 %18, 1, !dbg !78
  store i32 %inc, i32* %4, align 4, !dbg !78
  call void @__kmpc_end_critical(%ident_t* %.kmpc_loc.addr, i32 %7, [8 x i32]* @.gomp_critical_user_.var), !dbg !80
  br label %omp.body.continue, !dbg !81

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !82

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %19 = load i32, i32* %.omp.iv, align 4, !dbg !83
  %add3 = add nsw i32 %19, 1, !dbg !85
  store i32 %add3, i32* %.omp.iv, align 4, !dbg !85
  br label %omp.inner.for.cond, !dbg !86, !llvm.loop !87

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !88

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  %20 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !89
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @3, i32 0, i32 0), i8** %20, align 8, !dbg !89
  call void @__kmpc_for_static_fini(%ident_t* %.kmpc_loc.addr, i32 %7), !dbg !89
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
