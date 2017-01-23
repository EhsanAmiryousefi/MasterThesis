; ModuleID = '<stdin>'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%d \0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"Ehsan Amiryousefi\0A\00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"main\00"
@.str3 = private unnamed_addr constant [2 x i8] c"a\00"
@.str4 = private unnamed_addr constant [5 x i8] c"main\00"
@.str5 = private unnamed_addr constant [2 x i8] c"b\00"
@.str6 = private unnamed_addr constant [5 x i8] c"main\00"
@.str7 = private unnamed_addr constant [2 x i8] c"a\00"
@.str8 = private unnamed_addr constant [5 x i8] c"main\00"
@.str9 = private unnamed_addr constant [2 x i8] c"b\00"
@.str10 = private unnamed_addr constant [5 x i8] c"main\00"
@.str11 = private unnamed_addr constant [2 x i8] c"c\00"
@.str12 = private unnamed_addr constant [5 x i8] c"main\00"
@.str13 = private unnamed_addr constant [2 x i8] c"c\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata i32* %a, metadata !15, metadata !16), !dbg !17
  %0 = ptrtoint i32* %a to i64
  call void @__DiscoPoPOpenMPWrite(i32 16388, i32 0, i64 %0, i8* getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0))
  store i32 10, i32* %a, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %b, metadata !18, metadata !16), !dbg !19
  %1 = ptrtoint i32* %b to i64
  call void @__DiscoPoPOpenMPWrite(i32 16389, i32 0, i64 %1, i8* getelementptr inbounds ([5 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0))
  store i32 12, i32* %b, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %c, metadata !20, metadata !16), !dbg !21
  %2 = ptrtoint i32* %a to i64
  call void @__DiscoPoPOpenMPRead(i32 16390, i32 1, i64 %2, i8* getelementptr inbounds ([5 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0))
  %3 = load i32* %a, align 4, !dbg !22
  %4 = ptrtoint i32* %b to i64
  call void @__DiscoPoPOpenMPRead(i32 16390, i32 1, i64 %4, i8* getelementptr inbounds ([5 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str9, i32 0, i32 0))
  %5 = load i32* %b, align 4, !dbg !23
  %mul = mul nsw i32 %3, %5, !dbg !22
  %6 = ptrtoint i32* %c to i64
  call void @__DiscoPoPOpenMPWrite(i32 16390, i32 0, i64 %6, i8* getelementptr inbounds ([5 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str11, i32 0, i32 0))
  store i32 %mul, i32* %c, align 4, !dbg !21
  %7 = ptrtoint i32* %c to i64
  call void @__DiscoPoPOpenMPRead(i32 16391, i32 1, i64 %7, i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str13, i32 0, i32 0))
  %8 = load i32* %c, align 4, !dbg !24
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i32 %8), !dbg !25
  call void @getEhsanName(), !dbg !26
  ret i32 0, !dbg !27
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @getEhsanName() #0 {
entry:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0)), !dbg !28
  ret void, !dbg !29
}

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

!0 = !{!"0x11\0012\00clang version 3.6.1 (tags/RELEASE_361/final)\000\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/amiryousefi/Codes/DUMMY_FILES/NewTestFile.c] [DW_LANG_C99]
!1 = !{!"NewTestFile.c", !"/home/amiryousefi/Codes/DUMMY_FILES"}
!2 = !{}
!3 = !{!4, !9}
!4 = !{!"0x2e\00main\00main\00\003\000\001\000\000\000\000\003", !1, !5, !6, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 3] [def] [main]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/amiryousefi/Codes/DUMMY_FILES/NewTestFile.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0x2e\00getEhsanName\00getEhsanName\00\0012\000\001\000\000\000\000\0013", !1, !5, !10, null, void ()* @getEhsanName, null, null, !2} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 13] [getEhsanName]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{null}
!12 = !{i32 2, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 2}
!14 = !{!"clang version 3.6.1 (tags/RELEASE_361/final)"}
!15 = !{!"0x100\00a\004\000", !4, !5, !8}         ; [ DW_TAG_auto_variable ] [a] [line 4]
!16 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!17 = !MDLocation(line: 4, column: 6, scope: !4)
!18 = !{!"0x100\00b\005\000", !4, !5, !8}         ; [ DW_TAG_auto_variable ] [b] [line 5]
!19 = !MDLocation(line: 5, column: 6, scope: !4)
!20 = !{!"0x100\00c\006\000", !4, !5, !8}         ; [ DW_TAG_auto_variable ] [c] [line 6]
!21 = !MDLocation(line: 6, column: 6, scope: !4)
!22 = !MDLocation(line: 6, column: 10, scope: !4)
!23 = !MDLocation(line: 6, column: 12, scope: !4)
!24 = !MDLocation(line: 7, column: 18, scope: !4)
!25 = !MDLocation(line: 7, column: 2, scope: !4)
!26 = !MDLocation(line: 8, column: 2, scope: !4)
!27 = !MDLocation(line: 9, column: 1, scope: !4)
!28 = !MDLocation(line: 14, column: 2, scope: !9)
!29 = !MDLocation(line: 15, column: 1, scope: !9)
