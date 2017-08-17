# colors for output
SWITCH="\033["
NORMAL="${SWITCH}0m"
YELLOW="${SWITCH}1;33m"
RED="${SWITCH}1;31m"
GREEN="${SWITCH}1;32m"
BLUE="${SWITCH}1;34m"

if [ "$#" -ne 1 ]; then
  echo -e "${YELLOW}Usage${NORMAL}: ./FetchTagsSPMS.sh <branch>"
  echo -e "     ${BLUE}\$${NORMAL} ./FetchTagsSPMS.sh master"
  echo -e "     ${BLUE}\$${NORMAL} ./FetchTagsSPMS.sh lts/1.15"
else
  BRANCH=$1

  echo -e "${YELLOW}#App${NORMAL}"
  cd App
  git checkout $BRANCH
  git pull
  git remote update origin --prune
  git fetch --tags

  echo -e "${YELLOW}#Tags${NORMAL}"
  git tag
  cd ..
fi
