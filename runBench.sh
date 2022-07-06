#!/bin/bash
set -x

# This script will be run every time you boot the workload. In this case we're
# running a benchmark and recording some timing information into a csv that can
# be extracted later. Also note that we call poweroff at the end, if you would
# prefer to interact with the workload after it's booted, you can leave that off.

cd /
cd root/gups/
echo "[randaccess Bench]" >> ../result.txt
./randaccess 1 1000000000 1000000 >> ../result.txt 2>&1
echo "[randaccess Bench End]" >> ../result.txt

#cd /
#cd root/rv8-bench/
#echo "[rv8 Bench: aes bigint dhrystone miniz norx primes qsort sha512]" >> ../result.txt
#./aes >> ../result.txt 2>&1
#./bigint >> ../result.txt 2>&1
#./dhrystone >> ../result.txt 2>&1
#./miniz >> ../result.txt 2>&1
#./norx >> ../result.txt 2>&1
#./primes >> ../result.txt 2>&1
#./qsort >> ../result.txt 2>&1
#./sha512 >> ../result.txt 2>&1
#echo "[rv8 Bench: end]" >> ../result.txt

cd /
cd root/serverless/image-process/
run_serverless_func()
{
	./entry_func/entry &
	./imageResize/imageResize &
	./imageErosion/imageErosion &
	./imageRotate/imageRotate &
	sleep 10
	./serverless-user/serverless-user $1
}

echo "[Serverless Bench: image processing]" >> ../../result.txt
run_serverless_func 32 >> ../../result.txt 2>&1
run_serverless_func 64 >> ../../result.txt 2>&1
run_serverless_func 128 >> ../../result.txt 2>&1
run_serverless_func 256 >> ../../result.txt 2>&1
run_serverless_func 512 >> ../../result.txt 2>&1
run_serverless_func 768 >> ../../result.txt 2>&1
run_serverless_func 1024 >> ../../result.txt 2>&1
run_serverless_func 1536 >> ../../result.txt 2>&1
run_serverless_func 2048 >> ../../result.txt 2>&1
echo "[Serverless Bench: end]" >> ../../result.txt

poweroff
