alias h='condor_q -held'  # check held jobs
alias q='condor_q'  # check job queue
alias glust='ssh mwolff3@transfer.chtc.wisc.edu'  # connect to gluster
alias clearout='rm -rf /home/mwolff3/submitted/errs/*;
                rm -rf /home/mwolff3/submitted/logs/*;
                rm -rf /home/mwolff3/submitted/output/*'  # clean out log files (doesn't work?)
alias crm='condor_rm'  # remove a condor job
alias cs='condor_submit'  # submit a condor job 
alias s='ls -R submitted'  # check all logs
alias cerr='cd /home/mwolff3/submitted/errs/ && ls -t | head -1 | xargs cat && cd -'  # check most recent err log
alias clog='cd /home/mwolff3/submitted/logs/ && ls -t | head -1 | xargs cat && cd -'  # check most recent log log
alias cout='cd /home/mwolff3/submitted/output/ && ls -t | head -1 | xargs cat && cd -'  # check most recent output log
# unpack most recent results from mapping job
alias t='[ -f "$HOME/mapping_results.tar.gz" ] && rm -rf $HOME/results/ && mkdir $HOME/results && tar -xzf $HOME/mapping_results.tar.gz -C $HOME/results/ && rm $HOME/mapping_results.tar.gz && cd $HOME/results || echo "Error: mapping_results.tar.gz is not present"' 
