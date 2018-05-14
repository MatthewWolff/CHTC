# Personal stuff
Commands/scripts I make use of to speed up tasks. `aliases.sh` shouldn't actually be run, but copied and pasted into your .bashrc file.  
The other two scripts I stuck into my `bin/`, removed their file extensions so that they would *look like commands* and then added a 
command to my .bashrc to export the path so that they would be accessible from anywhere.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Example export: `export PATH=$PATH:/home/$USER/libraries/bin` (as that's where I was keeping my bin) 
&nbsp;  
&nbsp;  
Files:
* `aliases.sh`: contains functions and aliases I use on the CHTC server to speed up tasks. A run-thru of the ones I mainly use:
  * `mkjob <job name, no .sub>` Supply the name of the script that it's supposed to run. I've been pretty consistent with naming 
  jobs and their respective scripts the same, differing only in file extension. Check inside `aliases.sh` for more info. 
  * `q` this will check the condor queue for all user jobs and their IDs
  * `crm <job id(s)>` supply job ID(s) for removeal
  * `s` lists the entirety of the `submitted/` directory, sorted by time. Add `-c` flag to sort by time
  * `cerr`, `clog`, `cout` These all output the most recent file in their respective folders. Very useful for checking how the
  job with most recent changes is doing. Note that submitting a job will always place it on top for `clog`, but `cerr` and `cout`
  may continue to show older jobs if the most recent job hasn't produced any output to the output streams
* `mailme.sh <message>` or `mailme <message>`: Emails a specified email address. I've only experimented with this a bit, but it does work. 
  * The key to using it is setting up a file to with a while loop that continuously checks
  * example: write a script called `check.sh` that continuously checks a condition (maybe throw in a `sleep 60`) so that it
  doesn't run more frequently than reasonable.
    * add `mailme.sh` and your message 
    * run `nohup ./check.sh & disown` to activate this is seemingly necessary so that it disconnects the job from your current session. and you can successully exit.
  Honestly not sure if it's necessary to use if you're not using zsh, but I haven't experimented in that regard.
* `transfer_tarball.sh <files>` or `transfer_tarball <files>`: Creates a tar file and immediately attempts to transfer it to Gluster storage. Very useful command once you know how it works.
  * Optionally name file using `-f`. By default, it will verbosely tar the files given into a files called "GlusterInput.tar.gz".
    * I have a folder called `tarball/` which contains: bbmap GlusterInput.tar.gz jdk-10_linux-x64_bin.tar.gz mapMetasVsRefs python.tar.gz samtools.tar.gz
    * When I'm prepping to do mapping, `cd` into `tarball/` and type `transfer_tarball *`, and it tars and transfers the files to Gluster storage.
  * If the tarball name that you specify already exists, it will determine if you want to overwrite or use it.
  In the case that you use it, it will transfer the file without tarring anything. You must still supply an argument for a file to tar, it seems.
  It's not used, but still necessary; because I don't really use `transfer_tarball` just to transfer, I haven't looked into this.
    * example: 
    ```
    > transfer_tarball -f myTar.tar.gz .
    File already exists: myTar.tar.gz
    >>> (c)ontinue instead with existing file, (o)verwrite, or (q)uit?
    ```
