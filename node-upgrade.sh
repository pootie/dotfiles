#!/bin/bash
# colors for output
SWITCH="\033["
NORMAL="${SWITCH}0m"
YELLOW="${SWITCH}1;33m"
RED="${SWITCH}1;31m"
GREEN="${SWITCH}1;32m"
BLUE="${SWITCH}1;34m"

if [ "$#" -lt 1 ]; then
  echo -e "${YELLOW}Usage${NORMAL}: ./node-upgrade.sh <new-version>
  echo -e "  ${BLUE}  eg:${NORMAL}: ./node-upgrade.sh v6.11.2
else
  new_verion=$1
  timer_start=`date +%s`

  . ~/.nvm/nvm.sh

  echo -e "${YELLOW}#install-new-version${NORMAL} $new_verion"
  nvm install $new_verion
  nvm use $new_version
  nvm alias default $new_verion

  echo -e "${YELLOW}#install-npm-dependencies${NORMAL}"
  npm install -g npm
  rm -rf ~/.pm2/
  npm install -g pm2 npm-check-updates node-gyp nodemon cpy-cli http-server cloc sloc mocha chai istanbul flow-bin eslint eslint-watch gulp gulp-cli webpack-dev-server 0x autocannon
  pm2 list
  pm2 install pm2-logrotate

  echo -e "${YELLOW}#too-uninstall-old-version${NORMAL} run: nvm uninstall vx.xx.x"

  timer_end=`date +%s`
  timer_total=$((timer_end-timer_start))
  echo -e "${GREEN}#total-time${NORMAL} $(($timer_total / 60)) minute(s) $(($timer_total % 60)) second(s)"
fi
