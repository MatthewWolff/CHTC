#!/bin/bash
for i in `ls -Sr1 *.tgz`; do # transfer all of the tgz files in current directory to gluster
  if grep -q "$i" /Volumes/mcmahonlab/home/mwolff3/processed.txt; then
    echo "already processed $i"
  else
    sshpass -f ~/clearance scp $i mwolff3@transfer.chtc.wisc.edu:/mnt/gluster/mwolff3 && echo "$i transferred" >> /Volumes/mcmahonlab/home/mwolff3/processed.txt
  fi
done
exit 0
