; ModuleID = 'sourcefile.c'
source_filename = "sourcefile.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [39 x i8] c"outer parallel region Thread ID == %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;30;21;;\00"
@2 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;30;55;;\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !6 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %blablabla = alloca i32, align 4
  %n = alloca i32, align 4
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !10, metadata !11), !dbg !12
  call void @omp_set_num_threads(i32 32), !dbg !13
  call void @llvm.dbg.declare(metadata i32* %blablabla, metadata !14, metadata !11), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %n, metadata !16, metadata !11), !dbg !17
  store i32 10000, i32* %n, align 4, !dbg !17
  %call = call i32 @omp_get_thread_num(), !dbg !18
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str, i32 0, i32 0), i32 %call), !dbg !19
  store i32 0, i32* %blablabla, align 4, !dbg !21
  %2 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !22
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %2, align 8, !dbg !22
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* %.kmpc_loc.addr, i32 2, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %n, i32* %blablabla), !dbg !22
  ret i32 0, !dbg !23
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @omp_set_num_threads(i32) #2

declare i32 @printf(i8*, ...) #2

declare i32 @omp_get_thread_num() #2

; Function Attrs: nounwind uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %n, i32* dereferenceable(4) %blablabla) #0 !dbg !24 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %n.addr = alloca i32*, align 8
  %blablabla.addr = alloca i32*, align 8
  %.omp.iv = alloca i32, align 4
  %.capture_expr. = alloca i32, align 4
  %.capture_expr.1 = alloca i32, align 4
  %i = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !31, metadata !11), !dbg !32
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !33, metadata !11), !dbg !32
  store i32* %n, i32** %n.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %n.addr, metadata !34, metadata !11), !dbg !32
  store i32* %blablabla, i32** %blablabla.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %blablabla.addr, metadata !35, metadata !11), !dbg !32
  %2 = load i32*, i32** %n.addr, align 8, !dbg !36
  %3 = load i32*, i32** %blablabla.addr, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !37, metadata !11), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %.capture_expr., metadata !38, metadata !11), !dbg !32
  %4 = load i32, i32* %2, align 4, !dbg !39
  store i32 %4, i32* %.capture_expr., align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %.capture_expr.1, metadata !38, metadata !11), !dbg !32
  %5 = load i32, i32* %.capture_expr., align 4, !dbg !39
  %sub = sub nsw i32 %5, 0, !dbg !36
  %sub2 = sub nsw i32 %sub, 1, !dbg !36
  %add = add nsw i32 %sub2, 1, !dbg !36
  %div = sdiv i32 %add, 1, !dbg !36
  %sub3 = sub nsw i32 %div, 1, !dbg !32
  store i32 %sub3, i32* %.capture_expr.1, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %i, metadata !40, metadata !11), !dbg !32
  store i32 0, i32* %i, align 4, !dbg !41
  %6 = load i32, i32* %.capture_expr., align 4, !dbg !39
  %cmp = icmp slt i32 0, %6, !dbg !36
  br i1 %cmp, label %omp.precond.then, label %omp.precond.end, !dbg !36

omp.precond.then:                                 ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !42, metadata !11), !dbg !32
  store i32 0, i32* %.omp.lb, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !45, metadata !11), !dbg !32
  %7 = load i32, i32* %.capture_expr.1, align 4, !dbg !46
  store i32 %7, i32* %.omp.ub, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !47, metadata !11), !dbg !32
  store i32 1, i32* %.omp.stride, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !48, metadata !11), !dbg !32
  store i32 0, i32* %.omp.is_last, align 4, !dbg !43
  %8 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !49
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %8, align 8, !dbg !49
  %9 = load i32*, i32** %.global_tid..addr, align 8, !dbg !49
  %10 = load i32, i32* %9, align 4, !dbg !49
  call void @__kmpc_for_static_init_4(%ident_t* %.kmpc_loc.addr, i32 %10, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !49
  %11 = load i32, i32* %.omp.ub, align 4, !dbg !43
  %12 = load i32, i32* %.capture_expr.1, align 4, !dbg !46
  %cmp4 = icmp sgt i32 %11, %12, !dbg !43
  br i1 %cmp4, label %cond.true, label %cond.false, !dbg !43

cond.true:                                        ; preds = %omp.precond.then
  %13 = load i32, i32* %.capture_expr.1, align 4, !dbg !50
  br label %cond.end, !dbg !52

cond.false:                                       ; preds = %omp.precond.then
  %14 = load i32, i32* %.omp.ub, align 4, !dbg !53
  br label %cond.end, !dbg !53

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %13, %cond.true ], [ %14, %cond.false ], !dbg !55
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !55
  %15 = load i32, i32* %.omp.lb, align 4, !dbg !55
  store i32 %15, i32* %.omp.iv, align 4, !dbg !55
  br label %omp.inner.for.cond, !dbg !57

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %16 = load i32, i32* %.omp.iv, align 4, !dbg !58
  %17 = load i32, i32* %.omp.ub, align 4, !dbg !58
  %cmp5 = icmp sle i32 %16, %17, !dbg !60
  br i1 %cmp5, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !61

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %18 = load i32, i32* %.omp.iv, align 4, !dbg !62
  %mul = mul nsw i32 %18, 1, !dbg !64
  %add6 = add nsw i32 0, %mul, !dbg !64
  store i32 %add6, i32* %i, align 4, !dbg !64
  %19 = load i32, i32* %3, align 4, !dbg !65
  %inc = add nsw i32 %19, 1, !dbg !65
  store i32 %inc, i32* %3, align 4, !dbg !65
  br label %omp.body.continue, !dbg !67

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !68

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %20 = load i32, i32* %.omp.iv, align 4, !dbg !69
  %add7 = add nsw i32 %20, 1, !dbg !71
  store i32 %add7, i32* %.omp.iv, align 4, !dbg !71
  br label %omp.inner.for.cond, !dbg !72, !llvm.loop !73

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !74

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  %21 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !75
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0), i8** %21, align 8, !dbg !75
  %22 = load i32*, i32** %.global_tid..addr, align 8, !dbg !75
  %23 = load i32, i32* %22, align 4, !dbg !75
  call void @__kmpc_for_static_fini(%ident_t* %.kmpc_loc.addr, i32 %23), !dbg !75
  br label %omp.precond.end, !dbg !75

