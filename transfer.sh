#!/bin/bash
files=($(ls -d *.tgz))
file_num=$(ls -1 *.tgz | wc -l)
#for ((i=0; i<$file_num; i+=1)) ; do
for i in `ls -Sr1 *.tgz`; do
  if grep -q "$i" /Volumes/mcmahonlab/home/mwolff3/progress.out; then
    echo "already processed $i"
  else
    sshpass -f ~/clearance scp $i mwolff3@transfer.chtc.wisc.edu:/mnt/gluster/mwolff3 && echo "$i transferred" >> /Volumes/mcmahonlab/home/mwolff3/progress.out
  fi
done
exit 0
