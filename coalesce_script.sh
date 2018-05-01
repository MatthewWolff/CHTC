#!/bin/bash
# decompress all fasta files in parallel
parallel --jobs 0 tar -xzf ::: /mnt/gluster/mwolff3/*fasta.tgz echo "decompression successful" # jobs 0 will run as many jobs in parallel as possible

# remove the compressed versions
parallel --jobs 0 rm -f ::: *fasta.tgz && echo "removal of compressed files successful"

# compress output into an archive in Gluster, removing from current
tar --remove-files -czf /mnt/gluster/mwolff3/metaGenomes.tar.gz *fasta && echo "tarring successful" && ls
