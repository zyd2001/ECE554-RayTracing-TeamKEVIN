rm -rf synth
afu_synth_setup --source Hardware/filelist_synth.txt synth
cd synth
${OPAE_PLATFORM_ROOT}/bin/run.sh