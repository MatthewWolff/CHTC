# CHTC
* `checksums.sh` generates MD5 checksums for all compressed tar files in a directory >> `checksums.txt`
* `transfer.sh` transfers all compressed tar files in a directory to Gluster >> `processed.txt`
* `verify.sh` generates MD5 checksums for all compressed tar files in the Gluster directory, then verifies that they match with previously computed values. 1> `validation.txt` 2> `vcorrupt.txt`
* `coalesce_script.sh` extracts all Gluster files to a job and coalesces them into a large .tgz back in Glust
* python_tarring stuff is for creating custom python builds for condor jobs + the java stuff necessary to use `Samtools`
