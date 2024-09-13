#!/bin/bash

USERNAME=$1
GROUPNAME=devel
SCRATCH=/DATA/scratch

sudo adduser $USERNAME
sudo groupadd "$USERNAME"_home
sudo usermod -aG $GROUPNAME $USERNAME
sudo usermod -aG "$USERNAME"_home $USERNAME

#sudo setfacl -Rm g:$GROUPNAME:x $SCRATCH
sudo mkdir -p $SCRATCH/$USERNAME
sudo setfacl -m $USERNAME:rwx $SCRATCH/$USERNAME/
sudo chown -R $USERNAME:$USERNAME $SCRATCH/$USERNAME/

cd /home/$USERNAME
sudo ln -s $SCRATCH/$USERNAME scratch
sudo chown -R $USERNAME:$USERNAME scratch

cd /home
sudo chgrp "$USERNAME"_home /home/$USERNAME
sudo chmod g+s /home/$USERNAME
sudo setquota -g "$USERNAME"_home 35G 50G 0 0 /home 
sudo setquota -u $USERNAME 0 0 0 0 /home
sudo setquota -g $USERNAME 0 0 0 0 /home

sudo setfacl -Rm g:$USERNAME:r /home/$USERNAME/
