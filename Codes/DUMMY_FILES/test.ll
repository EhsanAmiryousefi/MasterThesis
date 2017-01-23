; ModuleID = '<stdin>'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@n = constant i32 20, align 4
@.str = private unnamed_addr constant [11 x i8] c"gjggghjjhj\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"main\00"
@.str2 = private unnamed_addr constant [2 x i8] c"b\00"
@.str3 = private unnamed_addr constant [5 x i8] c"main\00"
@.str4 = private unnamed_addr constant [2 x i8] c"i\00"
@.str5 = private unnamed_addr constant [5 x i8] c"main\00"
@.str6 = private unnamed_addr constant [2 x i8] c"i\00"
@.str7 = private unnamed_addr constant [5 x i8] c"main\00"
@.str8 = private unnamed_addr constant [2 x i8] c"b\00"
@.str9 = private unnamed_addr constant [5 x i8] c"main\00"
@.str10 = private unnamed_addr constant [2 x i8] c"i\00"
@.str11 = private unnamed_addr constant [5 x i8] c"main\00"
@.str12 = private unnamed_addr constant [2 x i8] c"i\00"
@.str13 = private unnamed_addr constant [5 x i8] c"main\00"
@.str14 = private unnamed_addr constant [2 x i8] c"a\00"
@.str15 = private unnamed_addr constant [5 x i8] c"main\00"
@.str16 = private unnamed_addr constant [2 x i8] c"i\00"
@.str17 = private unnamed_addr constant [5 x i8] c"main\00"
@.str18 = private unnamed_addr constant [2 x i8] c"i\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [20 x i32], align 16
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata [20 x i32]* %a, metadata !15, metadata !19), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %b, metadata !21, metadata !19), !dbg !22
  %0 = ptrtoint i32* %b to i64
  call void @__DiscoPoPOpenMPWrite(i32 16392, i32 0, i64 %0, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  store i32 1000, i32* %b, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !19), !dbg !25
  %1 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPWrite(i32 16394, i32 0, i64 %1, i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %2 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPRead(i32 16394, i32 1, i64 %2, i8* getelementptr inbounds ([5 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0))
  %3 = load i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %3, 20, !dbg !27
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %4 = ptrtoint i32* %b to i64
  call void @__DiscoPoPOpenMPRead(i32 16396, i32 1, i64 %4, i8* getelementptr inbounds ([5 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0))
  %5 = load i32* %b, align 4, !dbg !32
  %6 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPRead(i32 16396, i32 1, i64 %6, i8* getelementptr inbounds ([5 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str10, i32 0, i32 0))
  %7 = load i32* %i, align 4, !dbg !34
  %add = add nsw i32 %5, %7, !dbg !32
  %8 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPRead(i32 16396, i32 1, i64 %8, i8* getelementptr inbounds ([5 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str12, i32 0, i32 0))
  %9 = load i32* %i, align 4, !dbg !35
  %idxprom = sext i32 %9 to i64, !dbg !36
  %arrayidx = getelementptr inbounds [20 x i32]* %a, i32 0, i64 %idxprom, !dbg !36
  %10 = ptrtoint i32* %arrayidx to i64
  call void @__DiscoPoPOpenMPWrite(i32 16396, i32 0, i64 %10, i8* getelementptr inbounds ([5 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str14, i32 0, i32 0))
  store i32 %add, i32* %arrayidx, align 4, !dbg !36
  br label %for.inc, !dbg !37

for.inc:                                          ; preds = %for.body
  %11 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPRead(i32 16394, i32 1, i64 %11, i8* getelementptr inbounds ([5 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str16, i32 0, i32 0))
  %12 = load i32* %i, align 4, !dbg !38
  %inc = add nsw i32 %12, 1, !dbg !38
  %13 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPWrite(i32 16394, i32 0, i64 %13, i8* getelementptr inbounds ([5 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0))
  store i32 %inc, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !39

for.end:                                          ; preds = %for.cond
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0)), !dbg !40
  ret i32 0, !dbg !41
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

declare void @__DiscoPoPOpenMPInitialize(i8*)

declare void @__DiscoPoPOpenMPFinalize()

declare void @__DiscoPoPOpenMPRead(i32, i32, i64, i8*, i8*)

declare void @__DiscoPoPOpenMPWrite(i32, i32, i64, i8*, i8*)

declare void @__DiscoPoPOpenMPCallBefore(i32)

declare void @__DiscoPoPOpenMPCallAfter(i32, i32)

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = !{!"0x11\0012\00clang version 3.6.1 (tags/RELEASE_361/final)\000\00\000\00\001", !1, !2, !2, !3, !9, !2} ; [ DW_TAG_compile_unit ] [/home/amiryousefi/Codes/DUMMY_FILES/NewTestFile.c] [DW_LANG_C99]
!1 = !{!"NewTestFile.c", !"/home/amiryousefi/Codes/DUMMY_FILES"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x2e\00main\00main\00\006\000\001\000\000\000\000\006", !1, !5, !6, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 6] [def] [main]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/amiryousefi/Codes/DUMMY_FILES/NewTestFile.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!10}
!10 = !{!"0x34\00n\00n\00\004\000\001", null, !5, !11, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 4] [def]
!11 = !{!"0x26\00\000\000\000\000\000", null, null, !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!12 = !{i32 2, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 2}
!14 = !{!"clang version 3.6.1 (tags/RELEASE_361/final)"}
!15 = !{!"0x100\00a\007\000", !4, !5, !16}        ; [ DW_TAG_auto_variable ] [a] [line 7]
!16 = !{!"0x1\00\000\00640\0032\000\000\000", null, null, !8, !17, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 32, offset 0] [from int]
!17 = !{!18}
!18 = !{!"0x21\000\0020"}                         ; [ DW_TAG_subrange_type ] [0, 19]
!19 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!20 = !MDLocation(line: 7, column: 6, scope: !4)
!21 = !{!"0x100\00b\008\000", !4, !5, !8}         ; [ DW_TAG_auto_variable ] [b] [line 8]
!22 = !MDLocation(line: 8, column: 6, scope: !4)
!23 = !{!"0x100\00i\0010\000", !24, !5, !8}       ; [ DW_TAG_auto_variable ] [i] [line 10]
!24 = !{!"0xb\0010\002\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/amiryousefi/Codes/DUMMY_FILES/NewTestFile.c]
!25 = !MDLocation(line: 10, column: 11, scope: !24)
!26 = !MDLocation(line: 10, column: 7, scope: !24)
!27 = !MDLocation(line: 10, column: 18, scope: !28)
!28 = !{!"0xb\002", !1, !29}                      ; [ DW_TAG_lexical_block ] [/home/amiryousefi/Codes/DUMMY_FILES/NewTestFile.c]
!29 = !{!"0xb\001", !1, !30}                      ; [ DW_TAG_lexical_block ] [/home/amiryousefi/Codes/DUMMY_FILES/NewTestFile.c]
!30 = !{!"0xb\0010\002\001", !1, !24}             ; [ DW_TAG_lexical_block ] [/home/amiryousefi/Codes/DUMMY_FILES/NewTestFile.c]
!31 = !MDLocation(line: 10, column: 2, scope: !24)
!32 = !MDLocation(line: 12, column: 8, scope: !33)
!33 = !{!"0xb\0011\002\002", !1, !30}             ; [ DW_TAG_lexical_block ] [/home/amiryousefi/Codes/DUMMY_FILES/NewTestFile.c]
!34 = !MDLocation(line: 12, column: 10, scope: !33)
!35 = !MDLocation(line: 12, column: 5, scope: !33)
!36 = !MDLocation(line: 12, column: 3, scope: !33)
!37 = !MDLocation(line: 13, column: 2, scope: !33)
!38 = !MDLocation(line: 10, column: 25, scope: !30)
!39 = !MDLocation(line: 10, column: 2, scope: !30)
!40 = !MDLocation(line: 14, column: 1, scope: !4)
!41 = !MDLocation(line: 15, column: 1, scope: !4)
