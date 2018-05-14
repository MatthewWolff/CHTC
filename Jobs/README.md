# Jobs for CHTC server
These are jobs straight from my CHTC profile. I run them using an alias, i.e. `cs jobs/<job name>`
* `coalesce.sub` exactly as in the metagenome prep file. See there for usage
* `eval_fasta_length.sub` this job relies on the fact that all the fasta.tgz files are stored on gluster
independently - attempts to use the massive coalesced files weren't very succcessful, and this seemed to be easier.
  * this job moves each fasta.tgz from Gluster to the working directory, then untar's it and outputs its file length in lines to a file
  * creates `file_info.txt` in Gluster (can be checked as the job runs)
* `interactive.sub` submits a request for an interaction session (1GB of Disk and Memory requested)
  * Usage: `cs -i jobs/interactive.sub`
* `mapping.sub` runs the entire mapping process
  * requests 10 CPUs and 160GB of memory *and* disk (this can probably be optimized, but I didn't fool around with it 
  as it often took 12 hours+ to get through the queue with a request this large. A request of 10GB disk failed.)
  * returns `mapping_results.tar.gz` (for 2 .ref files, was ~5.2GB). Use `tar -xzf mapping_results.tar.gz coverage.txt` to extract only coverage.txt
  * **requires that `metagenomes.tar.gz` and `refGenomes.tar.gz` are present in Gluster**
* `template.sub` a template job that is referenced by `mkjob` (reference [/Convenience/aliases.sh](https://github.com/MatthewWolff/CHTC/blob/master/Convenience/aliases.sh) for more information)
  * modify as desired - default disk and memory request is 10GB
