#!/bin/bash
set -x

# This script will be run every time you boot the workload. In this case we're
# running a benchmark and recording some timing information into a csv that can
# be extracted later. Also note that we call poweroff at the end, if you would
# prefer to interact with the workload after it's booted, you can leave that off.

cd root/rv8-bench/

echo "rv8 Bench" >> ../result.txt
./aes >> ../result.txt 2>&1
./bigint >> ../result.txt 2>&1
./dhrystone >> ../result.txt 2>&1
./miniz >> ../result.txt 2>&1
./norx >> ../result.txt 2>&1
./primes >> ../result.txt 2>&1
./qsort >> ../result.txt 2>&1
./sha512 >> ../result.txt 2>&1


