#!/bin/bash
#SBATCH --qos=debug
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=3
#SBATCH --constraint=cpu
#SBATCH --job-name=helloWorld
#SBATCH --output=helloWorld.o%j
#SBATCH --time=00:00:30
export SMA_OFI_PROVIDER=cxi
export SHMEM_OFI_PROVIDER=cxi
export SHMEM_THREAD_MULTIPLE
export SHMEM_SYMMETRIC_SIZE=1G
export SHMEM_DEBUG=1
export SHMEM_WORKER_PROGRAM=/global/homes/p/parkerha/ISx/SHMEM/bin/isx.strong
export SHMEM_WORKER_ARGS="10 10 3 test.log"
export FI_LOG_LEVEL=Debug

module load openmpi
mpirun -np 1 /global/homes/p/parkerha/ISx/SHMEM/bin/isx.strong 10 10 3 test.log

