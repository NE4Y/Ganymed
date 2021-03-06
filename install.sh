#!/bin/bash

INSTALL_DIR=/usr/local

# Color output
NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'

# check for need ruby modules
echo "Checking ruby modules"
for MOD in colorize json ipaddress timeout
do
	#T=false
	if  ! $(gem list $MOD -i);  then
		echo -e "${YELLOW}[info] ${NC} Install ruby module $MOD"
		gem install $MOD
	else
		echo -e "${GREEN}[ok] ${NC} ruby module $MOD exists"
	fi
done
#gem install colorize json ipaddress 

echo "Test if installation dir is writeable"

if ! [ -w ${INSTALL_DIR} ]; then
  echo -e "${RED}[error] ${NC} ${INSTALL_DIR} not writeable" && exit 1
else
  echo -e "${GREEN}[ok] ${NC} ${INSTALL_DIR} is writeable"
fi
 
echo "Link startscript"

rm ${INSTALL_DIR}/bin/gnm > /dev/null
ln -s ${INSTALL_DIR}/Ganymed/gnm ${INSTALL_DIR}/bin/gnm && echo -e "${GREEN}[ok] ${NC} Startscript linked"

echo "Copy files"

rm -rf ${INSTALL_DIR}/Ganymed > /dev/null
rsync -az --exclude .git ../Ganymed/ ${INSTALL_DIR}/Ganymed

echo -e "${GREEN}[ok] ${NC} Files copied"

echo "Init git repo for update"

cd ${INSTALL_DIR}/Ganymed && git init && git remote add origin https://github.com/NE4Y/Ganymed

echo "Installation complete"

