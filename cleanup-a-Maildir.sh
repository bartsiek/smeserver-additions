# cleanup Maildir for a user
# Needs username...
userdir = $1
numdays = ${2:-180}
[ x"$userdir" = "x" ] && (echo "ERROR: specify a username" ; exit) 
for file in `find /home/$userdir/Maildir -mtime +${numdays} | grep -E '/cur/|/new/'`; do { rm -fv $file; }; done
