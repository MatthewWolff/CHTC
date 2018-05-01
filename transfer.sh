#!/bin/bash
for i in `ls -Sr1 *.tgz`; do
  if grep -q "$i" /Volumes/mcmahonlab/home/mwolff3/progress.out; then
    echo "already processed $i"
  else
    sshpass -f ~/clearance scp $i mwolff3@transfer.chtc.wisc.edu:/mnt/gluster/mwolff3 && echo "$i transferred" >> /Volumes/mcmahonlab/home/mwolff3/progress.out
  fi
done
exit 0
