#!/bin/bash

if [ -d problems ]; then
    cd problems
    echo "-- Updating problems directory"
    git pull --all --tags --force
else
    echo "-- Cloning problems directory"
    git clone git@github.com:rocher/Alice_Project_Euler_Problems problems
fi
