#!/bin/bash

INSTALL_DIR = /usr/local
echo "Install needed ruby modules"

gem install colorize json ipaddress 

echo "Test if installation dir is writeable"

if [ -w ${INSTALL_DIR} ]; echo "${INSTALL_DIR} not writeable"; exit 1
echo "Move startscript"

cp gnm /usr/local/bin/gnm && chmod a+x /usr/local/bin/gnm

echo "Copy files"

rm -rf /usr/local/Ganymed
rsync -az --exclude .git ../Ganymed/ /usr/local/Ganymed


echo "Init git repo for update"

cd /usr/local/Ganymed && git init && git remote add origin https://github.com/NE4Y/Ganymed

echo "Installation complete"

