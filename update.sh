#!/bin/bash
echo "Check app/_config.php and ensure Database name is set,"
echo "otherwise, database will be created with SS_<foldername>";
DBNAMESET=0

confirm() {
  read -r -p "$1" response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    echo "Great! Proceeding with update..." > /dev/tty
    echo "-------------------------------------" > /dev/tty
    DBNAMESET=1
  else
    DBNAMESET=0
  fi
}

PROMPT="Is database name set in app/_config.php? [y/N/Dunno] "
confirm "$PROMPT"
while [  $DBNAMESET -lt 1  ]; do
  echo "Opening app/_config.php for editing..."
  nano app/_config.php
  confirm "$PROMPT"
done

composer update --prefer-dist
npm install 
grunt sass
grunt postcss
~/bin/a2restart.sh
/usr/bin/php74 vendor/silverstripe/framework/cli-script.php dev/build flush=1
git status

