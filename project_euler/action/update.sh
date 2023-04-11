#!/bin/bash

set -o errexit

CWD=$(dirname $(realpath $0))

# Update problems
if [ -d problems ]; then
    cd problems
    echo -e "\n-- Updating problems directory"
    git pull --all --tags --force
else
    echo -e "\n-- Cloning problems directory"
    git clone git@github.com:rocher/Alice_Project_Euler_Problems problems
fi

# Update participant repositories
USR=$(realpath ${CWD}/../usr/)
for repo in $(find ${USR} -mindepth 1 -maxdepth 1 -type d); do
    cd $repo >/dev/null 2>&1
    echo -e "\n-- Updating repository usr/$(basename $repo)"
    git pull --all --tags --force
    cd - >/dev/null 2>&1
done
