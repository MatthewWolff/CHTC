#!/bin/bash
for i in `ls -Sr1 *fasta.tgz`; do  # go through all of the fasta.tgz files from smallest to largest
  if grep -q "$i" /Volumes/mcmahonlab/home/mwolff3/checksums.txt; then # check if it's already been processed
    echo "already have checksum for $i"
  else
    checksum=$(md5 $i) # calculate checksum
    echo $checksum >> /Volumes/mcmahonlab/home/mwolff3/checksums.txt || echo "failed to write. entry is $checksum" # idk, weird errors happen. don't toss out the checksum, print it
  fi
done

