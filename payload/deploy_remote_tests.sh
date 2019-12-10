#! /bin/bash

rm -rf ./package
mkdir ./package
./deploy.sh ./package

# rm -rf build/data
# mkdir -p build/data/core-sensors
# cp core-sensors/tests/data/* build/data/core-sensors/

scp -i /home/puya/.ssh/rsa_keys/puya_scu package/payload-* scu:~
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "rm -rf ~/test_payload"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "rmdir ~/temp_payload"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "mkdir ~/temp_payload"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "tar -xvf ~/payload-* --directory ~/temp_payload"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "rm ~/payload-*.tar.gz"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "mkdir -p ~/test_payload/build"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "mv ~/temp_payload ~/test_payload/build/bin"
scp -i /home/puya/.ssh/rsa_keys/puya_scu /opt/llvm/lib/libc++.so.1 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /opt/llvm/lib/libc++abi.so.1 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /usr/lib64/libglut.so.3 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /usr/lib64/libGL.so.1 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /usr/lib64/libGLU.so.1 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /usr/lib64/libICE.so.6 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /usr/lib64/libX11.so.6 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /usr/lib64/libXext.so.6 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /usr/lib64/libXxf86vm.so.1 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /usr/lib64/libXi.so.6 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /usr/lib64/libGLX.so.0 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /usr/lib64/libGLdispatch.so.0 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /usr/lib64/libxcb.so.1 scu:~/test_payload/build/bin/
scp -i /home/puya/.ssh/rsa_keys/puya_scu /usr/lib64/libXau.so.6 scu:~/test_payload/build/bin/

ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "mkdir -p ~/test_payload/build/payload-configs/cfg/"
scp -i /home/puya/.ssh/rsa_keys/puya_scu payload-configs/cfg/config_src.json scu:~/test_payload/build/payload-configs/cfg/config_src.json
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "mkdir -p ~/dev/payload_data/"
scp -i /home/puya/.ssh/rsa_keys/puya_scu ../payload_data/Liebherr_R996B_PLM_2019.09.14_11.33.03_dynamiccalib.csv.gz scu:~/dev/payload_data/Liebherr_R996B_PLM_2019.09.14_11.33.03_dynamiccalib.csv.gz
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "mkdir -p ~/test_payload/build/payload-calibration-data/tests/data/"
scp -i /home/puya/.ssh/rsa_keys/puya_scu payload-calibration-data/tests/data/static_calibration_sample.json scu:~/test_payload/build/payload-calibration-data/tests/data/static_calibration_sample.json
# ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "ln -sf ~/test_payload/build/bin/libc++.so.1.0 ~/test_payload/build/bin/libc++.so.1"
# ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "ln -sf ~/test_payload/build/bin/libc++abi.so.1.0 ~/test_payload/build/bin/libc++abi.so.1"
# ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "ln -sf ~/test_payload/build/bin/libglut.so.3.10.0 ~/test_payload/build/bin/libglut.so.3"
# ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "ln -sf ~/test_payload/build/bin/libGL.so.1.7.0 ~/test_payload/build/bin/libGL.so.1"
# ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "ln -sf ~/test_payload/build/bin/libGLU.so.1.3.1 ~/test_payload/build/bin/libGLU.so.1"
# ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "ln -sf ~/test_payload/build/bin/libICE.so.6.3.0 ~/test_payload/build/bin/libICE.so.6"
# ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "ln -sf ~/test_payload/build/bin/libX11.so.6.3.0 ~/test_payload/build/bin/libX11.so.6"
# ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "mkdir -p ~/test_payload/core-sensors/tests/data/"
# scp -i /home/puya/.ssh/rsa_keys/puya_scu core-sensors/tests/data/* scu:~/test_payload/core-sensors/tests/data/

# scp -i /home/puya/.ssh/rsa_keys/puya_laptop package/payload-* laptop:~
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "rm -rf ~/test_payload"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "rmdir ~/temp_payload"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "mkdir ~/temp_payload"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "tar -xvf ~/payload-* --directory ~/temp_payload"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "rm ~/payload-*.tar.gz"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "mkdir -p ~/test_payload/build"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "mv ~/temp_payload/payload-* ~/test_payload/build/bin"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "rmdir ~/temp_payload"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "mkdir -p ~/test_payload/core-sensors/tests/data/"
# scp -i /home/puya/.ssh/rsa_keys/puya_laptop core-sensors/tests/data/* laptop:~/test_payload/core-sensors/tests/data/