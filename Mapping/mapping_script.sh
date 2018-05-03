#!/bin/bash
date
# untar input files
tar -xzf /mnt/gluster/mwolff3/GlusterInput.tar.gz && echo "untarred input" && echo # un-tar from gluster to current directory
# untar Java installation
tar -xzf jdk-10_linux-x64_bin.tar.gz && echo "untarred java" && echo
export PATH=$(pwd)/jdk-10/bin:$PATH
export JAVA_HOME=$(pwd)/jdk-10
# untar and install your Python installation
tar -xzf python.tar.gz && echo "untarred python" && echo
export PATH=$(pwd)/python/bin:$PATH
mkdir home
export HOME=$(pwd)/home
# samtools
tar -xzf samtools.tar.gz && echo "untarred samtools" || echo "FAILED — untarring samtools"; echo
export PATH=$(pwd)/samtools/bin:$PATH

# transfer the metagenomes from Gluster into the metagenomes folder
cd mapMetasVsRefs && ls
./setup.sh
tar -xzf /mnt/gluster/mwolff3/metagenomes.tar.gz -C metagenomes/ && echo "extracted metagenomes"
tar -xzf /mnt/gluster/mwolff3/refGenomes.tar.gz -C refGenomes/ && echo "extracted refGenomes"

echo "beginning mapping..."
./scripts/runAll.sh
echo "mapping complete." && echo && ls -R && echo
# compress output into an archive in Gluster, removing from current
# tar -czf /mnt/gluster/mwolff3/mapping_results.tar.gz mappingResults/ *.txt # --remove-files # outputs to gluster
tar --remove-files -czf ../mapping_results.tar.gz mappingResults/ *.txt # outputs to home directory

rm ../jdk-10_linux-x64_bin.tar.gz ../python.tar.gz ../samtools.tar.gz # remove these tarballs so they don't end up as output
make clean
