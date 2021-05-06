rm -rf sim && afu_sim_setup -t VCS --source filelist.txt sim && cd sim && make && make sim && make wave
