#!/bin/bash

echo "Install needed ruby modules"

gem install colorize json ipaddress 

echo "Init git repo for update"

git init && git remote add origin https://github.com/NE4Y/Ganymed

echo "Move startscript"

cp gnm /usr/local/bin/gnm && chmod a+x /usr/local/bin/gnm

echo "Copy files"

cp -R ../Ganymed /usr/local/ 2> /dev/null
