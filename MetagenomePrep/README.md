# CHTC
Most of these scripts were written to be run independently for the purpose of transferring files from the shared file drive to Gluster,
only `coalesce.*` are actually meant to be run on CHTC
* `checksums.sh` generates MD5 checksums for all compressed tar files in a directory. 
    * creates `checksums.txt` in mwolff3's home directory on shared drive **(please change filepath before running!)**
    * to be run on the shared drive in the folder with all the .fasta.tgz files
* `coalesce.sh` script for the job that extracts all Gluster files to a job and coalesces them into a large .tgz back in Glust
* `coalesce.sub` a job to submit for coalescing all files, i.e. `cs coalesce.sub`
* `transfer.sh` transfers all compressed tar files in a directory to Gluster. 
    * Creates `processed.txt`
* `verify_transferred.sh` generates MD5 checksums for all compressed tar files in the Gluster directory, then verifies 
that they match with previously computed values. 
    * Creates `validation.txt` for successfully validated files and `vcorrupt.txt`for corrupted files 
    (the "v" in front is simply so the files are created next to one another)
