#!/bin/bash

echo "Install needed ruby modules"

gem install colorize json ipaddress 

echo "Move startscript"

cp gnm /usr/local/bin/gnm && chmod a+x /usr/local/bin/gnm

echo "Copy files"

rm -rf /usr/local/Ganymed
rsync -az --exclude .git ../Ganymed/ /usr/local/Ganymed


echo "Init git repo for update"

cd /usr/local/Ganymed && git init && git remote add origin https://github.com/NE4Y/Ganymed

echo "Installation complete"

