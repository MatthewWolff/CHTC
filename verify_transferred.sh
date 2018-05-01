#!/bin/bash
for f in `ls -Sr1 *fasta.tgz`; do
  checksum=$(grep $f checksums.txt | cut -d" " -f4) # grab our file's checksum
  curr_checksum=$(md5sum $f | cut -d" " -f1)  # calculate transferred file's checksum
  [ "$checksum" = "$curr_checksum" ] && echo "$f successfully transferred" >> validation.txt || echo "$f has been corrupted by transfer" >> vcorrupt.txt # compare
done
