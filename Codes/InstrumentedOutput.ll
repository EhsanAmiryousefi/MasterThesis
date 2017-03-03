; ModuleID = '<stdin>'
source_filename = "sourcefile.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%ident_t = type { i32, i32, i32, i32, i8* }
%struct.anon = type { i32*, double, i32*, double*, i64, double*, double*, double*, i32 }
%struct.kmp_task_t_with_privates = type { %struct.kmp_task_t, %struct..kmp_privates.t }
%struct.kmp_task_t = type { i8*, i32 (i32, i8*)*, i32, %union.kmp_cmplrdata_t, %union.kmp_cmplrdata_t }
%union.kmp_cmplrdata_t = type { i32 (i32, i8*)* }
%struct..kmp_privates.t = type { double, double, i32, i32 }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [27 x i8] c";sourcefile.c;main;94;11;;\00"
@2 = private unnamed_addr constant [28 x i8] c";sourcefile.c;main;102;15;;\00"
@3 = private unnamed_addr constant [26 x i8] c";sourcefile.c;main;92;9;;\00"
@.str.2 = private unnamed_addr constant [19 x i8] c"PRIVATE- time: %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.3 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.4 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.5 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.6 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.7 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.8 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.9 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.10 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.11 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.12 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.13 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.14 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.15 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.16 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.17 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.18 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.19 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.20 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.21 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.22 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.23 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.24 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.25 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.26 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.27 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.28 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.29 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.30 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.31 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.32 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.33 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.34 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.35 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.36 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.37 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.38 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.39 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.40 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.41 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.42 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.43 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.44 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.45 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.46 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.47 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.48 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.49 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.50 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.51 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.52 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.53 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.54 = private unnamed_addr constant [7 x i8] c"randlc\00"
@.str.55 = private unnamed_addr constant [66 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::randlc line: 4\00"
@.str.56 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.57 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.58 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.59 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.60 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.61 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.62 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.63 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.64 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.65 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.66 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.67 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.68 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.69 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.70 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.71 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.72 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.73 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.74 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.75 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.76 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.77 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.78 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.79 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.80 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.81 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.82 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.83 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.84 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.85 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.86 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.87 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.88 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.89 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.90 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.91 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.92 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.93 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.94 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.95 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.96 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.97 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.98 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.99 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.100 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.101 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.102 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.103 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.104 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.105 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.106 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.107 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.108 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.109 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.110 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.111 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.112 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.113 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.114 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.115 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.116 = private unnamed_addr constant [7 x i8] c"vranlc\00"
@.str.117 = private unnamed_addr constant [67 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::vranlc line: 34\00"
@.str.118 = private unnamed_addr constant [5 x i8] c"main\00"
@.str.119 = private unnamed_addr constant [65 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::main line: 69\00"
@.str.120 = private unnamed_addr constant [17 x i8] c"No name attached\00"
@.str.121 = private unnamed_addr constant [79 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::__kmpc_fork_call line: 0:92\00"
@.str.122 = private unnamed_addr constant [5 x i8] c"main\00"
@.str.123 = private unnamed_addr constant [65 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::main line: 69\00"
@.str.124 = private unnamed_addr constant [5 x i8] c"main\00"
@.str.125 = private unnamed_addr constant [65 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::main line: 69\00"
@.str.126 = private unnamed_addr constant [5 x i8] c"main\00"
@.str.127 = private unnamed_addr constant [65 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::main line: 69\00"
@.str.128 = private unnamed_addr constant [5 x i8] c"main\00"
@.str.129 = private unnamed_addr constant [65 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::main line: 69\00"
@.str.130 = private unnamed_addr constant [5 x i8] c"main\00"
@.str.131 = private unnamed_addr constant [65 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::main line: 69\00"
@.str.132 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.133 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.134 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.135 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.136 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.137 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.138 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.139 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.140 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.141 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.142 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.143 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.144 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.145 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.146 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.147 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.148 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.149 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.150 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.151 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.152 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.153 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.154 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.155 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.156 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.157 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.158 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.159 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.160 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.161 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.162 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.163 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.164 = private unnamed_addr constant [17 x i8] c"No name attached\00"
@.str.165 = private unnamed_addr constant [76 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::__kmpc_single line: 0:94\00"
@.str.166 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.167 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.168 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.169 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.170 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.171 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.172 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.173 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.174 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.175 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.176 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.177 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.178 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.179 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.180 = private unnamed_addr constant [17 x i8] c"No name attached\00"
@.str.181 = private unnamed_addr constant [85 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::__kmpc_omp_task_alloc line: 0:102\00"
@.str.182 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.183 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.184 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.185 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.186 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.187 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.188 = private unnamed_addr constant [17 x i8] c"No name attached\00"
@.str.189 = private unnamed_addr constant [79 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::__kmpc_omp_task line: 0:102\00"
@.str.190 = private unnamed_addr constant [15 x i8] c".omp_outlined.\00"
@.str.191 = private unnamed_addr constant [75 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_outlined. line: 93\00"
@.str.192 = private unnamed_addr constant [17 x i8] c"No name attached\00"
@.str.193 = private unnamed_addr constant [81 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::__kmpc_end_single line: 0:109\00"
@.str.194 = private unnamed_addr constant [17 x i8] c"No name attached\00"
@.str.195 = private unnamed_addr constant [77 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::__kmpc_barrier line: 0:94\00"
@.str.196 = private unnamed_addr constant [24 x i8] c".omp_task_privates_map.\00"
@.str.197 = private unnamed_addr constant [24 x i8] c".omp_task_privates_map.\00"
@.str.198 = private unnamed_addr constant [24 x i8] c".omp_task_privates_map.\00"
@.str.199 = private unnamed_addr constant [24 x i8] c".omp_task_privates_map.\00"
@.str.200 = private unnamed_addr constant [24 x i8] c".omp_task_privates_map.\00"
@.str.201 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.202 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.203 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.204 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.205 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.206 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.207 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.208 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.209 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.210 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.211 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.212 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.213 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.214 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.215 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.216 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.217 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.218 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.219 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.220 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.221 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.222 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.223 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.224 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.225 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.226 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.227 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.228 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.229 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.230 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.231 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.232 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.233 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.234 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.235 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.236 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.237 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.238 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.239 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"
@.str.240 = private unnamed_addr constant [17 x i8] c".omp_task_entry.\00"
@.str.241 = private unnamed_addr constant [78 x i8] c"/home/amiryousefi/MasterThesis/Codes/sourcefile.c::.omp_task_entry. line: 103\00"

; Function Attrs: nounwind uwtable
define double @randlc(double* %x, double %a) #0 !dbg !9 {
entry:
  %x.addr = alloca double*, align 8
  %a.addr = alloca double, align 8
  %r23 = alloca double, align 8
  %r46 = alloca double, align 8
  %t23 = alloca double, align 8
  %t46 = alloca double, align 8
  %t1 = alloca double, align 8
  %t2 = alloca double, align 8
  %t3 = alloca double, align 8
  %t4 = alloca double, align 8
  %a1 = alloca double, align 8
  %a2 = alloca double, align 8
  %x1 = alloca double, align 8
  %x2 = alloca double, align 8
  %z = alloca double, align 8
  %r = alloca double, align 8
  %0 = ptrtoint double** %x.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %0)
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !13, metadata !14), !dbg !15
  %1 = ptrtoint double* %a.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %1)
  store double %a, double* %a.addr, align 8
  call void @llvm.dbg.declare(metadata double* %a.addr, metadata !16, metadata !14), !dbg !17
  call void @llvm.dbg.declare(metadata double* %r23, metadata !18, metadata !14), !dbg !20
  %2 = ptrtoint double* %r23 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %2)
  store double 0x3E80000000000000, double* %r23, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata double* %r46, metadata !21, metadata !14), !dbg !22
  %3 = ptrtoint double* %r46 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %3)
  store double 0x3D10000000000000, double* %r46, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata double* %t23, metadata !23, metadata !14), !dbg !24
  %4 = ptrtoint double* %t23 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %4)
  store double 8.388608e+06, double* %t23, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata double* %t46, metadata !25, metadata !14), !dbg !26
  %5 = ptrtoint double* %t46 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %5)
  store double 0x42D0000000000000, double* %t46, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata double* %t1, metadata !27, metadata !14), !dbg !28
  call void @llvm.dbg.declare(metadata double* %t2, metadata !29, metadata !14), !dbg !30
  call void @llvm.dbg.declare(metadata double* %t3, metadata !31, metadata !14), !dbg !32
  call void @llvm.dbg.declare(metadata double* %t4, metadata !33, metadata !14), !dbg !34
  call void @llvm.dbg.declare(metadata double* %a1, metadata !35, metadata !14), !dbg !36
  call void @llvm.dbg.declare(metadata double* %a2, metadata !37, metadata !14), !dbg !38
  call void @llvm.dbg.declare(metadata double* %x1, metadata !39, metadata !14), !dbg !40
  call void @llvm.dbg.declare(metadata double* %x2, metadata !41, metadata !14), !dbg !42
  call void @llvm.dbg.declare(metadata double* %z, metadata !43, metadata !14), !dbg !44
  call void @llvm.dbg.declare(metadata double* %r, metadata !45, metadata !14), !dbg !46
  %6 = ptrtoint double* %a.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %6, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.3, i32 0, i32 0), i32 8, i32 0, i32 0)
  %7 = load double, double* %a.addr, align 8, !dbg !47
  %mul = fmul double 0x3E80000000000000, %7, !dbg !48
  %8 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %8)
  store double %mul, double* %t1, align 8, !dbg !49
  %9 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %9, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.5, i32 0, i32 0), i32 8, i32 0, i32 0)
  %10 = load double, double* %t1, align 8, !dbg !50
  %conv = fptosi double %10 to i32, !dbg !51
  %conv1 = sitofp i32 %conv to double, !dbg !51
  %11 = ptrtoint double* %a1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %11)
  store double %conv1, double* %a1, align 8, !dbg !52
  %12 = ptrtoint double* %a.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %12, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.7, i32 0, i32 0), i32 8, i32 0, i32 0)
  %13 = load double, double* %a.addr, align 8, !dbg !53
  %14 = ptrtoint double* %a1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %14, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.9, i32 0, i32 0), i32 8, i32 0, i32 0)
  %15 = load double, double* %a1, align 8, !dbg !54
  %mul2 = fmul double 8.388608e+06, %15, !dbg !55
  %sub = fsub double %13, %mul2, !dbg !56
  %16 = ptrtoint double* %a2 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %16)
  store double %sub, double* %a2, align 8, !dbg !57
  %17 = ptrtoint double** %x.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %17, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.11, i32 0, i32 0), i32 8, i32 0, i32 0)
  %18 = load double*, double** %x.addr, align 8, !dbg !58
  %19 = ptrtoint double* %18 to i64
  call void @__DiscoPoPOpenMPRead(i64 %19, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.13, i32 0, i32 0), i32 8, i32 0, i32 0)
  %20 = load double, double* %18, align 8, !dbg !59
  %mul3 = fmul double 0x3E80000000000000, %20, !dbg !60
  %21 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %21)
  store double %mul3, double* %t1, align 8, !dbg !61
  %22 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %22, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.15, i32 0, i32 0), i32 8, i32 0, i32 0)
  %23 = load double, double* %t1, align 8, !dbg !62
  %conv4 = fptosi double %23 to i32, !dbg !63
  %conv5 = sitofp i32 %conv4 to double, !dbg !63
  %24 = ptrtoint double* %x1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %24)
  store double %conv5, double* %x1, align 8, !dbg !64
  %25 = ptrtoint double** %x.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %25, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.17, i32 0, i32 0), i32 8, i32 0, i32 0)
  %26 = load double*, double** %x.addr, align 8, !dbg !65
  %27 = ptrtoint double* %26 to i64
  call void @__DiscoPoPOpenMPRead(i64 %27, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.19, i32 0, i32 0), i32 8, i32 0, i32 0)
  %28 = load double, double* %26, align 8, !dbg !66
  %29 = ptrtoint double* %x1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %29, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.21, i32 0, i32 0), i32 8, i32 0, i32 0)
  %30 = load double, double* %x1, align 8, !dbg !67
  %mul6 = fmul double 8.388608e+06, %30, !dbg !68
  %sub7 = fsub double %28, %mul6, !dbg !69
  %31 = ptrtoint double* %x2 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %31)
  store double %sub7, double* %x2, align 8, !dbg !70
  %32 = ptrtoint double* %a1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %32, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.23, i32 0, i32 0), i32 8, i32 0, i32 0)
  %33 = load double, double* %a1, align 8, !dbg !71
  %34 = ptrtoint double* %x2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %34, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.25, i32 0, i32 0), i32 8, i32 0, i32 0)
  %35 = load double, double* %x2, align 8, !dbg !72
  %mul8 = fmul double %33, %35, !dbg !73
  %36 = ptrtoint double* %a2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %36, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.27, i32 0, i32 0), i32 8, i32 0, i32 0)
  %37 = load double, double* %a2, align 8, !dbg !74
  %38 = ptrtoint double* %x1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %38, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.29, i32 0, i32 0), i32 8, i32 0, i32 0)
  %39 = load double, double* %x1, align 8, !dbg !75
  %mul9 = fmul double %37, %39, !dbg !76
  %add = fadd double %mul8, %mul9, !dbg !77
  %40 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %40)
  store double %add, double* %t1, align 8, !dbg !78
  %41 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %41, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.31, i32 0, i32 0), i32 8, i32 0, i32 0)
  %42 = load double, double* %t1, align 8, !dbg !79
  %mul10 = fmul double 0x3E80000000000000, %42, !dbg !80
  %conv11 = fptosi double %mul10 to i32, !dbg !81
  %conv12 = sitofp i32 %conv11 to double, !dbg !81
  %43 = ptrtoint double* %t2 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %43)
  store double %conv12, double* %t2, align 8, !dbg !82
  %44 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %44, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.33, i32 0, i32 0), i32 8, i32 0, i32 0)
  %45 = load double, double* %t1, align 8, !dbg !83
  %46 = ptrtoint double* %t2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %46, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.35, i32 0, i32 0), i32 8, i32 0, i32 0)
  %47 = load double, double* %t2, align 8, !dbg !84
  %mul13 = fmul double 8.388608e+06, %47, !dbg !85
  %sub14 = fsub double %45, %mul13, !dbg !86
  %48 = ptrtoint double* %z to i64
  call void @__DiscoPoPOpenMPWrite(i64 %48)
  store double %sub14, double* %z, align 8, !dbg !87
  %49 = ptrtoint double* %z to i64
  call void @__DiscoPoPOpenMPRead(i64 %49, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.37, i32 0, i32 0), i32 8, i32 0, i32 0)
  %50 = load double, double* %z, align 8, !dbg !88
  %mul15 = fmul double 8.388608e+06, %50, !dbg !89
  %51 = ptrtoint double* %a2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %51, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.39, i32 0, i32 0), i32 8, i32 0, i32 0)
  %52 = load double, double* %a2, align 8, !dbg !90
  %53 = ptrtoint double* %x2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %53, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.41, i32 0, i32 0), i32 8, i32 0, i32 0)
  %54 = load double, double* %x2, align 8, !dbg !91
  %mul16 = fmul double %52, %54, !dbg !92
  %add17 = fadd double %mul15, %mul16, !dbg !93
  %55 = ptrtoint double* %t3 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %55)
  store double %add17, double* %t3, align 8, !dbg !94
  %56 = ptrtoint double* %t3 to i64
  call void @__DiscoPoPOpenMPRead(i64 %56, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.43, i32 0, i32 0), i32 8, i32 0, i32 0)
  %57 = load double, double* %t3, align 8, !dbg !95
  %mul18 = fmul double 0x3D10000000000000, %57, !dbg !96
  %conv19 = fptosi double %mul18 to i32, !dbg !97
  %conv20 = sitofp i32 %conv19 to double, !dbg !97
  %58 = ptrtoint double* %t4 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %58)
  store double %conv20, double* %t4, align 8, !dbg !98
  %59 = ptrtoint double* %t3 to i64
  call void @__DiscoPoPOpenMPRead(i64 %59, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.45, i32 0, i32 0), i32 8, i32 0, i32 0)
  %60 = load double, double* %t3, align 8, !dbg !99
  %61 = ptrtoint double* %t4 to i64
  call void @__DiscoPoPOpenMPRead(i64 %61, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.47, i32 0, i32 0), i32 8, i32 0, i32 0)
  %62 = load double, double* %t4, align 8, !dbg !100
  %mul21 = fmul double 0x42D0000000000000, %62, !dbg !101
  %sub22 = fsub double %60, %mul21, !dbg !102
  %63 = ptrtoint double** %x.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %63, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.49, i32 0, i32 0), i32 8, i32 0, i32 0)
  %64 = load double*, double** %x.addr, align 8, !dbg !103
  %65 = ptrtoint double* %64 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %65)
  store double %sub22, double* %64, align 8, !dbg !104
  %66 = ptrtoint double** %x.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %66, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.51, i32 0, i32 0), i32 8, i32 0, i32 0)
  %67 = load double*, double** %x.addr, align 8, !dbg !105
  %68 = ptrtoint double* %67 to i64
  call void @__DiscoPoPOpenMPRead(i64 %68, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.53, i32 0, i32 0), i32 8, i32 0, i32 0)
  %69 = load double, double* %67, align 8, !dbg !106
  %mul23 = fmul double 0x3D10000000000000, %69, !dbg !107
  %70 = ptrtoint double* %r to i64
  call void @__DiscoPoPOpenMPWrite(i64 %70)
  store double %mul23, double* %r, align 8, !dbg !108
  %71 = ptrtoint double* %r to i64
  call void @__DiscoPoPOpenMPRead(i64 %71, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.55, i32 0, i32 0), i32 8, i32 0, i32 0)
  %72 = load double, double* %r, align 8, !dbg !109
  ret double %72, !dbg !110
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @vranlc(i32 %n, double* %x, double %a, double* %y) #0 !dbg !111 {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca double*, align 8
  %a.addr = alloca double, align 8
  %y.addr = alloca double*, align 8
  %r23 = alloca double, align 8
  %r46 = alloca double, align 8
  %t23 = alloca double, align 8
  %t46 = alloca double, align 8
  %t1 = alloca double, align 8
  %t2 = alloca double, align 8
  %t3 = alloca double, align 8
  %t4 = alloca double, align 8
  %a1 = alloca double, align 8
  %a2 = alloca double, align 8
  %x1 = alloca double, align 8
  %x2 = alloca double, align 8
  %z = alloca double, align 8
  %i = alloca i32, align 4
  %0 = ptrtoint i32* %n.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %0)
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !114, metadata !14), !dbg !115
  %1 = ptrtoint double** %x.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %1)
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !116, metadata !14), !dbg !117
  %2 = ptrtoint double* %a.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %2)
  store double %a, double* %a.addr, align 8
  call void @llvm.dbg.declare(metadata double* %a.addr, metadata !118, metadata !14), !dbg !119
  %3 = ptrtoint double** %y.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %3)
  store double* %y, double** %y.addr, align 8
  call void @llvm.dbg.declare(metadata double** %y.addr, metadata !120, metadata !14), !dbg !121
  call void @llvm.dbg.declare(metadata double* %r23, metadata !122, metadata !14), !dbg !123
  %4 = ptrtoint double* %r23 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %4)
  store double 0x3E80000000000000, double* %r23, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata double* %r46, metadata !124, metadata !14), !dbg !125
  %5 = ptrtoint double* %r46 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %5)
  store double 0x3D10000000000000, double* %r46, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata double* %t23, metadata !126, metadata !14), !dbg !127
  %6 = ptrtoint double* %t23 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %6)
  store double 8.388608e+06, double* %t23, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata double* %t46, metadata !128, metadata !14), !dbg !129
  %7 = ptrtoint double* %t46 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %7)
  store double 0x42D0000000000000, double* %t46, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata double* %t1, metadata !130, metadata !14), !dbg !131
  call void @llvm.dbg.declare(metadata double* %t2, metadata !132, metadata !14), !dbg !133
  call void @llvm.dbg.declare(metadata double* %t3, metadata !134, metadata !14), !dbg !135
  call void @llvm.dbg.declare(metadata double* %t4, metadata !136, metadata !14), !dbg !137
  call void @llvm.dbg.declare(metadata double* %a1, metadata !138, metadata !14), !dbg !139
  call void @llvm.dbg.declare(metadata double* %a2, metadata !140, metadata !14), !dbg !141
  call void @llvm.dbg.declare(metadata double* %x1, metadata !142, metadata !14), !dbg !143
  call void @llvm.dbg.declare(metadata double* %x2, metadata !144, metadata !14), !dbg !145
  call void @llvm.dbg.declare(metadata double* %z, metadata !146, metadata !14), !dbg !147
  call void @llvm.dbg.declare(metadata i32* %i, metadata !148, metadata !14), !dbg !149
  %8 = ptrtoint double* %a.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %8, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.57, i32 0, i32 0), i32 8, i32 0, i32 0)
  %9 = load double, double* %a.addr, align 8, !dbg !150
  %mul = fmul double 0x3E80000000000000, %9, !dbg !151
  %10 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %10)
  store double %mul, double* %t1, align 8, !dbg !152
  %11 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %11, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.59, i32 0, i32 0), i32 8, i32 0, i32 0)
  %12 = load double, double* %t1, align 8, !dbg !153
  %conv = fptosi double %12 to i32, !dbg !154
  %conv1 = sitofp i32 %conv to double, !dbg !154
  %13 = ptrtoint double* %a1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %13)
  store double %conv1, double* %a1, align 8, !dbg !155
  %14 = ptrtoint double* %a.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %14, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.61, i32 0, i32 0), i32 8, i32 0, i32 0)
  %15 = load double, double* %a.addr, align 8, !dbg !156
  %16 = ptrtoint double* %a1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %16, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.63, i32 0, i32 0), i32 8, i32 0, i32 0)
  %17 = load double, double* %a1, align 8, !dbg !157
  %mul2 = fmul double 8.388608e+06, %17, !dbg !158
  %sub = fsub double %15, %mul2, !dbg !159
  %18 = ptrtoint double* %a2 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %18)
  store double %sub, double* %a2, align 8, !dbg !160
  %19 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPWrite(i64 %19)
  store i32 0, i32* %i, align 4, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %entry
  %20 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPRead(i64 %20, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.65, i32 0, i32 0), i32 4, i32 0, i32 0)
  %21 = load i32, i32* %i, align 4, !dbg !164
  %22 = ptrtoint i32* %n.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %22, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.67, i32 0, i32 0), i32 4, i32 0, i32 0)
  %23 = load i32, i32* %n.addr, align 4, !dbg !167
  %cmp = icmp slt i32 %21, %23, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %24 = ptrtoint double** %x.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %24, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.69, i32 0, i32 0), i32 8, i32 0, i32 0)
  %25 = load double*, double** %x.addr, align 8, !dbg !170
  %26 = ptrtoint double* %25 to i64
  call void @__DiscoPoPOpenMPRead(i64 %26, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.71, i32 0, i32 0), i32 8, i32 0, i32 0)
  %27 = load double, double* %25, align 8, !dbg !172
  %mul4 = fmul double 0x3E80000000000000, %27, !dbg !173
  %28 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %28)
  store double %mul4, double* %t1, align 8, !dbg !174
  %29 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %29, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.73, i32 0, i32 0), i32 8, i32 0, i32 0)
  %30 = load double, double* %t1, align 8, !dbg !175
  %conv5 = fptosi double %30 to i32, !dbg !176
  %conv6 = sitofp i32 %conv5 to double, !dbg !176
  %31 = ptrtoint double* %x1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %31)
  store double %conv6, double* %x1, align 8, !dbg !177
  %32 = ptrtoint double** %x.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %32, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.75, i32 0, i32 0), i32 8, i32 0, i32 0)
  %33 = load double*, double** %x.addr, align 8, !dbg !178
  %34 = ptrtoint double* %33 to i64
  call void @__DiscoPoPOpenMPRead(i64 %34, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.77, i32 0, i32 0), i32 8, i32 0, i32 0)
  %35 = load double, double* %33, align 8, !dbg !179
  %36 = ptrtoint double* %x1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %36, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.79, i32 0, i32 0), i32 8, i32 0, i32 0)
  %37 = load double, double* %x1, align 8, !dbg !180
  %mul7 = fmul double 8.388608e+06, %37, !dbg !181
  %sub8 = fsub double %35, %mul7, !dbg !182
  %38 = ptrtoint double* %x2 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %38)
  store double %sub8, double* %x2, align 8, !dbg !183
  %39 = ptrtoint double* %a1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %39, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.81, i32 0, i32 0), i32 8, i32 0, i32 0)
  %40 = load double, double* %a1, align 8, !dbg !184
  %41 = ptrtoint double* %x2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %41, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.83, i32 0, i32 0), i32 8, i32 0, i32 0)
  %42 = load double, double* %x2, align 8, !dbg !185
  %mul9 = fmul double %40, %42, !dbg !186
  %43 = ptrtoint double* %a2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %43, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.85, i32 0, i32 0), i32 8, i32 0, i32 0)
  %44 = load double, double* %a2, align 8, !dbg !187
  %45 = ptrtoint double* %x1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %45, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.87, i32 0, i32 0), i32 8, i32 0, i32 0)
  %46 = load double, double* %x1, align 8, !dbg !188
  %mul10 = fmul double %44, %46, !dbg !189
  %add = fadd double %mul9, %mul10, !dbg !190
  %47 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %47)
  store double %add, double* %t1, align 8, !dbg !191
  %48 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %48, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.89, i32 0, i32 0), i32 8, i32 0, i32 0)
  %49 = load double, double* %t1, align 8, !dbg !192
  %mul11 = fmul double 0x3E80000000000000, %49, !dbg !193
  %conv12 = fptosi double %mul11 to i32, !dbg !194
  %conv13 = sitofp i32 %conv12 to double, !dbg !194
  %50 = ptrtoint double* %t2 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %50)
  store double %conv13, double* %t2, align 8, !dbg !195
  %51 = ptrtoint double* %t1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %51, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.91, i32 0, i32 0), i32 8, i32 0, i32 0)
  %52 = load double, double* %t1, align 8, !dbg !196
  %53 = ptrtoint double* %t2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %53, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.93, i32 0, i32 0), i32 8, i32 0, i32 0)
  %54 = load double, double* %t2, align 8, !dbg !197
  %mul14 = fmul double 8.388608e+06, %54, !dbg !198
  %sub15 = fsub double %52, %mul14, !dbg !199
  %55 = ptrtoint double* %z to i64
  call void @__DiscoPoPOpenMPWrite(i64 %55)
  store double %sub15, double* %z, align 8, !dbg !200
  %56 = ptrtoint double* %z to i64
  call void @__DiscoPoPOpenMPRead(i64 %56, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.95, i32 0, i32 0), i32 8, i32 0, i32 0)
  %57 = load double, double* %z, align 8, !dbg !201
  %mul16 = fmul double 8.388608e+06, %57, !dbg !202
  %58 = ptrtoint double* %a2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %58, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.97, i32 0, i32 0), i32 8, i32 0, i32 0)
  %59 = load double, double* %a2, align 8, !dbg !203
  %60 = ptrtoint double* %x2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %60, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.99, i32 0, i32 0), i32 8, i32 0, i32 0)
  %61 = load double, double* %x2, align 8, !dbg !204
  %mul17 = fmul double %59, %61, !dbg !205
  %add18 = fadd double %mul16, %mul17, !dbg !206
  %62 = ptrtoint double* %t3 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %62)
  store double %add18, double* %t3, align 8, !dbg !207
  %63 = ptrtoint double* %t3 to i64
  call void @__DiscoPoPOpenMPRead(i64 %63, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.101, i32 0, i32 0), i32 8, i32 0, i32 0)
  %64 = load double, double* %t3, align 8, !dbg !208
  %mul19 = fmul double 0x3D10000000000000, %64, !dbg !209
  %conv20 = fptosi double %mul19 to i32, !dbg !210
  %conv21 = sitofp i32 %conv20 to double, !dbg !210
  %65 = ptrtoint double* %t4 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %65)
  store double %conv21, double* %t4, align 8, !dbg !211
  %66 = ptrtoint double* %t3 to i64
  call void @__DiscoPoPOpenMPRead(i64 %66, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.103, i32 0, i32 0), i32 8, i32 0, i32 0)
  %67 = load double, double* %t3, align 8, !dbg !212
  %68 = ptrtoint double* %t4 to i64
  call void @__DiscoPoPOpenMPRead(i64 %68, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.105, i32 0, i32 0), i32 8, i32 0, i32 0)
  %69 = load double, double* %t4, align 8, !dbg !213
  %mul22 = fmul double 0x42D0000000000000, %69, !dbg !214
  %sub23 = fsub double %67, %mul22, !dbg !215
  %70 = ptrtoint double** %x.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %70, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.107, i32 0, i32 0), i32 8, i32 0, i32 0)
  %71 = load double*, double** %x.addr, align 8, !dbg !216
  %72 = ptrtoint double* %71 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %72)
  store double %sub23, double* %71, align 8, !dbg !217
  %73 = ptrtoint double** %x.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %73, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.109, i32 0, i32 0), i32 8, i32 0, i32 0)
  %74 = load double*, double** %x.addr, align 8, !dbg !218
  %75 = ptrtoint double* %74 to i64
  call void @__DiscoPoPOpenMPRead(i64 %75, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.111, i32 0, i32 0), i32 8, i32 0, i32 0)
  %76 = load double, double* %74, align 8, !dbg !219
  %mul24 = fmul double 0x3D10000000000000, %76, !dbg !220
  %77 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPRead(i64 %77, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.113, i32 0, i32 0), i32 4, i32 0, i32 0)
  %78 = load i32, i32* %i, align 4, !dbg !221
  %idxprom = sext i32 %78 to i64, !dbg !222
  %79 = ptrtoint double** %y.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %79, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.115, i32 0, i32 0), i32 8, i32 0, i32 0)
  %80 = load double*, double** %y.addr, align 8, !dbg !222
  %arrayidx = getelementptr inbounds double, double* %80, i64 %idxprom, !dbg !222
  %81 = ptrtoint double* %arrayidx to i64
  call void @__DiscoPoPOpenMPWrite(i64 %81)
  store double %mul24, double* %arrayidx, align 8, !dbg !223
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %for.body
  %82 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPRead(i64 %82, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.117, i32 0, i32 0), i32 4, i32 0, i32 0)
  %83 = load i32, i32* %i, align 4, !dbg !225
  %inc = add nsw i32 %83, 1, !dbg !225
  %84 = ptrtoint i32* %i to i64
  call void @__DiscoPoPOpenMPWrite(i64 %84)
  store i32 %inc, i32* %i, align 4, !dbg !225
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  ret void, !dbg !230
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !231 {
entry:
  %retval = alloca i32, align 4
  %begin = alloca double, align 8
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %i3 = alloca i32, align 4
  %d1 = alloca i32, align 4
  %e1 = alloca i32, align 4
  %e2 = alloca i32, align 4
  %e3 = alloca i32, align 4
  %xx = alloca double, align 8
  %x0 = alloca double, align 8
  %x1 = alloca double, align 8
  %a1 = alloca double, align 8
  %a2 = alloca double, align 8
  %ai = alloca double, align 8
  %x = alloca double, align 8
  %rdummy = alloca double, align 8
  %saved_stack = alloca i8*, align 8
  %a = alloca double, align 8
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  %end = alloca double, align 8
  %time_spent = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @__DiscoPoPOpenMPInitialize()
  call void @llvm.dbg.declare(metadata double* %begin, metadata !234, metadata !14), !dbg !235
  %call = call double @omp_get_wtime(), !dbg !236
  %2 = ptrtoint double* %begin to i64
  call void @__DiscoPoPOpenMPWrite(i64 %2)
  store double %call, double* %begin, align 8, !dbg !235
  call void @llvm.dbg.declare(metadata i32* %i1, metadata !237, metadata !14), !dbg !238
  call void @llvm.dbg.declare(metadata i32* %i2, metadata !239, metadata !14), !dbg !240
  call void @llvm.dbg.declare(metadata i32* %i3, metadata !241, metadata !14), !dbg !242
  call void @llvm.dbg.declare(metadata i32* %d1, metadata !243, metadata !14), !dbg !244
  call void @llvm.dbg.declare(metadata i32* %e1, metadata !245, metadata !14), !dbg !246
  call void @llvm.dbg.declare(metadata i32* %e2, metadata !247, metadata !14), !dbg !248
  call void @llvm.dbg.declare(metadata i32* %e3, metadata !249, metadata !14), !dbg !250
  call void @llvm.dbg.declare(metadata double* %xx, metadata !251, metadata !14), !dbg !252
  call void @llvm.dbg.declare(metadata double* %x0, metadata !253, metadata !14), !dbg !254
  call void @llvm.dbg.declare(metadata double* %x1, metadata !255, metadata !14), !dbg !256
  call void @llvm.dbg.declare(metadata double* %a1, metadata !257, metadata !14), !dbg !258
  call void @llvm.dbg.declare(metadata double* %a2, metadata !259, metadata !14), !dbg !260
  call void @llvm.dbg.declare(metadata double* %ai, metadata !261, metadata !14), !dbg !262
  call void @llvm.dbg.declare(metadata double* %x, metadata !263, metadata !14), !dbg !264
  %3 = ptrtoint double* %x to i64
  call void @__DiscoPoPOpenMPWrite(i64 %3)
  store double 0x41B2B9B0A1000000, double* %x, align 8, !dbg !264
  call void @llvm.dbg.declare(metadata double* %rdummy, metadata !265, metadata !14), !dbg !266
  %4 = ptrtoint double* %ai to i64
  call void @__DiscoPoPOpenMPWrite(i64 %4)
  store double 2.560000e+02, double* %ai, align 8, !dbg !267
  %5 = ptrtoint i32* %d1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %5)
  store i32 257, i32* %d1, align 4, !dbg !268
  %6 = ptrtoint i32* %e1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %6)
  store i32 257, i32* %e1, align 4, !dbg !269
  %7 = ptrtoint i32* %e2 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %7)
  store i32 257, i32* %e2, align 4, !dbg !270
  %8 = ptrtoint i32* %e3 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %8)
  store i32 257, i32* %e3, align 4, !dbg !271
  %9 = ptrtoint double* %a1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %9)
  store double 2.570000e+02, double* %a1, align 8, !dbg !272
  %10 = ptrtoint double* %a2 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %10)
  store double 2.570000e+02, double* %a2, align 8, !dbg !273
  %11 = ptrtoint i32* %e1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %11)
  store i32 257, i32* %e1, align 4, !dbg !274
  %12 = ptrtoint i32* %e2 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %12)
  store i32 10, i32* %e2, align 4, !dbg !275
  %13 = ptrtoint i32* %d1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %13)
  store i32 10, i32* %d1, align 4, !dbg !276
  %14 = ptrtoint i32* %e3 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %14)
  store i32 1000, i32* %e3, align 4, !dbg !277
  %15 = ptrtoint i32* %d1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %15, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.119, i32 0, i32 0), i32 4, i32 0, i32 0)
  %16 = load i32, i32* %d1, align 4, !dbg !278
  %17 = zext i32 %16 to i64, !dbg !279
  %18 = call i8* @llvm.stacksave(), !dbg !279
  %19 = ptrtoint i8** %saved_stack to i64
  call void @__DiscoPoPOpenMPWrite(i64 %19)
  store i8* %18, i8** %saved_stack, align 8, !dbg !279
  %vla = alloca double, i64 %17, align 16, !dbg !279
  call void @llvm.dbg.declare(metadata double* %vla, metadata !280, metadata !284), !dbg !285
  call void @llvm.dbg.declare(metadata double* %a, metadata !286, metadata !14), !dbg !287
  %20 = ptrtoint double* %a to i64
  call void @__DiscoPoPOpenMPWrite(i64 %20)
  store double 1.000000e+03, double* %a, align 8, !dbg !287
  %21 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !288
  %22 = ptrtoint i8** %21 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %22)
  store i8* getelementptr inbounds ([26 x i8], [26 x i8]* @3, i32 0, i32 0), i8** %21, align 8, !dbg !288
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([79 x i8], [79 x i8]* @.str.121, i32 0, i32 0))
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* %.kmpc_loc.addr, i32 14, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, double*, double*, double*, double*, i32*, i32*, double*, double*, i32*, i32*, double*, i64, double*, double*)* @.omp_outlined. to void (i32*, i32*, ...)*), double* %x0, double* %x, double* %rdummy, double* %ai, i32* %i3, i32* %e3, double* %x1, double* %a2, i32* %e2, i32* %d1, double* %a, i64 %17, double* %vla, double* %a1), !dbg !288
  call void @__DiscoPoPOpenMPAfterCall()
  call void @llvm.dbg.declare(metadata double* %end, metadata !289, metadata !14), !dbg !290
  %call1 = call double @omp_get_wtime(), !dbg !291
  %23 = ptrtoint double* %end to i64
  call void @__DiscoPoPOpenMPWrite(i64 %23)
  store double %call1, double* %end, align 8, !dbg !290
  call void @llvm.dbg.declare(metadata double* %time_spent, metadata !292, metadata !14), !dbg !293
  %24 = ptrtoint double* %end to i64
  call void @__DiscoPoPOpenMPRead(i64 %24, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.123, i32 0, i32 0), i32 8, i32 0, i32 0)
  %25 = load double, double* %end, align 8, !dbg !294
  %26 = ptrtoint double* %begin to i64
  call void @__DiscoPoPOpenMPRead(i64 %26, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.125, i32 0, i32 0), i32 8, i32 0, i32 0)
  %27 = load double, double* %begin, align 8, !dbg !295
  %sub = fsub double %25, %27, !dbg !296
  %28 = ptrtoint double* %time_spent to i64
  call void @__DiscoPoPOpenMPWrite(i64 %28)
  store double %sub, double* %time_spent, align 8, !dbg !293
  %29 = ptrtoint double* %time_spent to i64
  call void @__DiscoPoPOpenMPRead(i64 %29, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.127, i32 0, i32 0), i32 8, i32 0, i32 0)
  %30 = load double, double* %time_spent, align 8, !dbg !297
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i32 0, i32 0), double %30), !dbg !298
  store i32 0, i32* %retval, align 4, !dbg !299
  %31 = ptrtoint i8** %saved_stack to i64
  call void @__DiscoPoPOpenMPRead(i64 %31, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.129, i32 0, i32 0), i32 8, i32 0, i32 0)
  %32 = load i8*, i8** %saved_stack, align 8, !dbg !300
  call void @llvm.stackrestore(i8* %32), !dbg !300
  %33 = ptrtoint i32* %retval to i64
  call void @__DiscoPoPOpenMPRead(i64 %33, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.131, i32 0, i32 0), i32 4, i32 0, i32 0)
  %34 = load i32, i32* %retval, align 4, !dbg !300
  call void @__DiscoPoPOpenMPFinalize()
  ret i32 %34, !dbg !300
}

