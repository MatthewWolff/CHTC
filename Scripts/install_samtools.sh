#!/bin/bash
git clone git://github.com/samtools/samtools.git
tar -xzf samtools.tar.gz
mv samtools samtools2 && mkdir samtools
cd samtools2
git clone https://github.com/samtools/htslib
autoheader     # If using configure, generate the header template...
autoconf       # ...and configure script (or use autoreconf to do both)
./configure --prefix=$(pwd)/../htslib --disable-lzma
make
make install
cd ..
autoreconf
./configure --prefix=$(pwd)/../samtools --disable-lzma
make
make install
tar -czf samtools.tar.gz
