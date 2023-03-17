#!/bin/bash -ex
# Start script for Rimworld called from docker

URL=`curl https://github.com/TastyLollipop/OpenWorld/releases|grep LinuxX64|head -1|awk -F\" '{print $2}'`
RemoteVersion=`printf ${URL}|awk -F/ '{print $6}'`
containerIP=`hostname -i`

cd /rimworld
# Does version exist?
#if [ ! -f "version.txt" ]
#then
#	printf "1.0.1\n" > version.txt
#fi
#LocalVersion=`cat version.txt`

# Pull if not updated
if [ ${RemoteVersion} != ${LocalVersion} ]
then
	#Pull new package
	wget  https://github.com/${URL}
	unzip -o LinuxX64.zip
	cd ..
	chmod 775 rimworld/ -R
	chown nobody rimworld/ -R
	chgrp users rimworld/ -R
	cd /rimworld
	#printf "${RemoteVersion}\n" > version.txt
fi

# Update config with IP
if [ -f "Server Settings.txt" ]
then
	sed -i "s/^Server Local IP:.*/Server Local IP: ${containerIP}/g" 'Server Settings.txt'
fi

# Run server
if [ `printf "${K8}\n"|tr '[:upper:]' '[:lower:]'` == "true" ] 
then
	# Non interactive
	./"OpenWorldServer" > Logs/`date +%m%d%Y-%H%M`.term.log
else	
	./"OpenWorldServer"
fi