declare double @omp_get_wtime() #2

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: nounwind uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., double* dereferenceable(8) %x0, double* dereferenceable(8) %x, double* dereferenceable(8) %rdummy, double* dereferenceable(8) %ai, i32* dereferenceable(4) %i3, i32* dereferenceable(4) %e3, double* dereferenceable(8) %x1, double* dereferenceable(8) %a2, i32* dereferenceable(4) %e2, i32* dereferenceable(4) %d1, double* dereferenceable(8) %a, i64 %vla, double* %z, double* dereferenceable(8) %a1) #0 !dbg !301 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %x0.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %rdummy.addr = alloca double*, align 8
  %ai.addr = alloca double*, align 8
  %i3.addr = alloca i32*, align 8
  %e3.addr = alloca i32*, align 8
  %x1.addr = alloca double*, align 8
  %a2.addr = alloca double*, align 8
  %e2.addr = alloca i32*, align 8
  %d1.addr = alloca i32*, align 8
  %a.addr = alloca double*, align 8
  %vla.addr = alloca i64, align 8
  %z.addr = alloca double*, align 8
  %a1.addr = alloca double*, align 8
  %.kmpc_loc.addr = alloca %ident_t, align 8
  %0 = bitcast %ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false)
  %agg.captured = alloca %struct.anon, align 8
  %2 = ptrtoint i32** %.global_tid..addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %2)
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !311, metadata !14), !dbg !312
  %3 = ptrtoint i32** %.bound_tid..addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %3)
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !313, metadata !14), !dbg !312
  %4 = ptrtoint double** %x0.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %4)
  store double* %x0, double** %x0.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x0.addr, metadata !314, metadata !14), !dbg !312
  %5 = ptrtoint double** %x.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %5)
  store double* %x, double** %x.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x.addr, metadata !315, metadata !14), !dbg !312
  %6 = ptrtoint double** %rdummy.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %6)
  store double* %rdummy, double** %rdummy.addr, align 8
  call void @llvm.dbg.declare(metadata double** %rdummy.addr, metadata !316, metadata !14), !dbg !312
  %7 = ptrtoint double** %ai.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %7)
  store double* %ai, double** %ai.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ai.addr, metadata !317, metadata !14), !dbg !312
  %8 = ptrtoint i32** %i3.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %8)
  store i32* %i3, i32** %i3.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i3.addr, metadata !318, metadata !14), !dbg !312
  %9 = ptrtoint i32** %e3.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %9)
  store i32* %e3, i32** %e3.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %e3.addr, metadata !319, metadata !14), !dbg !312
  %10 = ptrtoint double** %x1.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %10)
  store double* %x1, double** %x1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %x1.addr, metadata !320, metadata !14), !dbg !312
  %11 = ptrtoint double** %a2.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %11)
  store double* %a2, double** %a2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %a2.addr, metadata !321, metadata !14), !dbg !312
  %12 = ptrtoint i32** %e2.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %12)
  store i32* %e2, i32** %e2.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %e2.addr, metadata !322, metadata !14), !dbg !312
  %13 = ptrtoint i32** %d1.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %13)
  store i32* %d1, i32** %d1.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %d1.addr, metadata !323, metadata !14), !dbg !312
  %14 = ptrtoint double** %a.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %14)
  store double* %a, double** %a.addr, align 8
  call void @llvm.dbg.declare(metadata double** %a.addr, metadata !324, metadata !14), !dbg !312
  %15 = ptrtoint i64* %vla.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %15)
  store i64 %vla, i64* %vla.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %vla.addr, metadata !325, metadata !14), !dbg !312
  %16 = ptrtoint double** %z.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %16)
  store double* %z, double** %z.addr, align 8
  call void @llvm.dbg.declare(metadata double** %z.addr, metadata !326, metadata !14), !dbg !312
  %17 = ptrtoint double** %a1.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %17)
  store double* %a1, double** %a1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %a1.addr, metadata !327, metadata !14), !dbg !312
  %18 = ptrtoint double** %x0.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %18, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.133, i32 0, i32 0), i32 8, i32 0, i32 0)
  %19 = load double*, double** %x0.addr, align 8, !dbg !328
  %20 = ptrtoint double** %x.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %20, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.135, i32 0, i32 0), i32 8, i32 0, i32 0)
  %21 = load double*, double** %x.addr, align 8, !dbg !328
  %22 = ptrtoint double** %rdummy.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %22, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.137, i32 0, i32 0), i32 8, i32 0, i32 0)
  %23 = load double*, double** %rdummy.addr, align 8, !dbg !328
  %24 = ptrtoint double** %ai.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %24, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.139, i32 0, i32 0), i32 8, i32 0, i32 0)
  %25 = load double*, double** %ai.addr, align 8, !dbg !328
  %26 = ptrtoint i32** %i3.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %26, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.141, i32 0, i32 0), i32 8, i32 0, i32 0)
  %27 = load i32*, i32** %i3.addr, align 8, !dbg !328
  %28 = ptrtoint i32** %e3.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %28, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.143, i32 0, i32 0), i32 8, i32 0, i32 0)
  %29 = load i32*, i32** %e3.addr, align 8, !dbg !328
  %30 = ptrtoint double** %x1.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %30, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.145, i32 0, i32 0), i32 8, i32 0, i32 0)
  %31 = load double*, double** %x1.addr, align 8, !dbg !328
  %32 = ptrtoint double** %a2.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %32, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.147, i32 0, i32 0), i32 8, i32 0, i32 0)
  %33 = load double*, double** %a2.addr, align 8, !dbg !328
  %34 = ptrtoint i32** %e2.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %34, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.149, i32 0, i32 0), i32 8, i32 0, i32 0)
  %35 = load i32*, i32** %e2.addr, align 8, !dbg !328
  %36 = ptrtoint i32** %d1.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %36, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.151, i32 0, i32 0), i32 8, i32 0, i32 0)
  %37 = load i32*, i32** %d1.addr, align 8, !dbg !328
  %38 = ptrtoint double** %a.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %38, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.153, i32 0, i32 0), i32 8, i32 0, i32 0)
  %39 = load double*, double** %a.addr, align 8, !dbg !328
  %40 = ptrtoint i64* %vla.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %40, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.155, i32 0, i32 0), i32 8, i32 0, i32 0)
  %41 = load i64, i64* %vla.addr, align 8, !dbg !328
  %42 = ptrtoint double** %z.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %42, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.157, i32 0, i32 0), i32 8, i32 0, i32 0)
  %43 = load double*, double** %z.addr, align 8, !dbg !328
  %44 = ptrtoint double** %a1.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %44, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.159, i32 0, i32 0), i32 8, i32 0, i32 0)
  %45 = load double*, double** %a1.addr, align 8, !dbg !328
  %46 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !329
  %47 = ptrtoint i8** %46 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %47)
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %46, align 8, !dbg !329
  %48 = ptrtoint i32** %.global_tid..addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %48, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.161, i32 0, i32 0), i32 8, i32 0, i32 0)
  %49 = load i32*, i32** %.global_tid..addr, align 8, !dbg !329
  %50 = ptrtoint i32* %49 to i64
  call void @__DiscoPoPOpenMPRead(i64 %50, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.163, i32 0, i32 0), i32 4, i32 0, i32 0)
  %51 = load i32, i32* %49, align 4, !dbg !329
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.165, i32 0, i32 0))
  %52 = call i32 @__kmpc_single(%ident_t* %.kmpc_loc.addr, i32 %51), !dbg !329
  call void @__DiscoPoPOpenMPAfterCall()
  %53 = icmp ne i32 %52, 0, !dbg !329
  br i1 %53, label %omp_if.then, label %omp_if.end, !dbg !329

