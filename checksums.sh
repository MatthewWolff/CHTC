#!/bin/bash

for i in `ls -Sr1 *.tgz`; do
  if grep -q "$i" /Volumes/mcmahonlab/home/mwolff3/checksums.txt; then
    echo "already have checksum for $i"
  else
    checksum=$(md5 $i)
    echo $checksum >> /Volumes/mcmahonlab/home/mwolff3/checksums.txt || echo "failed to write. entry is $checksum"
  fi
done

