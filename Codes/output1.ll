; ModuleID = 'sourcefile.c'
source_filename = "sourcefile.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@n = constant i32 20, align 4
@.str = private unnamed_addr constant [17 x i8] c"test source file\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !10 {
entry:
  %retval = alloca i32, align 4
  %Ehsan = alloca i32, align 4
  %a = alloca [20 x i32], align 16
  %b = alloca i32, align 4
  %x = alloca i32, align 4
  %hasan = alloca i32, align 4
  %i = alloca i32, align 4
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
  %0 = load i32, i32* %x, align 4, !dbg !27
  store i32 %0, i32* %Ehsan, align 4, !dbg !28
  %1 = load i32, i32* %hasan, align 4, !dbg !29
  store i32 %1, i32* %Ehsan, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !14), !dbg !33
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !35
  %cmp = icmp slt i32 %2, 20, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %b, align 4, !dbg !40
  %4 = load i32, i32* %i, align 4, !dbg !42
  %add = add nsw i32 %3, %4, !dbg !43
  %5 = load i32, i32* %i, align 4, !dbg !44
  %idxprom = sext i32 %5 to i64, !dbg !45
  %arrayidx = getelementptr inbounds [20 x i32], [20 x i32]* %a, i64 0, i64 %idxprom, !dbg !45
  store i32 %add, i32* %arrayidx, align 4, !dbg !46
  %6 = load i32, i32* %x, align 4, !dbg !47
  %inc = add nsw i32 %6, 1, !dbg !47
  store i32 %inc, i32* %x, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !49
  %inc1 = add nsw i32 %7, 1, !dbg !49
  store i32 %inc1, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0)), !dbg !54
  ret i32 0, !dbg !55
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.1 (tags/RELEASE_391/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3)
!1 = !DIFile(filename: "sourcefile.c", directory: "/home/amiryousefi/llvmTemp/test")
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
!31 = !DILocalVariable(name: "i", scope: !32, file: !1, line: 16, type: !6)
!32 = distinct !DILexicalBlock(scope: !10, file: !1, line: 16, column: 2)
!33 = !DILocation(line: 16, column: 11, scope: !32)
!34 = !DILocation(line: 16, column: 7, scope: !32)
!35 = !DILocation(line: 16, column: 18, scope: !36)
!36 = !DILexicalBlockFile(scope: !37, file: !1, discriminator: 1)
!37 = distinct !DILexicalBlock(scope: !32, file: !1, line: 16, column: 2)
!38 = !DILocation(line: 16, column: 20, scope: !36)
!39 = !DILocation(line: 16, column: 2, scope: !36)
!40 = !DILocation(line: 18, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !1, line: 17, column: 2)
!42 = !DILocation(line: 18, column: 10, scope: !41)
!43 = !DILocation(line: 18, column: 9, scope: !41)
!44 = !DILocation(line: 18, column: 5, scope: !41)
!45 = !DILocation(line: 18, column: 3, scope: !41)
!46 = !DILocation(line: 18, column: 7, scope: !41)
!47 = !DILocation(line: 20, column: 4, scope: !41)
!48 = !DILocation(line: 21, column: 2, scope: !41)
!49 = !DILocation(line: 16, column: 25, scope: !50)
!50 = !DILexicalBlockFile(scope: !37, file: !1, discriminator: 2)
!51 = !DILocation(line: 16, column: 2, scope: !50)
!52 = distinct !{!52, !53}
!53 = !DILocation(line: 16, column: 2, scope: !10)
!54 = !DILocation(line: 23, column: 1, scope: !10)
!55 = !DILocation(line: 24, column: 1, scope: !10)
