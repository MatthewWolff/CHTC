#!/bin/bash
# decompress all fasta files in parallel
for f in `ls -Sr1 /mnt/gluster/mwolff3/*fasta.tgz`; do
  tar -xzf /mnt/gluster/mwolff3/$f &
done
wait && echo "decompression successful"

# remove the compressed versions
rm -f *fasta.tgz && echo "removal of compressed files successful"

# compress output into an archive in Gluster, removing from current
tar --remove-files -czf /mnt/gluster/mwolff3/metaGenomes.tar.gz *fasta && echo "tarring successful" && ls
