CC = riscv64-unknown-linux-gnu-gcc
C++ = riscv64-unknown-linux-gnu-g++
CFLAGS := -O3 -static -DRISCV

#CC = gcc
#C++ = g++
#CFLAGS := -O3 -std=gnu99

all: aes bigint dhrystone miniz norx primes qsort sha512

aes: src/aes.c
	${CC} ${CFLAGS} -o $@ $^

bigint: src/bigint.cc
	${C++} ${CFLAGS} -o $@ $^

dhrystone: src/dhrystone.c
	${CC} ${CFLAGS} -o $@ $^

miniz: src/miniz.c
	${CC} ${CFLAGS} -o $@ $^

norx: src/norx.c
	${CC} ${CFLAGS} -o $@ $^

primes: src/primes.c
	${CC} ${CFLAGS} -o $@ $^

qsort: src/qsort.c
	${CC} ${CFLAGS} -o $@ $^

sha512: src/sha512.c
	${CC} ${CFLAGS} -o $@ $^

clean:
	rm -f aes bigint dhrystone miniz norx primes qsort sha512 *.o
