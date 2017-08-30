# colors for output
SWITCH="\033["
NORMAL="${SWITCH}0m"
YELLOW="${SWITCH}1;33m"
RED="${SWITCH}1;31m"
GREEN="${SWITCH}1;32m"
BLUE="${SWITCH}1;34m"

if [ "$#" -ne 1 ]; then
  echo -e "${YELLOW}Usage${NORMAL}: ./docker-remove-images-byname.sh <grepname>"
  echo -e "     ${BLUE}\$${NORMAL} ./docker-remove-images-byname.sh ph-"
else
  GREPNAME=$1
  docker rmi $(docker images | grep "$GREPNAME" | awk "{print $3}")
fi
