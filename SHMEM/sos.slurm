#!/bin/bash
#SBATCH --qos=debug
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --constraint=cpu
#SBATCH --job-name=helloWorld
#SBATCH --output=weird.o%j
#SBATCH --time=00:00:30

## edit values
START_PROCS=1
TOTAL_PROCS=2
NUM_ITERATIONS=10
NUM_KEYS=10000000

export SMA_OFI_PROVIDER=cxi
export SHMEM_OFI_PROVIDER=cxi
export SHMEM_THREAD_MULTIPLE
export SHMEM_SYMMETRIC_SIZE=1G
# export SHMEM_DEBUG=1
export SHMEM_WORKER_PROGRAM=/global/homes/p/parkerha/ISx/SHMEM/bin/isx.strong
export SHMEM_WORKER_ARGS="$NUM_KEYS $NUM_ITERATIONS $TOTAL_PROCS test.log"
# export FI_LOG_LEVEL=Debug

module load openmpi
mpirun -np $START_PROCS /global/homes/p/parkerha/ISx/SHMEM/bin/isx.strong $NUM_KEYS $NUM_ITERATIONS $TOTAL_PROCS test.log

