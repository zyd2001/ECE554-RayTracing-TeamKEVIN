frequency='200'
rm -rf Hardware/IP/$frequency\hz/Fix_Add
rm -rf Hardware/IP/$frequency\hz/Fix_Div
rm -rf Hardware/IP/$frequency\hz/Fix_Mul
rm -rf Hardware/IP/$frequency\hz/Float_Add
rm -rf Hardware/IP/$frequency\hz/Float_Div
rm -rf Hardware/IP/$frequency\hz/Float_Grtr
rm -rf Hardware/IP/$frequency\hz/Float_Inv
rm -rf Hardware/IP/$frequency\hz/Float_Less
rm -rf Hardware/IP/$frequency\hz/Float_Mul
rm -rf Hardware/IP/$frequency\hz/Float_Sqrt
rm -rf Hardware/IP/$frequency\hz/FtoI
rm -rf Hardware/IP/$frequency\hz/ItoF
rm -rf synth_$frequency\hz
afu_synth_setup --source Hardware/filelist_synth_$frequency\hz.txt synth_$frequency\hz
cd synth_$frequency\hz
${OPAE_PLATFORM_ROOT}/bin/run.sh