omp_if.then:                                      ; preds = %entry
  %54 = ptrtoint double* %19 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %54)
  store double 0x41B2B9B0A1000000, double* %19, align 8, !dbg !331
  %55 = ptrtoint double* %25 to i64
  call void @__DiscoPoPOpenMPRead(i64 %55, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.167, i32 0, i32 0), i32 8, i32 0, i32 0)
  %56 = load double, double* %25, align 8, !dbg !334
  %call = call double @randlc(double* %19, double %56), !dbg !335
  %57 = ptrtoint double* %23 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %57)
  store double %call, double* %23, align 8, !dbg !336
  %58 = ptrtoint i32* %27 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %58)
  store i32 1, i32* %27, align 4, !dbg !337
  br label %for.cond, !dbg !339

for.cond:                                         ; preds = %for.inc, %omp_if.then
  %59 = ptrtoint i32* %27 to i64
  call void @__DiscoPoPOpenMPRead(i64 %59, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.169, i32 0, i32 0), i32 4, i32 0, i32 0)
  %60 = load i32, i32* %27, align 4, !dbg !340
  %61 = ptrtoint i32* %29 to i64
  call void @__DiscoPoPOpenMPRead(i64 %61, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.171, i32 0, i32 0), i32 4, i32 0, i32 0)
  %62 = load i32, i32* %29, align 4, !dbg !343
  %cmp = icmp slt i32 %60, %62, !dbg !344
  br i1 %cmp, label %for.body, label %for.end, !dbg !345

