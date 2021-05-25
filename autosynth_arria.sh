frequency='200'
rm -rf Hardware/IP/Arria_$frequency/Fix_Add
rm -rf Hardware/IP/Arria_$frequency/Fix_Div
rm -rf Hardware/IP/Arria_$frequency/Fix_Mul
rm -rf Hardware/IP/Arria_$frequency/Float_Add
rm -rf Hardware/IP/Arria_$frequency/Float_Div
rm -rf Hardware/IP/Arria_$frequency/Float_Grtr
rm -rf Hardware/IP/Arria_$frequency/Float_Inv
rm -rf Hardware/IP/Arria_$frequency/Float_Less
rm -rf Hardware/IP/Arria_$frequency/Float_Mul
rm -rf Hardware/IP/Arria_$frequency/Float_Sqrt
rm -rf Hardware/IP/Arria_$frequency/FtoI
rm -rf Hardware/IP/Arria_$frequency/ItoF
rm -rf synth_Arria_$frequency
afu_synth_setup --source Hardware/filelist_synth_Arria_$frequency.txt synth_Arria_$frequency
cd synth_Arria_$frequency
${OPAE_PLATFORM_ROOT}/bin/run.sh