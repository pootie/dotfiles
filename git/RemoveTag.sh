# colors for output
SWITCH="\033["
NORMAL="${SWITCH}0m"
YELLOW="${SWITCH}1;33m"
RED="${SWITCH}1;31m"
GREEN="${SWITCH}1;32m"
BLUE="${SWITCH}1;34m"

if [ "$#" -ne 2 ]; then
  echo -e "${YELLOW}Usage${NORMAL}: ./RemoveTag.sh <branch> <tag>"
  echo -e "     ${BLUE}\$${NORMAL} ./RemoveTag.sh master 1.15.0"
  echo -e "     ${BLUE}\$${NORMAL} ./RemoveTag.sh lts/1.15 1.15.7"
else
  BRANCH=$1
  TAG=$2

  echo -e "${YELLOW}#App${NORMAL}"
  cd App
  git checkout $BRANCH
  git pull
  git tag -d $TAG
  git push origin :$TAG
  git remote update origin --prune
  git fetch --tags
  cd ..
fi