for.body:                                         ; preds = %for.cond
  %63 = ptrtoint double* %19 to i64
  call void @__DiscoPoPOpenMPRead(i64 %63, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.173, i32 0, i32 0), i32 8, i32 0, i32 0)
  %64 = load double, double* %19, align 8, !dbg !346
  %65 = ptrtoint double* %31 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %65)
  store double %64, double* %31, align 8, !dbg !348
  %66 = ptrtoint double* %33 to i64
  call void @__DiscoPoPOpenMPRead(i64 %66, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.175, i32 0, i32 0), i32 8, i32 0, i32 0)
  %67 = load double, double* %33, align 8, !dbg !349
  %call1 = call double @randlc(double* %19, double %67), !dbg !350
  %68 = ptrtoint double* %23 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %68)
  store double %call1, double* %23, align 8, !dbg !351
  %69 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 0, !dbg !352
  %70 = ptrtoint i32** %69 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %70)
  store i32* %35, i32** %69, align 8, !dbg !352
  %71 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 1, !dbg !352
  %72 = ptrtoint double* %31 to i64
  call void @__DiscoPoPOpenMPRead(i64 %72, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.177, i32 0, i32 0), i32 8, i32 0, i32 0)
  %73 = load double, double* %31, align 8, !dbg !353
  %74 = ptrtoint double* %71 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %74)
  store double %73, double* %71, align 8, !dbg !352
  %75 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 2, !dbg !352
  %76 = ptrtoint i32** %75 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %76)
  store i32* %37, i32** %75, align 8, !dbg !352
  %77 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 3, !dbg !352
  %78 = ptrtoint double** %77 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %78)
  store double* %39, double** %77, align 8, !dbg !352
  %79 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 4, !dbg !352
  %80 = ptrtoint i64* %79 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %80)
  store i64 %41, i64* %79, align 8, !dbg !352
  %81 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 5, !dbg !352
  %82 = ptrtoint double** %81 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %82)
  store double* %43, double** %81, align 8, !dbg !352
  %83 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 6, !dbg !352
  %84 = ptrtoint double** %83 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %84)
  store double* %23, double** %83, align 8, !dbg !352
  %85 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 7, !dbg !352
  %86 = ptrtoint double** %85 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %86)
  store double* %45, double** %85, align 8, !dbg !352
  %87 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 8, !dbg !352
  %88 = ptrtoint i32* %27 to i64
  call void @__DiscoPoPOpenMPRead(i64 %88, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.179, i32 0, i32 0), i32 4, i32 0, i32 0)
  %89 = load i32, i32* %27, align 4, !dbg !354
  %90 = ptrtoint i32* %87 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %90)
  store i32 %89, i32* %87, align 8, !dbg !352
  %91 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !352
  %92 = ptrtoint i8** %91 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %92)
  store i8* getelementptr inbounds ([28 x i8], [28 x i8]* @2, i32 0, i32 0), i8** %91, align 8, !dbg !352
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.181, i32 0, i32 0))
  %93 = call i8* @__kmpc_omp_task_alloc(%ident_t* %.kmpc_loc.addr, i32 %51, i32 1, i64 64, i64 72, i32 (i32, i8*)* bitcast (i32 (i32, %struct.kmp_task_t_with_privates*)* @.omp_task_entry. to i32 (i32, i8*)*)), !dbg !352
  call void @__DiscoPoPOpenMPAfterCall()
  %94 = bitcast i8* %93 to %struct.kmp_task_t_with_privates*, !dbg !352
  %95 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %94, i32 0, i32 0, !dbg !352
  %96 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %95, i32 0, i32 0, !dbg !352
  %97 = ptrtoint i8** %96 to i64
  call void @__DiscoPoPOpenMPRead(i64 %97, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.183, i32 0, i32 0), i32 8, i32 0, i32 0)
  %98 = load i8*, i8** %96, align 8, !dbg !352
  %99 = bitcast %struct.anon* %agg.captured to i8*, !dbg !352
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %98, i8* %99, i64 72, i32 8, i1 false), !dbg !355
  %100 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %94, i32 0, i32 1, !dbg !352
  %101 = bitcast i8* %98 to %struct.anon*, !dbg !352
  %102 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %100, i32 0, i32 1, !dbg !352
  %103 = getelementptr inbounds %struct.anon, %struct.anon* %101, i32 0, i32 1, !dbg !352
  %104 = ptrtoint double* %103 to i64
  call void @__DiscoPoPOpenMPRead(i64 %104, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.185, i32 0, i32 0), i32 8, i32 0, i32 0)
  %105 = load double, double* %103, align 8, !dbg !357
  %106 = ptrtoint double* %102 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %106)
  store double %105, double* %102, align 8, !dbg !352
  %107 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %100, i32 0, i32 3, !dbg !352
  %108 = getelementptr inbounds %struct.anon, %struct.anon* %101, i32 0, i32 8, !dbg !352
  %109 = ptrtoint i32* %108 to i64
  call void @__DiscoPoPOpenMPRead(i64 %109, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.187, i32 0, i32 0), i32 4, i32 0, i32 0)
  %110 = load i32, i32* %108, align 4, !dbg !359
  %111 = ptrtoint i32* %107 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %111)
  store i32 %110, i32* %107, align 4, !dbg !352
  %112 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !352
  %113 = ptrtoint i8** %112 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %113)
  store i8* getelementptr inbounds ([28 x i8], [28 x i8]* @2, i32 0, i32 0), i8** %112, align 8, !dbg !352
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([79 x i8], [79 x i8]* @.str.189, i32 0, i32 0))
  %114 = call i32 @__kmpc_omp_task(%ident_t* %.kmpc_loc.addr, i32 %51, i8* %93), !dbg !360
  call void @__DiscoPoPOpenMPAfterCall()
  br label %for.inc, !dbg !362

