#!/bin/bash
evaluate(){ echo "name: $1, size: $(stat $1 | grep -oP  '(?<=Size: )(\d+?)(?= )'), lines: $(cat $1 | wc -l)";}
for f in `ls /mnt/gluster/mwolff3/*.fasta.tgz`; do
  [[ $f = *"PUBG"* ]] && continue
  [[ $f = *"PUBN"* ]] && continue
  mkdir fasta
  tar -xzf $f -C fasta/
  evaluate fasta/* >> /mnt/gluster/mwolff3/file_info.txt
  rm -rf fasta
done  
