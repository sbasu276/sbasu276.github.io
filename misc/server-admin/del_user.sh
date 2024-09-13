#!/bin/bash

USERNAME=$1
GROUPNAME=devel
SCRATCH=/DATA/scratch

sudo pkill -u `id -u $USERNAME`
sudo deluser $USERNAME $GROUPNAME
sudo deluser --remove-home $USERNAME
sudo rm -r $SCRATCH/$USERNAME
sudo groupdel "$USERNAME"_home
sudo groupdel $USERNAME
