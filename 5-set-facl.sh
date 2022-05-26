#!/bin/bash
mkdir -p /data/

# set owner
setfacl -dk /data/
setfacl -R -d -m g:adm:rwx /data/
setfacl -R -d -m g:google-sudoers:rwx /data/
setfacl -R -d -m o::r-x /data/
setfacl -R -m g:adm:rwx /data/
setfacl -R -m g:google-sudoers:rwx /data/
setfacl -R -m o::r-x /data/
chown -R $USER: $USER /data/
rm -rf /data/lost+found/

# clear history
history -c; exit
