# colors for output
SWITCH="\033["
NORMAL="${SWITCH}0m"
YELLOW="${SWITCH}1;33m"
RED="${SWITCH}1;31m"
GREEN="${SWITCH}1;32m"
BLUE="${SWITCH}1;34m"

echo -e "${YELLOW}#App repo${NORMAL}"
cd App/ 
git pull >/dev/null
git remote update origin --prune >/dev/null
git fetch --tags >/dev/null
# git branch -a | grep -v "develop\|HEAD\|master\|lts/\|rc/"
git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n | grep -v "develop\|HEAD\|master\|lts/\|rc/\|tags/"
cd ..
echo -e ""
