#!/bin/bash
mkdir python
tar -xzf Python-2.7.14.tgz
cd Python-2.7.14
./configure --prefix=$(pwd)/../python
make
make install
cd ..
export PATH=$(pwd)/python/bin:$PATH 
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py

### INSTALL THESE MODULES
pip install pandas --no-build-isolation  # this flag shouldn't be needed but pip is being buggy... 4/17/2018

# clean up, compress into a python tarball
rm get-pip.py
tar -czvf python.tar.gz python/
exit
