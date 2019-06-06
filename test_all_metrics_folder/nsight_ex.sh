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
#odule load cuda/9.2.88

#cd $HOME/PORPLE/OrgAndOptBenchmarks/spmv


#sudo /usr/local/cuda-10.1/NsightCompute-2019.3/nv-nsight-cu-cli --metrics smsp__cycles_elapsed.avg.pct_of_peak_sustained_elapsed,sm__warps_active.avg.pct_of_peak_sustained_active,dram__bytes_read.sum.per_second,smsp__warps_eligible.sum.per_cycle_active,smsp__sass_thread_inst_executed_op_mufu_pred_on.sum --csv ./spmv.out >> nsight_metrics.txt

#sudo /usr/local/cuda-10.1/NsightCompute-2019.3/nv-nsight-cu-cli --metrics dram__bytes.avg,dram__bytes.max,dram__bytes.min,dram__bytes.sum,dram__bytes_read.avg,dram__bytes_read.max,dram__bytes_read.min,dram__bytes_read.sum,dram__bytes_write.avg,dram__cycles_active.avg,dram__cycles_active_read.avg,dram__cycles_active_write.avg,dram__cycles_elapsed.avg,dram__cycles_in_frame.avg,dram__cycles_in_region.avg --csv ./spmv.out >> nsight_metrics.txt


#for i in *.txt
#do	
#	sudo /usr/local/cuda-10.1/NsightCompute-2019.3/nv-nsight-cu-cli --metrics $(<./$i) --csv ./spmv.out >> ./logs/nsight_logs_$i
#done
sudo /usr/local/cuda-10.1/NsightCompute-2019.3/nv-nsight-cu-cli --metrics $(<./46.txt) --csv ./spmv.out >> ./logs/nsight_logs_new_45


#sudo /usr/local/cuda-10.1/NsightCompute-2019.3/nv-nsight-cu-cli --metrics sm__inst_executed.sum,l1tex__data_bank_conflicts_pipe_lsu.sum,dram__bytes_read.sum,dram__bytes_write.sum,l1tex__t_requests_pipe_lsu_mem_global_op_ld.sum,l1tex__t_requests_pipe_lsu_mem_global_op_red.sum,lts__t_sectors_aperture_sysmem_op_write.sum.per_second,l1tex__lsu_writeback_active.sum  --csv ./spmv.out >> nsight_report.txt

#sudo /usr/local/cuda-10.1/NsightCompute-2019.3/nv-nsight-cu-cli --devices   

#sudo /usr/local/cuda-10.1/NsightCompute-2019.3/nv-nsight-cu-cli --metrics "regex:.*" --csv ./spmv.out >> nsight_log_all.txt
#sudo /usr/local/cuda-10.1/NsightCompute-2019.3/nv-nsight-cu-cli --metrics "dram__bytes_read.sum,dram__bytes_write.sum,dram__sectors_write.sum,smsp__sass_thread_inst_executed_op_dadd_pred_on.sum,smsp__sass_thread_inst_executed_op_dfma_pred_on.sum,l1tex__t_bytes_pipe_lsu_mem_global_op_ld.sum.per_second,l1tex__t_requests_pipe_lsu_mem_global_op_atom.sum,smsp__sass_thread_inst_executed_op_fp64_pred_on.sum,smsp__inst_executed.sum" --csv ./1.out >> nsight_report.txt
cd
echo 'Done'