for.inc:                                          ; preds = %for.body
  %115 = ptrtoint i32* %27 to i64
  call void @__DiscoPoPOpenMPRead(i64 %115, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.191, i32 0, i32 0), i32 4, i32 0, i32 0)
  %116 = load i32, i32* %27, align 4, !dbg !363
  %inc = add nsw i32 %116, 1, !dbg !363
  %117 = ptrtoint i32* %27 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %117)
  store i32 %inc, i32* %27, align 4, !dbg !363
  br label %for.cond, !dbg !365, !llvm.loop !366

for.end:                                          ; preds = %for.cond
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.193, i32 0, i32 0))
  call void @__kmpc_end_single(%ident_t* %.kmpc_loc.addr, i32 %51), !dbg !368
  call void @__DiscoPoPOpenMPAfterCall()
  br label %omp_if.end, !dbg !368

omp_if.end:                                       ; preds = %for.end, %entry
  %118 = getelementptr inbounds %ident_t, %ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !369
  %119 = ptrtoint i8** %118 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %119)
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @1, i32 0, i32 0), i8** %118, align 8, !dbg !369
  call void @__DiscoPoPOpenMPBeforeCall(i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.195, i32 0, i32 0))
  call void @__kmpc_barrier(%ident_t* %.kmpc_loc.addr, i32 %51), !dbg !369
  call void @__DiscoPoPOpenMPAfterCall()
  ret void, !dbg !371
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

declare void @__kmpc_end_single(%ident_t*, i32)

declare i32 @__kmpc_single(%ident_t*, i32)

; Function Attrs: alwaysinline nounwind uwtable
define internal void @.omp_task_privates_map.(%struct..kmp_privates.t* noalias, double** noalias, i32** noalias, double** noalias, i32** noalias) #5 {
entry:
  %.addr = alloca %struct..kmp_privates.t*, align 8
  %.addr1 = alloca double**, align 8
  %.addr2 = alloca i32**, align 8
  %.addr3 = alloca double**, align 8
  %.addr4 = alloca i32**, align 8
  %5 = ptrtoint %struct..kmp_privates.t** %.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %5)
  store %struct..kmp_privates.t* %0, %struct..kmp_privates.t** %.addr, align 8
  %6 = ptrtoint double*** %.addr1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %6)
  store double** %1, double*** %.addr1, align 8
  %7 = ptrtoint i32*** %.addr2 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %7)
  store i32** %2, i32*** %.addr2, align 8
  %8 = ptrtoint double*** %.addr3 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %8)
  store double** %3, double*** %.addr3, align 8
  %9 = ptrtoint i32*** %.addr4 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %9)
  store i32** %4, i32*** %.addr4, align 8
  %10 = ptrtoint %struct..kmp_privates.t** %.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %10, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.196, i32 0, i32 0), i32 8, i32 0, i32 0)
  %11 = load %struct..kmp_privates.t*, %struct..kmp_privates.t** %.addr, align 8
  %12 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %11, i32 0, i32 0
  %13 = ptrtoint double*** %.addr1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %13, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.197, i32 0, i32 0), i32 8, i32 0, i32 0)
  %14 = load double**, double*** %.addr1, align 8
  %15 = ptrtoint double** %14 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %15)
  store double* %12, double** %14, align 8
  %16 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %11, i32 0, i32 1
  %17 = ptrtoint double*** %.addr3 to i64
  call void @__DiscoPoPOpenMPRead(i64 %17, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.198, i32 0, i32 0), i32 8, i32 0, i32 0)
  %18 = load double**, double*** %.addr3, align 8
  %19 = ptrtoint double** %18 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %19)
  store double* %16, double** %18, align 8
  %20 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %11, i32 0, i32 2
  %21 = ptrtoint i32*** %.addr2 to i64
  call void @__DiscoPoPOpenMPRead(i64 %21, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.199, i32 0, i32 0), i32 8, i32 0, i32 0)
  %22 = load i32**, i32*** %.addr2, align 8
  %23 = ptrtoint i32** %22 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %23)
  store i32* %20, i32** %22, align 8
  %24 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %11, i32 0, i32 3
  %25 = ptrtoint i32*** %.addr4 to i64
  call void @__DiscoPoPOpenMPRead(i64 %25, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.200, i32 0, i32 0), i32 8, i32 0, i32 0)
  %26 = load i32**, i32*** %.addr4, align 8
  %27 = ptrtoint i32** %26 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %27)
  store i32* %24, i32** %26, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @.omp_task_entry.(i32, %struct.kmp_task_t_with_privates* noalias) #0 {
entry:
  %.global_tid..addr.i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %.global_tid..addr.i, metadata !372, metadata !14), !dbg !386
  %.part_id..addr.i = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %.part_id..addr.i, metadata !387, metadata !14), !dbg !386
  %.privates..addr.i = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %.privates..addr.i, metadata !388, metadata !14), !dbg !386
  %.copy_fn..addr.i = alloca void (i8*, ...)*, align 8
  call void @llvm.dbg.declare(metadata void (i8*, ...)** %.copy_fn..addr.i, metadata !389, metadata !14), !dbg !386
  %.task_t..addr.i = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %.task_t..addr.i, metadata !390, metadata !14), !dbg !386
  %__context.addr.i = alloca %struct.anon*, align 8
  call void @llvm.dbg.declare(metadata %struct.anon** %__context.addr.i, metadata !391, metadata !14), !dbg !386
  %.priv.ptr.addr.i = alloca double*, align 8
  %.priv.ptr.addr1.i = alloca i32*, align 8
  %.firstpriv.ptr.addr.i = alloca double*, align 8
  %.firstpriv.ptr.addr2.i = alloca i32*, align 8
  %.addr = alloca i32, align 4
  %.addr1 = alloca %struct.kmp_task_t_with_privates*, align 8
  %2 = ptrtoint i32* %.addr to i64
  call void @__DiscoPoPOpenMPWrite(i64 %2)
  store i32 %0, i32* %.addr, align 4
  %3 = ptrtoint %struct.kmp_task_t_with_privates** %.addr1 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %3)
  store %struct.kmp_task_t_with_privates* %1, %struct.kmp_task_t_with_privates** %.addr1, align 8
  %4 = ptrtoint i32* %.addr to i64
  call void @__DiscoPoPOpenMPRead(i64 %4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.201, i32 0, i32 0), i32 4, i32 0, i32 0)
  %5 = load i32, i32* %.addr, align 4
  %6 = ptrtoint %struct.kmp_task_t_with_privates** %.addr1 to i64
  call void @__DiscoPoPOpenMPRead(i64 %6, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.202, i32 0, i32 0), i32 8, i32 0, i32 0)
  %7 = load %struct.kmp_task_t_with_privates*, %struct.kmp_task_t_with_privates** %.addr1, align 8
  %8 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %7, i32 0, i32 0
  %9 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %8, i32 0, i32 2
  %10 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %8, i32 0, i32 0
  %11 = ptrtoint i8** %10 to i64
  call void @__DiscoPoPOpenMPRead(i64 %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.203, i32 0, i32 0), i32 8, i32 0, i32 0)
  %12 = load i8*, i8** %10, align 8
  %13 = bitcast i8* %12 to %struct.anon*
  %14 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %7, i32 0, i32 1
  %15 = bitcast %struct..kmp_privates.t* %14 to i8*
  %16 = bitcast %struct.kmp_task_t_with_privates* %7 to i8*
  %17 = ptrtoint i32* %.global_tid..addr.i to i64
  call void @__DiscoPoPOpenMPWrite(i64 %17)
  store i32 %5, i32* %.global_tid..addr.i, align 4
  %18 = ptrtoint i32** %.part_id..addr.i to i64
  call void @__DiscoPoPOpenMPWrite(i64 %18)
  store i32* %9, i32** %.part_id..addr.i, align 8
  %19 = ptrtoint i8** %.privates..addr.i to i64
  call void @__DiscoPoPOpenMPWrite(i64 %19)
  store i8* %15, i8** %.privates..addr.i, align 8
  %20 = ptrtoint void (i8*, ...)** %.copy_fn..addr.i to i64
  call void @__DiscoPoPOpenMPWrite(i64 %20)
  store void (i8*, ...)* bitcast (void (%struct..kmp_privates.t*, double**, i32**, double**, i32**)* @.omp_task_privates_map. to void (i8*, ...)*), void (i8*, ...)** %.copy_fn..addr.i, align 8
  %21 = ptrtoint i8** %.task_t..addr.i to i64
  call void @__DiscoPoPOpenMPWrite(i64 %21)
  store i8* %16, i8** %.task_t..addr.i, align 8
  %22 = ptrtoint %struct.anon** %__context.addr.i to i64
  call void @__DiscoPoPOpenMPWrite(i64 %22)
  store %struct.anon* %13, %struct.anon** %__context.addr.i, align 8
  %23 = ptrtoint %struct.anon** %__context.addr.i to i64
  call void @__DiscoPoPOpenMPRead(i64 %23, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.205, i32 0, i32 0), i32 8, i32 0, i32 0)
  %24 = load %struct.anon*, %struct.anon** %__context.addr.i, align 8, !dbg !392
  %25 = getelementptr inbounds %struct.anon, %struct.anon* %24, i32 0, i32 4, !dbg !392
  %26 = ptrtoint i64* %25 to i64
  call void @__DiscoPoPOpenMPRead(i64 %26, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.207, i32 0, i32 0), i32 8, i32 0, i32 0)
  %27 = load i64, i64* %25, align 8, !dbg !392
  %28 = ptrtoint void (i8*, ...)** %.copy_fn..addr.i to i64
  call void @__DiscoPoPOpenMPRead(i64 %28, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.209, i32 0, i32 0), i32 8, i32 0, i32 0)
  %29 = load void (i8*, ...)*, void (i8*, ...)** %.copy_fn..addr.i, align 8, !dbg !392
  %30 = ptrtoint i8** %.privates..addr.i to i64
  call void @__DiscoPoPOpenMPRead(i64 %30, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.211, i32 0, i32 0), i32 8, i32 0, i32 0)
  %31 = load i8*, i8** %.privates..addr.i, align 8, !dbg !392
  call void (i8*, ...) %29(i8* %31, double** %.priv.ptr.addr.i, i32** %.priv.ptr.addr1.i, double** %.firstpriv.ptr.addr.i, i32** %.firstpriv.ptr.addr2.i) #3, !dbg !392
  %32 = ptrtoint double** %.priv.ptr.addr.i to i64
  call void @__DiscoPoPOpenMPRead(i64 %32, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.213, i32 0, i32 0), i32 8, i32 0, i32 0)
  %33 = load double*, double** %.priv.ptr.addr.i, align 8, !dbg !392
  %34 = ptrtoint i32** %.priv.ptr.addr1.i to i64
  call void @__DiscoPoPOpenMPRead(i64 %34, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.215, i32 0, i32 0), i32 8, i32 0, i32 0)
  %35 = load i32*, i32** %.priv.ptr.addr1.i, align 8, !dbg !392
  %36 = ptrtoint double** %.firstpriv.ptr.addr.i to i64
  call void @__DiscoPoPOpenMPRead(i64 %36, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.217, i32 0, i32 0), i32 8, i32 0, i32 0)
  %37 = load double*, double** %.firstpriv.ptr.addr.i, align 8, !dbg !392
  %38 = ptrtoint i32** %.firstpriv.ptr.addr2.i to i64
  call void @__DiscoPoPOpenMPRead(i64 %38, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.219, i32 0, i32 0), i32 8, i32 0, i32 0)
  %39 = load i32*, i32** %.firstpriv.ptr.addr2.i, align 8, !dbg !392
  %40 = ptrtoint i32* %35 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %40)
  store i32 1, i32* %35, align 4, !dbg !393
  br label %for.cond.i, !dbg !395

