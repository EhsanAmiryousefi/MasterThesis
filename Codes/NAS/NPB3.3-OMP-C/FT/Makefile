SHELL=/bin/sh
BENCHMARK=ft
BENCHMARKU=FT

include ../config/make.def

include ../sys/make.common

ifdef binaries
OBJS = primary.o \
			 ${COMMON}/print_results.o \
			 ${COMMON}/${RAND}.o \
       ${COMMON}/c_timers.o \
			 ${COMMON}/wtime.o

PRIMARIES = ft.o
else
OBJS = primary.bc \
			 ${COMMON}/print_results.bc \
			 ${COMMON}/${RAND}.bc \
       ${COMMON}/c_timers.bc \
			 ${COMMON}/wtime.bc

PRIMARIES = ft.bc
endif

${PROGRAM}: config ${OBJS}
	${CLINK} ${CLINKFLAGS} -o ${PROGRAM} ${OBJS} ${C_LIB}

ifdef binaries
.c.o:
	${CCOMPILE} $<
else
%.bc:%.c npbparams.h
	${CCOMPILE} $<
endif

primary.o: ${PRIMARIES}
	${CLINK_R} ${CLINKFLAGS} -o primary.o ${PRIMARIES}

primary.bc: ${PRIMARIES}
	${CLINK_R} ${CLINKFLAGS} -o primary.bc ${PRIMARIES}

ft.o: ft.c npbparams.h
ft.bc: ft.c npbparams.h

clean:
	- rm -f *.o *.bc *~ 
	- rm -f npbparams.h core