omp.precond.end:                                  ; preds = %omp.loop.exit, %entry
  ret void, !dbg !76
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

declare void @__kmpc_for_static_init_4(%ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare void @__kmpc_for_static_fini(%ident_t*, i32)

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

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
!16 = !DILocalVariable(name: "n", scope: !6, file: !1, line: 14, type: !9)
!17 = !DILocation(line: 14, column: 9, scope: !6)
!18 = !DILocation(line: 18, column: 58, scope: !6)
!19 = !DILocation(line: 18, column: 8, scope: !20)
!20 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!21 = !DILocation(line: 22, column: 14, scope: !6)
!22 = !DILocation(line: 30, column: 21, scope: !6)
!23 = !DILocation(line: 40, column: 5, scope: !6)
!24 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 30, type: !25, isLocal: true, isDefinition: true, scopeLine: 31, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !27, !27, !30, !30}
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!28 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!30 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !9, size: 64, align: 64)
!31 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !24, type: !27, flags: DIFlagArtificial | DIFlagObjectPointer)
!32 = !DILocation(line: 0, scope: !24)
!33 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !24, type: !27, flags: DIFlagArtificial)
!34 = !DILocalVariable(name: "n", arg: 3, scope: !24, type: !30, flags: DIFlagArtificial)
!35 = !DILocalVariable(name: "blablabla", arg: 4, scope: !24, type: !30, flags: DIFlagArtificial)
!36 = !DILocation(line: 31, column: 13, scope: !24)
!37 = !DILocalVariable(name: ".omp.iv", scope: !24, type: !9, flags: DIFlagArtificial)
!38 = !DILocalVariable(name: ".capture_expr.", scope: !24, type: !9, flags: DIFlagArtificial)
!39 = !DILocation(line: 31, column: 27, scope: !24)
!40 = !DILocalVariable(name: "i", scope: !24, type: !9, flags: DIFlagArtificial)
!41 = !DILocation(line: 31, column: 29, scope: !24)
!42 = !DILocalVariable(name: ".omp.lb", scope: !24, type: !9, flags: DIFlagArtificial)
!43 = !DILocation(line: 31, column: 17, scope: !44)
!44 = !DILexicalBlockFile(scope: !24, file: !1, discriminator: 1)
!45 = !DILocalVariable(name: ".omp.ub", scope: !24, type: !9, flags: DIFlagArtificial)
!46 = !DILocation(line: 0, scope: !44)
!47 = !DILocalVariable(name: ".omp.stride", scope: !24, type: !9, flags: DIFlagArtificial)
!48 = !DILocalVariable(name: ".omp.is_last", scope: !24, type: !9, flags: DIFlagArtificial)
!49 = !DILocation(line: 31, column: 13, scope: !44)
!50 = !DILocation(line: 0, scope: !51)
!51 = !DILexicalBlockFile(scope: !24, file: !1, discriminator: 2)
!52 = !DILocation(line: 31, column: 17, scope: !51)
!53 = !DILocation(line: 31, column: 17, scope: !54)
!54 = !DILexicalBlockFile(scope: !24, file: !1, discriminator: 3)
!55 = !DILocation(line: 31, column: 17, scope: !56)
!56 = !DILexicalBlockFile(scope: !24, file: !1, discriminator: 4)
!57 = !DILocation(line: 31, column: 13, scope: !56)
!58 = !DILocation(line: 31, column: 17, scope: !59)
!59 = !DILexicalBlockFile(scope: !24, file: !1, discriminator: 5)
!60 = !DILocation(line: 0, scope: !54)
!61 = !DILocation(line: 31, column: 13, scope: !59)
!62 = !DILocation(line: 31, column: 17, scope: !63)
!63 = !DILexicalBlockFile(scope: !24, file: !1, discriminator: 6)
!64 = !DILocation(line: 31, column: 29, scope: !63)
!65 = !DILocation(line: 35, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !24, file: !1, line: 32, column: 13)
!67 = !DILocation(line: 37, column: 13, scope: !66)
!68 = !DILocation(line: 30, column: 21, scope: !24)
!69 = !DILocation(line: 31, column: 17, scope: !70)
!70 = !DILexicalBlockFile(scope: !24, file: !1, discriminator: 7)
!71 = !DILocation(line: 0, scope: !56)
!72 = !DILocation(line: 30, column: 21, scope: !44)
!73 = distinct !{!73, !36}
!74 = !DILocation(line: 30, column: 21, scope: !51)
!75 = !DILocation(line: 30, column: 21, scope: !54)
!76 = !DILocation(line: 37, column: 13, scope: !44)
