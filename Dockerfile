#This Dockerfile is for getting GPU metrics from Nvprof in one-click.
#The main steps are:
#       1. basic configuration (check GPU driver, CUDA version, etc)
#       2. copy the default files from host to the container (the benchmark in "PORPLR" and the script file in "Xplace" )
#       3. GO to benchmark directory to make the benchmark
#         3.1 In /spmv dir, run "make check", it will wait a few moment to get the mutiple .out output
#       4. run the script (nvprof_ex.sh) to get the GPU metrics via Nvprof. Here in the script it specifies serveral metrics in CUDA 9.2 runable. 
#       5. The output file is located in /spmv/output.log

#------------------------
#  Main functions
#------------------------

# 1. Basic configuration


# 2. copy files from host to container
ADD /PROPLE ~/PROPLE
ADD /xplacer ~/xplacer

# 3. make the benchmark
RUN cd /PROPLE/OrgAndOptBenchmarks/spmv
RUN make check


# 4. run the script
RUN cd /xplacer/scripts
RUN ./nvprof.ex.sh

