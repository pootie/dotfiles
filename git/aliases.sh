#!/bin/bash

# setup
# git config --global user.name "Chris Grgich-Tran"
# git config --global user.email chris@grgichtran.com

# pretty git logs
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# log tags
git config --global alias.lgt "log --color --tags --simplify-by-decoration --pretty='format:-%C(yellow)%ai%Creset %d'"
# conflicts
git config --global alias.conflicts "diff --color --name-only --diff-filter=U"

