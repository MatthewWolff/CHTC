#!/bin/bash

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# default parameters
TAR_NAME="GlusterInput.tar.gz"
FILES=$*

# digest flags
while getopts ":f:" opt; do
  case $opt in
    f) # specify name of tarball file, else defaults to GlusterInput.tar.gz
      # validate name
      if ! [[ $OPTARG =~ ^[a-zA-Z0-9_\.]+$ ]]; then
        echo 'Invalid file name. Only alphanumerics and underscores are allowed.' >&2 # write to stderr
        exit 1
      fi
      # create a name with the proper extension by removing it if it already exists, then adding
      TAR_NAME="$(echo $* | grep -oP "(?<=-f ).+?(?= )"| sed -e "s/\.tar\.gz$//")".tar.gz # find the file name, then add proper extension
      FILES="$(echo $* | perl -pe 's/-f .+? //')"  # digest the -f flag
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# double check that tarball file doesn't already exist, then inform user
if [ -f "$TAR_NAME" ]; then
  echo "File already exists: $TAR_NAME." >&2
  echo ">>> (c)ontinue instead with existing file, (o)verwrite, or (q)uit?"
  read CHOICE
  case $CHOICE in
    o | "overwrite")
      echo "overwriting..."
      tar -czvf $TAR_NAME $FILES
      ;;
    c | "continue")
      echo "continuing with existing file..." 
      ;;
    q | "quit")
      echo "quitting..."
      exit 0
      ;;
    *)
      echo "invalid option. exiting." >&2
  esac
else
  echo "Creating tar file as $TAR_NAME..."
  tar -czvf $TAR_NAME $FILES
fi

# grab username
[ -z "$USR" ] && read -p "CHTC Username: " USR
#read -s -p "Password:" PASSWRD
#echo

# transfer the created tarball
scp $TAR_NAME $USR@transfer.chtc.wisc.edu:/mnt/gluster/$USR
# bye
exit 0
