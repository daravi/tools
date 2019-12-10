#! /bin/bash

rm -rf ./package
mkdir ./package
./deploy.sh ./package

rm -rf build/data
mkdir -p build/data/core-sensors
cp core-sensors/tests/data/* build/data/core-sensors/

scp -i /home/puya/.ssh/rsa_keys/puya_scu package/corelibs-* scu:~
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "rm -rf ~/test_corelibs"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "rmdir ~/temp_corelib"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "mkdir ~/temp_corelib"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "tar -xvf ~/corelibs-* --directory ~/temp_corelib"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "rm ~/corelibs-*.tar.gz"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "mkdir -p ~/test_corelibs/build"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "mv ~/temp_corelib/corelibs-* ~/test_corelibs/build/bin"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "rmdir ~/temp_corelib"
ssh -i /home/puya/.ssh/rsa_keys/puya_scu scu "mkdir -p ~/test_corelibs/core-sensors/tests/data/"
scp -i /home/puya/.ssh/rsa_keys/puya_scu core-sensors/tests/data/* scu:~/test_corelibs/core-sensors/tests/data/

# scp -i /home/puya/.ssh/rsa_keys/puya_laptop package/corelibs-* laptop:~
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "rm -rf ~/test_corelibs"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "rmdir ~/temp_corelib"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "mkdir ~/temp_corelib"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "tar -xvf ~/corelibs-* --directory ~/temp_corelib"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "rm ~/corelibs-*.tar.gz"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "mkdir -p ~/test_corelibs/build"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "mv ~/temp_corelib/corelibs-* ~/test_corelibs/build/bin"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "rmdir ~/temp_corelib"
# ssh -i /home/puya/.ssh/rsa_keys/puya_laptop laptop "mkdir -p ~/test_corelibs/core-sensors/tests/data/"
# scp -i /home/puya/.ssh/rsa_keys/puya_laptop core-sensors/tests/data/* laptop:~/test_corelibs/core-sensors/tests/data/