for.cond.i:                                       ; preds = %for.body.i, %entry
  %41 = ptrtoint i32* %35 to i64
  call void @__DiscoPoPOpenMPRead(i64 %41, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.221, i32 0, i32 0), i32 4, i32 0, i32 0)
  %42 = load i32, i32* %35, align 4, !dbg !396
  %43 = getelementptr inbounds %struct.anon, %struct.anon* %24, i32 0, i32 0, !dbg !399
  %44 = ptrtoint i32** %43 to i64
  call void @__DiscoPoPOpenMPRead(i64 %44, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.223, i32 0, i32 0), i32 8, i32 0, i32 0)
  %ref.i = load i32*, i32** %43, align 8, !dbg !399
  %45 = ptrtoint i32* %ref.i to i64
  call void @__DiscoPoPOpenMPRead(i64 %45, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.225, i32 0, i32 0), i32 4, i32 0, i32 0)
  %46 = load i32, i32* %ref.i, align 4, !dbg !399
  %cmp.i = icmp slt i32 %42, %46, !dbg !400
  br i1 %cmp.i, label %for.body.i, label %.omp_outlined..1.exit, !dbg !401

for.body.i:                                       ; preds = %for.cond.i
  %47 = ptrtoint double* %37 to i64
  call void @__DiscoPoPOpenMPRead(i64 %47, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.227, i32 0, i32 0), i32 8, i32 0, i32 0)
  %48 = load double, double* %37, align 8, !dbg !402
  %49 = ptrtoint double* %33 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %49)
  store double %48, double* %33, align 8, !dbg !404
  %50 = getelementptr inbounds %struct.anon, %struct.anon* %24, i32 0, i32 2, !dbg !405
  %51 = ptrtoint i32** %50 to i64
  call void @__DiscoPoPOpenMPRead(i64 %51, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.229, i32 0, i32 0), i32 8, i32 0, i32 0)
  %ref3.i = load i32*, i32** %50, align 8, !dbg !405
  %52 = ptrtoint i32* %ref3.i to i64
  call void @__DiscoPoPOpenMPRead(i64 %52, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.231, i32 0, i32 0), i32 4, i32 0, i32 0)
  %53 = load i32, i32* %ref3.i, align 4, !dbg !405
  %54 = getelementptr inbounds %struct.anon, %struct.anon* %24, i32 0, i32 5, !dbg !406
  %55 = ptrtoint double** %54 to i64
  call void @__DiscoPoPOpenMPRead(i64 %55, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.233, i32 0, i32 0), i32 8, i32 0, i32 0)
  %ref4.i = load double*, double** %54, align 8, !dbg !406
  call void @vranlc(i32 %53, double* %33, double 1.000000e+03, double* %ref4.i) #3, !dbg !407
  %56 = getelementptr inbounds %struct.anon, %struct.anon* %24, i32 0, i32 7, !dbg !408
  %57 = ptrtoint double** %56 to i64
  call void @__DiscoPoPOpenMPRead(i64 %57, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.235, i32 0, i32 0), i32 8, i32 0, i32 0)
  %ref5.i = load double*, double** %56, align 8, !dbg !408
  %58 = ptrtoint double* %ref5.i to i64
  call void @__DiscoPoPOpenMPRead(i64 %58, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.237, i32 0, i32 0), i32 8, i32 0, i32 0)
  %59 = load double, double* %ref5.i, align 8, !dbg !408
  %call.i = call double @randlc(double* %37, double %59) #3, !dbg !409
  %60 = getelementptr inbounds %struct.anon, %struct.anon* %24, i32 0, i32 6, !dbg !410
  %61 = ptrtoint double** %60 to i64
  call void @__DiscoPoPOpenMPRead(i64 %61, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.239, i32 0, i32 0), i32 8, i32 0, i32 0)
  %ref6.i = load double*, double** %60, align 8, !dbg !410
  %62 = ptrtoint double* %ref6.i to i64
  call void @__DiscoPoPOpenMPWrite(i64 %62)
  store double %call.i, double* %ref6.i, align 8, !dbg !411
  %63 = ptrtoint i32* %35 to i64
  call void @__DiscoPoPOpenMPRead(i64 %63, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.241, i32 0, i32 0), i32 4, i32 0, i32 0)
  %64 = load i32, i32* %35, align 4, !dbg !412
  %inc.i = add nsw i32 %64, 1, !dbg !412
  %65 = ptrtoint i32* %35 to i64
  call void @__DiscoPoPOpenMPWrite(i64 %65)
  store i32 %inc.i, i32* %35, align 4, !dbg !412
  br label %for.cond.i, !dbg !414, !llvm.loop !415

.omp_outlined..1.exit:                            ; preds = %for.cond.i
  ret i32 0
}

declare i8* @__kmpc_omp_task_alloc(%ident_t*, i32, i32, i64, i64, i32 (i32, i8*)*)

declare i32 @__kmpc_omp_task(%ident_t*, i32, i8*)

declare void @__kmpc_barrier(%ident_t*, i32)

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

declare void @__DiscoPoPOpenMPInitialize()

declare void @__CollectThreadInfo()

declare void @__DiscoPoPOpenMPFinalize()

declare void @__DiscoPoPOpenMPRead(i64, i8*, i32, i32, i32)

declare void @__DiscoPoPOpenMPWrite(i64)

declare void @__DiscoPoPOpenMPBeforeCall(i8*)

