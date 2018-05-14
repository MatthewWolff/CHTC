### FUNCTIONS
mkjob() # creates a job from the template.sub, replacing all necessary lines. The only changse that might need to be made is job requested space
{
  # typically I type up a script to do something, then do `mkjob <script name>` so that both files have the same name, except .sh and .sub
  # then i type `cs jobs/<job name>` for `condor_submit` to send it off to the queue (you can still add the -i flag if you want)
  cp $HOME/jobs/template.sub $HOME/jobs/"$1".sub
  sed -i "s/template/$1/" $HOME/jobs/"$1".sub
  echo "$1.sub made with a requested 10GB disk and 10GB memory!"
}

### ALIASES
alias h='condor_q -held'  # check held jobs
alias q='condor_q'  # check job queue
alias glust='ssh $USER@transfer.chtc.wisc.edu'  # connect to gluster
alias clearout='rm -rf /home/$USER/submitted/errs/*;
                rm -rf /home/$USER/submitted/logs/*;
                rm -rf /home/$USER/submitted/output/*'  # clean out log files (doesn't work?)
alias crm='condor_rm'  # remove a condor job
alias cs='condor_submit'  # submit a condor job 
alias s='ls -R submitted'  # check all logs
alias cerr='cd /home/$USER/submitted/errs/ && ls -t | head -1 | xargs cat && cd -'  # check most recent err log
alias clog='cd /home/$USER/submitted/logs/ && ls -t | head -1 | xargs cat && cd -'  # check most recent log log
alias cout='cd /home/$USER/submitted/output/ && ls -t | head -1 | xargs cat && cd -'  # check most recent output log
# unpack most recent results from mapping job
alias unpack='[ -f "$HOME/mapping_results.tar.gz" ] && rm -rf $HOME/results/ && mkdir $HOME/results && tar -xzf $HOME/mapping_results.tar.gz -C $HOME/results/ && rm $HOME/mapping_results.tar.gz && cd $HOME/results || echo "Error: mapping_results.tar.gz is not present"' 
