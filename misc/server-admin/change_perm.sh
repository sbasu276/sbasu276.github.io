#!/bin/bash

list=`members devel`
for user in $list
do
	cd /home/$user
	sudo chown -R $user:"$user"_home $(ls | awk '{if($1 != "scratch"){ print $1 }}')
done
