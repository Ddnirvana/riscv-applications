#!/bin/bash

# This script will run on the host from the workload directory
# (e.g. workloads/example-fed) every time the workload is built.
# It is recommended to call into something like a makefile because
# this script may be called multiple times.
echo "Building gup benchmark"
cd overlay/root/gups
make clean
make
cd -

echo "Building rv8 benchmark"
cd overlay/root/rv8-bench
make clean
make
cd -


echo "Building Serverless benchmark"
cd overlay/root/serverless/image-process
make clean
make
cd -
