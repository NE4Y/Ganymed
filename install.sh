#!/bin/bash

INSTALL_DIR=/usr/local

# check for need ruby modules
for MOD in colorize json ipaddress
do
	#T=false
	if  ! $(gem list $MOD -i);  then
		echo "Install ruby module $MOD"
		gem install $MOD
	fi
done
#gem install colorize json ipaddress 

echo "Test if installation dir is writeable"

if ! [ -w ${INSTALL_DIR} ]; then
  echo "${INSTALL_DIR} not writeable" && exit 1
fi
 
echo "Move startscript"

cp gnm ${INSTALL_DIR}/bin/gnm && chmod a+x ${INSTALL_DIR}/bin/gnm

echo "Copy files"

rm -rf ${INSTALL_DIR}/Ganymed
rsync -az --exclude .git ../Ganymed/ ${INSTALL_DIR}/Ganymed


echo "Init git repo for update"

cd ${INSTALL_DIR}/Ganymed && git init && git remote add origin https://github.com/NE4Y/Ganymed

echo "Installation complete"

