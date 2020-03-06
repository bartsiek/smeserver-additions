#!/bin/bash
# cleanup Maildir for a user
# Needs: username...
# Optional: number of days to keep (default: keep a year)
USERDIR=$1
NUMDAYS=${2:-365}

# check arguments
if [ $# -lt 1 ] ; then
        echo "illegal number of parameters - specify at least a username"
        exit
fi
# need some additional checking - l8ter... :) - maybe alike: cd $(getent passwd $USER/USERDIR | cut -d: -f6)

eval cd ~$USERDIR
for file in `find Maildir -mtime +${NUMDAYS} | grep -E '/cur/|/new/'`; do { rm -fv $file; }; done