declare void @__DiscoPoPOpenMPAfterCall()

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { alwaysinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.1 (tags/RELEASE_391/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "sourcefile.c", directory: "/home/amiryousefi/MasterThesis/Codes")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"clang version 3.9.1 (tags/RELEASE_391/final)"}
!9 = distinct !DISubprogram(name: "randlc", scope: !1, file: !1, line: 4, type: !10, isLocal: false, isDefinition: true, scopeLine: 5, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!5, !12, !5}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!13 = !DILocalVariable(name: "x", arg: 1, scope: !9, file: !1, line: 4, type: !12)
!14 = !DIExpression()
!15 = !DILocation(line: 4, column: 24, scope: !9)
!16 = !DILocalVariable(name: "a", arg: 2, scope: !9, file: !1, line: 4, type: !5)
!17 = !DILocation(line: 4, column: 34, scope: !9)
!18 = !DILocalVariable(name: "r23", scope: !9, file: !1, line: 7, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!20 = !DILocation(line: 7, column: 16, scope: !9)
!21 = !DILocalVariable(name: "r46", scope: !9, file: !1, line: 8, type: !19)
!22 = !DILocation(line: 8, column: 16, scope: !9)
!23 = !DILocalVariable(name: "t23", scope: !9, file: !1, line: 9, type: !19)
!24 = !DILocation(line: 9, column: 16, scope: !9)
!25 = !DILocalVariable(name: "t46", scope: !9, file: !1, line: 10, type: !19)
!26 = !DILocation(line: 10, column: 16, scope: !9)
!27 = !DILocalVariable(name: "t1", scope: !9, file: !1, line: 12, type: !5)
!28 = !DILocation(line: 12, column: 10, scope: !9)
!29 = !DILocalVariable(name: "t2", scope: !9, file: !1, line: 12, type: !5)
!30 = !DILocation(line: 12, column: 14, scope: !9)
!31 = !DILocalVariable(name: "t3", scope: !9, file: !1, line: 12, type: !5)
!32 = !DILocation(line: 12, column: 18, scope: !9)
!33 = !DILocalVariable(name: "t4", scope: !9, file: !1, line: 12, type: !5)
!34 = !DILocation(line: 12, column: 22, scope: !9)
!35 = !DILocalVariable(name: "a1", scope: !9, file: !1, line: 12, type: !5)
!36 = !DILocation(line: 12, column: 26, scope: !9)
!37 = !DILocalVariable(name: "a2", scope: !9, file: !1, line: 12, type: !5)
!38 = !DILocation(line: 12, column: 30, scope: !9)
!39 = !DILocalVariable(name: "x1", scope: !9, file: !1, line: 12, type: !5)
!40 = !DILocation(line: 12, column: 34, scope: !9)
!41 = !DILocalVariable(name: "x2", scope: !9, file: !1, line: 12, type: !5)
!42 = !DILocation(line: 12, column: 38, scope: !9)
!43 = !DILocalVariable(name: "z", scope: !9, file: !1, line: 12, type: !5)
!44 = !DILocation(line: 12, column: 42, scope: !9)
!45 = !DILocalVariable(name: "r", scope: !9, file: !1, line: 13, type: !5)
!46 = !DILocation(line: 13, column: 10, scope: !9)
!47 = !DILocation(line: 15, column: 14, scope: !9)
!48 = !DILocation(line: 15, column: 12, scope: !9)
!49 = !DILocation(line: 15, column: 6, scope: !9)
!50 = !DILocation(line: 16, column: 14, scope: !9)
!51 = !DILocation(line: 16, column: 8, scope: !9)
!52 = !DILocation(line: 16, column: 6, scope: !9)
!53 = !DILocation(line: 17, column: 8, scope: !9)
!54 = !DILocation(line: 17, column: 18, scope: !9)
!55 = !DILocation(line: 17, column: 16, scope: !9)
!56 = !DILocation(line: 17, column: 10, scope: !9)
!57 = !DILocation(line: 17, column: 6, scope: !9)
!58 = !DILocation(line: 19, column: 16, scope: !9)
!59 = !DILocation(line: 19, column: 15, scope: !9)
!60 = !DILocation(line: 19, column: 12, scope: !9)
!61 = !DILocation(line: 19, column: 6, scope: !9)
!62 = !DILocation(line: 20, column: 14, scope: !9)
!63 = !DILocation(line: 20, column: 8, scope: !9)
!64 = !DILocation(line: 20, column: 6, scope: !9)
!65 = !DILocation(line: 21, column: 9, scope: !9)
!66 = !DILocation(line: 21, column: 8, scope: !9)
!67 = !DILocation(line: 21, column: 19, scope: !9)
!68 = !DILocation(line: 21, column: 17, scope: !9)
!69 = !DILocation(line: 21, column: 11, scope: !9)
!70 = !DILocation(line: 21, column: 6, scope: !9)
!71 = !DILocation(line: 22, column: 8, scope: !9)
!72 = !DILocation(line: 22, column: 13, scope: !9)
!73 = !DILocation(line: 22, column: 11, scope: !9)
!74 = !DILocation(line: 22, column: 18, scope: !9)
!75 = !DILocation(line: 22, column: 23, scope: !9)
!76 = !DILocation(line: 22, column: 21, scope: !9)
!77 = !DILocation(line: 22, column: 16, scope: !9)
!78 = !DILocation(line: 22, column: 6, scope: !9)
!79 = !DILocation(line: 23, column: 21, scope: !9)
!80 = !DILocation(line: 23, column: 19, scope: !9)
!81 = !DILocation(line: 23, column: 8, scope: !9)
!82 = !DILocation(line: 23, column: 6, scope: !9)
!83 = !DILocation(line: 24, column: 7, scope: !9)
!84 = !DILocation(line: 24, column: 18, scope: !9)
!85 = !DILocation(line: 24, column: 16, scope: !9)
!86 = !DILocation(line: 24, column: 10, scope: !9)
!87 = !DILocation(line: 24, column: 5, scope: !9)
!88 = !DILocation(line: 25, column: 14, scope: !9)
!89 = !DILocation(line: 25, column: 12, scope: !9)
!90 = !DILocation(line: 25, column: 18, scope: !9)
!91 = !DILocation(line: 25, column: 23, scope: !9)
!92 = !DILocation(line: 25, column: 21, scope: !9)
!93 = !DILocation(line: 25, column: 16, scope: !9)
!94 = !DILocation(line: 25, column: 6, scope: !9)
!95 = !DILocation(line: 26, column: 21, scope: !9)
!96 = !DILocation(line: 26, column: 19, scope: !9)
!97 = !DILocation(line: 26, column: 8, scope: !9)
!98 = !DILocation(line: 26, column: 6, scope: !9)
!99 = !DILocation(line: 27, column: 8, scope: !9)
!100 = !DILocation(line: 27, column: 19, scope: !9)
!101 = !DILocation(line: 27, column: 17, scope: !9)
!102 = !DILocation(line: 27, column: 11, scope: !9)
!103 = !DILocation(line: 27, column: 4, scope: !9)
!104 = !DILocation(line: 27, column: 6, scope: !9)
!105 = !DILocation(line: 28, column: 15, scope: !9)
!106 = !DILocation(line: 28, column: 14, scope: !9)
!107 = !DILocation(line: 28, column: 11, scope: !9)
!108 = !DILocation(line: 28, column: 5, scope: !9)
!109 = !DILocation(line: 30, column: 10, scope: !9)
!110 = !DILocation(line: 30, column: 3, scope: !9)
!111 = distinct !DISubprogram(name: "vranlc", scope: !1, file: !1, line: 34, type: !112, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!112 = !DISubroutineType(types: !113)
!113 = !{null, !4, !12, !5, !12}
!114 = !DILocalVariable(name: "n", arg: 1, scope: !111, file: !1, line: 34, type: !4)
!115 = !DILocation(line: 34, column: 18, scope: !111)
!116 = !DILocalVariable(name: "x", arg: 2, scope: !111, file: !1, line: 34, type: !12)
!117 = !DILocation(line: 34, column: 29, scope: !111)
!118 = !DILocalVariable(name: "a", arg: 3, scope: !111, file: !1, line: 34, type: !5)
!119 = !DILocation(line: 34, column: 39, scope: !111)
!120 = !DILocalVariable(name: "y", arg: 4, scope: !111, file: !1, line: 34, type: !12)
!121 = !DILocation(line: 34, column: 49, scope: !111)
!122 = !DILocalVariable(name: "r23", scope: !111, file: !1, line: 37, type: !19)
!123 = !DILocation(line: 37, column: 16, scope: !111)
!124 = !DILocalVariable(name: "r46", scope: !111, file: !1, line: 38, type: !19)
!125 = !DILocation(line: 38, column: 16, scope: !111)
!126 = !DILocalVariable(name: "t23", scope: !111, file: !1, line: 39, type: !19)
!127 = !DILocation(line: 39, column: 16, scope: !111)
!128 = !DILocalVariable(name: "t46", scope: !111, file: !1, line: 40, type: !19)
!129 = !DILocation(line: 40, column: 16, scope: !111)
!130 = !DILocalVariable(name: "t1", scope: !111, file: !1, line: 42, type: !5)
!131 = !DILocation(line: 42, column: 10, scope: !111)
!132 = !DILocalVariable(name: "t2", scope: !111, file: !1, line: 42, type: !5)
!133 = !DILocation(line: 42, column: 14, scope: !111)
!134 = !DILocalVariable(name: "t3", scope: !111, file: !1, line: 42, type: !5)
!135 = !DILocation(line: 42, column: 18, scope: !111)
!136 = !DILocalVariable(name: "t4", scope: !111, file: !1, line: 42, type: !5)
!137 = !DILocation(line: 42, column: 22, scope: !111)
!138 = !DILocalVariable(name: "a1", scope: !111, file: !1, line: 42, type: !5)
!139 = !DILocation(line: 42, column: 26, scope: !111)
!140 = !DILocalVariable(name: "a2", scope: !111, file: !1, line: 42, type: !5)
!141 = !DILocation(line: 42, column: 30, scope: !111)
!142 = !DILocalVariable(name: "x1", scope: !111, file: !1, line: 42, type: !5)
!143 = !DILocation(line: 42, column: 34, scope: !111)
!144 = !DILocalVariable(name: "x2", scope: !111, file: !1, line: 42, type: !5)
!145 = !DILocation(line: 42, column: 38, scope: !111)
!146 = !DILocalVariable(name: "z", scope: !111, file: !1, line: 42, type: !5)
!147 = !DILocation(line: 42, column: 42, scope: !111)
!148 = !DILocalVariable(name: "i", scope: !111, file: !1, line: 44, type: !4)
!149 = !DILocation(line: 44, column: 7, scope: !111)
!150 = !DILocation(line: 46, column: 14, scope: !111)
!151 = !DILocation(line: 46, column: 12, scope: !111)
!152 = !DILocation(line: 46, column: 6, scope: !111)
!153 = !DILocation(line: 47, column: 14, scope: !111)
!154 = !DILocation(line: 47, column: 8, scope: !111)
!155 = !DILocation(line: 47, column: 6, scope: !111)
!156 = !DILocation(line: 48, column: 8, scope: !111)
!157 = !DILocation(line: 48, column: 18, scope: !111)
!158 = !DILocation(line: 48, column: 16, scope: !111)
!159 = !DILocation(line: 48, column: 10, scope: !111)
!160 = !DILocation(line: 48, column: 6, scope: !111)
!161 = !DILocation(line: 50, column: 11, scope: !162)
!162 = distinct !DILexicalBlock(scope: !111, file: !1, line: 50, column: 3)
!163 = !DILocation(line: 50, column: 9, scope: !162)
!164 = !DILocation(line: 50, column: 16, scope: !165)
!165 = !DILexicalBlockFile(scope: !166, file: !1, discriminator: 1)
!166 = distinct !DILexicalBlock(scope: !162, file: !1, line: 50, column: 3)
!167 = !DILocation(line: 50, column: 20, scope: !165)
!168 = !DILocation(line: 50, column: 18, scope: !165)
!169 = !DILocation(line: 50, column: 3, scope: !165)
!170 = !DILocation(line: 52, column: 18, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !1, line: 50, column: 29)
!172 = !DILocation(line: 52, column: 17, scope: !171)
!173 = !DILocation(line: 52, column: 14, scope: !171)
!174 = !DILocation(line: 52, column: 8, scope: !171)
!175 = !DILocation(line: 53, column: 16, scope: !171)
!176 = !DILocation(line: 53, column: 10, scope: !171)
!177 = !DILocation(line: 53, column: 8, scope: !171)
!178 = !DILocation(line: 54, column: 11, scope: !171)
!179 = !DILocation(line: 54, column: 10, scope: !171)
!180 = !DILocation(line: 54, column: 21, scope: !171)
!181 = !DILocation(line: 54, column: 19, scope: !171)
!182 = !DILocation(line: 54, column: 13, scope: !171)
!183 = !DILocation(line: 54, column: 8, scope: !171)
!184 = !DILocation(line: 55, column: 10, scope: !171)
!185 = !DILocation(line: 55, column: 15, scope: !171)
!186 = !DILocation(line: 55, column: 13, scope: !171)
!187 = !DILocation(line: 55, column: 20, scope: !171)
!188 = !DILocation(line: 55, column: 25, scope: !171)
!189 = !DILocation(line: 55, column: 23, scope: !171)
!190 = !DILocation(line: 55, column: 18, scope: !171)
!191 = !DILocation(line: 55, column: 8, scope: !171)
!192 = !DILocation(line: 56, column: 23, scope: !171)
!193 = !DILocation(line: 56, column: 21, scope: !171)
!194 = !DILocation(line: 56, column: 10, scope: !171)
!195 = !DILocation(line: 56, column: 8, scope: !171)
!196 = !DILocation(line: 57, column: 9, scope: !171)
!197 = !DILocation(line: 57, column: 20, scope: !171)
!198 = !DILocation(line: 57, column: 18, scope: !171)
!199 = !DILocation(line: 57, column: 12, scope: !171)
!200 = !DILocation(line: 57, column: 7, scope: !171)
!201 = !DILocation(line: 58, column: 16, scope: !171)
!202 = !DILocation(line: 58, column: 14, scope: !171)
!203 = !DILocation(line: 58, column: 20, scope: !171)
!204 = !DILocation(line: 58, column: 25, scope: !171)
!205 = !DILocation(line: 58, column: 23, scope: !171)
!206 = !DILocation(line: 58, column: 18, scope: !171)
!207 = !DILocation(line: 58, column: 8, scope: !171)
!208 = !DILocation(line: 59, column: 23, scope: !171)
!209 = !DILocation(line: 59, column: 21, scope: !171)
!210 = !DILocation(line: 59, column: 10, scope: !171)
!211 = !DILocation(line: 59, column: 8, scope: !171)
!212 = !DILocation(line: 60, column: 10, scope: !171)
!213 = !DILocation(line: 60, column: 21, scope: !171)
!214 = !DILocation(line: 60, column: 19, scope: !171)
!215 = !DILocation(line: 60, column: 13, scope: !171)
!216 = !DILocation(line: 60, column: 6, scope: !171)
!217 = !DILocation(line: 60, column: 8, scope: !171)
!218 = !DILocation(line: 61, column: 20, scope: !171)
!219 = !DILocation(line: 61, column: 19, scope: !171)
!220 = !DILocation(line: 61, column: 16, scope: !171)
!221 = !DILocation(line: 61, column: 7, scope: !171)
!222 = !DILocation(line: 61, column: 5, scope: !171)
!223 = !DILocation(line: 61, column: 10, scope: !171)
!224 = !DILocation(line: 62, column: 3, scope: !171)
!225 = !DILocation(line: 50, column: 24, scope: !226)
!226 = !DILexicalBlockFile(scope: !166, file: !1, discriminator: 2)
!227 = !DILocation(line: 50, column: 3, scope: !226)
!228 = distinct !{!228, !229}
!229 = !DILocation(line: 50, column: 3, scope: !111)
!230 = !DILocation(line: 64, column: 3, scope: !111)
!231 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 67, type: !232, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!232 = !DISubroutineType(types: !233)
!233 = !{!4}
!234 = !DILocalVariable(name: "begin", scope: !231, file: !1, line: 69, type: !5)
!235 = !DILocation(line: 69, column: 8, scope: !231)
!236 = !DILocation(line: 69, column: 16, scope: !231)
!237 = !DILocalVariable(name: "i1", scope: !231, file: !1, line: 70, type: !4)
!238 = !DILocation(line: 70, column: 6, scope: !231)
!239 = !DILocalVariable(name: "i2", scope: !231, file: !1, line: 70, type: !4)
!240 = !DILocation(line: 70, column: 10, scope: !231)
!241 = !DILocalVariable(name: "i3", scope: !231, file: !1, line: 70, type: !4)
!242 = !DILocation(line: 70, column: 14, scope: !231)
!243 = !DILocalVariable(name: "d1", scope: !231, file: !1, line: 70, type: !4)
!244 = !DILocation(line: 70, column: 18, scope: !231)
!245 = !DILocalVariable(name: "e1", scope: !231, file: !1, line: 70, type: !4)
!246 = !DILocation(line: 70, column: 22, scope: !231)
!247 = !DILocalVariable(name: "e2", scope: !231, file: !1, line: 70, type: !4)
!248 = !DILocation(line: 70, column: 26, scope: !231)
!249 = !DILocalVariable(name: "e3", scope: !231, file: !1, line: 70, type: !4)
!250 = !DILocation(line: 70, column: 30, scope: !231)
!251 = !DILocalVariable(name: "xx", scope: !231, file: !1, line: 71, type: !5)
!252 = !DILocation(line: 71, column: 8, scope: !231)
!253 = !DILocalVariable(name: "x0", scope: !231, file: !1, line: 71, type: !5)
!254 = !DILocation(line: 71, column: 12, scope: !231)
!255 = !DILocalVariable(name: "x1", scope: !231, file: !1, line: 71, type: !5)
!256 = !DILocation(line: 71, column: 16, scope: !231)
!257 = !DILocalVariable(name: "a1", scope: !231, file: !1, line: 71, type: !5)
!258 = !DILocation(line: 71, column: 20, scope: !231)
!259 = !DILocalVariable(name: "a2", scope: !231, file: !1, line: 71, type: !5)
!260 = !DILocation(line: 71, column: 24, scope: !231)
!261 = !DILocalVariable(name: "ai", scope: !231, file: !1, line: 71, type: !5)
!262 = !DILocation(line: 71, column: 28, scope: !231)
!263 = !DILocalVariable(name: "x", scope: !231, file: !1, line: 72, type: !19)
!264 = !DILocation(line: 72, column: 14, scope: !231)
!265 = !DILocalVariable(name: "rdummy", scope: !231, file: !1, line: 73, type: !5)
!266 = !DILocation(line: 73, column: 8, scope: !231)
!267 = !DILocation(line: 74, column: 4, scope: !231)
!268 = !DILocation(line: 75, column: 6, scope: !231)
!269 = !DILocation(line: 76, column: 6, scope: !231)
!270 = !DILocation(line: 77, column: 6, scope: !231)
!271 = !DILocation(line: 78, column: 6, scope: !231)
!272 = !DILocation(line: 80, column: 6, scope: !231)
!273 = !DILocation(line: 81, column: 6, scope: !231)
!274 = !DILocation(line: 84, column: 6, scope: !231)
!275 = !DILocation(line: 85, column: 11, scope: !231)
!276 = !DILocation(line: 85, column: 6, scope: !231)
!277 = !DILocation(line: 86, column: 6, scope: !231)
!278 = !DILocation(line: 88, column: 12, scope: !231)
!279 = !DILocation(line: 88, column: 3, scope: !231)
!280 = !DILocalVariable(name: "z", scope: !231, file: !1, line: 88, type: !281)
!281 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, align: 64, elements: !282)
!282 = !{!283}
!283 = !DISubrange(count: -1)
!284 = !DIExpression(DW_OP_deref)
!285 = !DILocation(line: 88, column: 10, scope: !231)
!286 = !DILocalVariable(name: "a", scope: !231, file: !1, line: 90, type: !19)
!287 = !DILocation(line: 90, column: 16, scope: !231)
!288 = !DILocation(line: 92, column: 9, scope: !231)
!289 = !DILocalVariable(name: "end", scope: !231, file: !1, line: 111, type: !5)
!290 = !DILocation(line: 111, column: 8, scope: !231)
!291 = !DILocation(line: 111, column: 14, scope: !231)
!292 = !DILocalVariable(name: "time_spent", scope: !231, file: !1, line: 112, type: !5)
!293 = !DILocation(line: 112, column: 12, scope: !231)
!294 = !DILocation(line: 112, column: 34, scope: !231)
!295 = !DILocation(line: 112, column: 40, scope: !231)
!296 = !DILocation(line: 112, column: 38, scope: !231)
!297 = !DILocation(line: 113, column: 35, scope: !231)
!298 = !DILocation(line: 113, column: 5, scope: !231)
!299 = !DILocation(line: 114, column: 5, scope: !231)
!300 = !DILocation(line: 115, column: 1, scope: !231)
!301 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 92, type: !302, isLocal: true, isDefinition: true, scopeLine: 93, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!302 = !DISubroutineType(types: !303)
!303 = !{null, !304, !304, !307, !308, !307, !307, !309, !309, !307, !307, !309, !309, !307, !310, !12, !307}
!304 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !305)
!305 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !306)
!306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, align: 64)
!307 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !5, size: 64, align: 64)
!308 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !19, size: 64, align: 64)
!309 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4, size: 64, align: 64)
!310 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!311 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !301, type: !304, flags: DIFlagArtificial | DIFlagObjectPointer)
!312 = !DILocation(line: 0, scope: !301)
!313 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !301, type: !304, flags: DIFlagArtificial)
!314 = !DILocalVariable(name: "x0", arg: 3, scope: !301, type: !307, flags: DIFlagArtificial)
!315 = !DILocalVariable(name: "x", arg: 4, scope: !301, type: !308, flags: DIFlagArtificial)
!316 = !DILocalVariable(name: "rdummy", arg: 5, scope: !301, type: !307, flags: DIFlagArtificial)
!317 = !DILocalVariable(name: "ai", arg: 6, scope: !301, type: !307, flags: DIFlagArtificial)
!318 = !DILocalVariable(name: "i3", arg: 7, scope: !301, type: !309, flags: DIFlagArtificial)
!319 = !DILocalVariable(name: "e3", arg: 8, scope: !301, type: !309, flags: DIFlagArtificial)
!320 = !DILocalVariable(name: "x1", arg: 9, scope: !301, type: !307, flags: DIFlagArtificial)
!321 = !DILocalVariable(name: "a2", arg: 10, scope: !301, type: !307, flags: DIFlagArtificial)
!322 = !DILocalVariable(name: "e2", arg: 11, scope: !301, type: !309, flags: DIFlagArtificial)
!323 = !DILocalVariable(name: "d1", arg: 12, scope: !301, type: !309, flags: DIFlagArtificial)
!324 = !DILocalVariable(name: "a", arg: 13, scope: !301, type: !307, flags: DIFlagArtificial)
!325 = !DILocalVariable(name: "vla", arg: 14, scope: !301, type: !310, flags: DIFlagArtificial)
!326 = !DILocalVariable(name: "z", arg: 15, scope: !301, type: !12, flags: DIFlagArtificial)
!327 = !DILocalVariable(name: "a1", arg: 16, scope: !301, type: !307, flags: DIFlagArtificial)
!328 = !DILocation(line: 93, column: 1, scope: !301)
!329 = !DILocation(line: 94, column: 11, scope: !330)
!330 = distinct !DILexicalBlock(scope: !301, file: !1, line: 93, column: 1)
!331 = !DILocation(line: 96, column: 8, scope: !332)
!332 = distinct !DILexicalBlock(scope: !333, file: !1, line: 95, column: 3)
!333 = distinct !DILexicalBlock(scope: !330, file: !1, line: 94, column: 11)
!334 = !DILocation(line: 97, column: 26, scope: !332)
!335 = !DILocation(line: 97, column: 14, scope: !332)
!336 = !DILocation(line: 97, column: 12, scope: !332)
!337 = !DILocation(line: 99, column: 13, scope: !338)
!338 = distinct !DILexicalBlock(scope: !332, file: !1, line: 99, column: 5)
!339 = !DILocation(line: 99, column: 10, scope: !338)
!340 = !DILocation(line: 99, column: 18, scope: !341)
!341 = !DILexicalBlockFile(scope: !342, file: !1, discriminator: 1)
!342 = distinct !DILexicalBlock(scope: !338, file: !1, line: 99, column: 5)
!343 = !DILocation(line: 99, column: 23, scope: !341)
!344 = !DILocation(line: 99, column: 21, scope: !341)
!345 = !DILocation(line: 99, column: 5, scope: !341)
!346 = !DILocation(line: 100, column: 14, scope: !347)
!347 = distinct !DILexicalBlock(scope: !342, file: !1, line: 99, column: 33)
!348 = !DILocation(line: 100, column: 12, scope: !347)
!349 = !DILocation(line: 101, column: 30, scope: !347)
!350 = !DILocation(line: 101, column: 18, scope: !347)
!351 = !DILocation(line: 101, column: 16, scope: !347)
!352 = !DILocation(line: 102, column: 15, scope: !347)
!353 = !DILocation(line: 104, column: 14, scope: !347)
!354 = !DILocation(line: 102, column: 40, scope: !347)
!355 = !DILocation(line: 102, column: 15, scope: !356)
!356 = !DILexicalBlockFile(scope: !347, file: !1, discriminator: 1)
!357 = !DILocation(line: 102, column: 37, scope: !358)
!358 = distinct !DILexicalBlock(scope: !347, file: !1, line: 102, column: 15)
!359 = !DILocation(line: 102, column: 40, scope: !358)
!360 = !DILocation(line: 102, column: 15, scope: !361)
!361 = !DILexicalBlockFile(scope: !347, file: !1, discriminator: 2)
!362 = !DILocation(line: 108, column: 5, scope: !347)
!363 = !DILocation(line: 99, column: 29, scope: !364)
!364 = !DILexicalBlockFile(scope: !342, file: !1, discriminator: 2)
!365 = !DILocation(line: 99, column: 5, scope: !364)
!366 = distinct !{!366, !367}
!367 = !DILocation(line: 99, column: 5, scope: !332)
!368 = !DILocation(line: 109, column: 3, scope: !332)
!369 = !DILocation(line: 94, column: 21, scope: !370)
!370 = !DILexicalBlockFile(scope: !333, file: !1, discriminator: 1)
!371 = !DILocation(line: 110, column: 1, scope: !301)
!372 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !373, type: !4, flags: DIFlagArtificial | DIFlagObjectPointer)
!373 = distinct !DISubprogram(name: ".omp_outlined..1", scope: !1, file: !1, line: 102, type: !374, isLocal: true, isDefinition: true, scopeLine: 103, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!374 = !DISubroutineType(types: !375)
!375 = !{null, !4, !306, !376, !378, !376, !384}
!376 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !377)
!377 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!378 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !379)
!379 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !380, size: 64, align: 64)
!380 = !DISubroutineType(types: !381)
!381 = !{null, !382, null}
!382 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !383)
!383 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !377)
!384 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64, align: 64)
!385 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 102, size: 576, align: 64, elements: !2)
!386 = !DILocation(line: 0, scope: !373)
!387 = !DILocalVariable(name: ".part_id.", arg: 2, scope: !373, type: !306, flags: DIFlagArtificial)
!388 = !DILocalVariable(name: ".privates.", arg: 3, scope: !373, type: !376, flags: DIFlagArtificial)
!389 = !DILocalVariable(name: ".copy_fn.", arg: 4, scope: !373, type: !378, flags: DIFlagArtificial)
!390 = !DILocalVariable(name: ".task_t.", arg: 5, scope: !373, type: !376, flags: DIFlagArtificial)
!391 = !DILocalVariable(name: "__context", arg: 6, scope: !373, type: !384, flags: DIFlagArtificial)
!392 = !DILocation(line: 103, column: 7, scope: !373)
!393 = !DILocation(line: 103, column: 15, scope: !394)
!394 = distinct !DILexicalBlock(scope: !373, file: !1, line: 103, column: 7)
!395 = !DILocation(line: 103, column: 12, scope: !394)
!396 = !DILocation(line: 103, column: 20, scope: !397)
!397 = !DILexicalBlockFile(scope: !398, file: !1, discriminator: 1)
!398 = distinct !DILexicalBlock(scope: !394, file: !1, line: 103, column: 7)
!399 = !DILocation(line: 103, column: 25, scope: !397)
!400 = !DILocation(line: 103, column: 23, scope: !397)
!401 = !DILocation(line: 103, column: 7, scope: !397)
!402 = !DILocation(line: 104, column: 14, scope: !403)
!403 = distinct !DILexicalBlock(scope: !398, file: !1, line: 103, column: 35)
!404 = !DILocation(line: 104, column: 12, scope: !403)
!405 = !DILocation(line: 105, column: 16, scope: !403)
!406 = !DILocation(line: 105, column: 28, scope: !403)
!407 = !DILocation(line: 105, column: 9, scope: !403)
!408 = !DILocation(line: 106, column: 29, scope: !403)
!409 = !DILocation(line: 106, column: 18, scope: !403)
!410 = !DILocation(line: 106, column: 9, scope: !403)
!411 = !DILocation(line: 106, column: 16, scope: !403)
!412 = !DILocation(line: 103, column: 31, scope: !413)
!413 = !DILexicalBlockFile(scope: !398, file: !1, discriminator: 2)
!414 = !DILocation(line: 103, column: 7, scope: !413)
!415 = distinct !{!415, !392}
