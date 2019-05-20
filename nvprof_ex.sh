#!/bin/bash
# example script to collect several metrics for a cuda program
# Original author: Murali
#BSUB -e err.spmv.nvprof
#BSUB -o out.spmv.nvprof
#BSUB -R "span[ptile=20]"
#BSUB -W 10
#BSUB -x
#BSUB -C 1
#BSUB -n 1
#BSUB -G guests

##### These are shell commands

date
##### Launch parallel job using srun

## for ray 
#module load cuda/9.0.176
#module load cuda/9.2.88

cd $HOME/PORPLE/OrgAndOptBenchmarks/spmv


nvprof --metrics flop_count_sp_fma,flop_count_dp_fma,inst_compute_ld_st,inst_executed,inst_fp_32,inst_fp_64,inst_integer,dram_read_transactions,dram_write_transactions --log-file output.log ./spmv.out

cd
echo 'Done'
