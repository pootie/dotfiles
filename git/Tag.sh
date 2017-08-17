# colors for output
SWITCH="\033["
NORMAL="${SWITCH}0m"
YELLOW="${SWITCH}1;33m"
RED="${SWITCH}1;31m"
GREEN="${SWITCH}1;32m"
BLUE="${SWITCH}1;34m"

if [ "$#" -ne 3 ]; then
  echo -e "${YELLOW}Usage${NORMAL}: ./Tag.sh <branch> <tag> <message>"
  echo -e "     ${BLUE}\$${NORMAL} ./Tag.sh master 1.15.0 'this is a commit message'"
  echo -e "     ${BLUE}\$${NORMAL} ./Tag.sh lts/1.15 1.15.7 'this is a commit message'"
else
  BRANCH=$1
  TAG=$2
  MSG=$3

  echo -e "${YELLOW}#App${NORMAL}"
  cd App
  git checkout $BRANCH
  git pull
  git tag -fa $TAG -m "$MSG"
  git push -f --tags
  git remote update origin --prune
  cd ..
fi
