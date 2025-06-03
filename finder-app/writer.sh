#!/bin/bash

writefile=$1
writestr=$2

if [[ $# -lt 2 ]]; then
    echo "One of the input prameters is missing..."
    exit 1
fi

dir_name=$(dirname "${writefile}")
mkdir -p "${dir_name}"

if [[ $? -eq 1 ]]; then
    echo "Error creating a directory"
    exit 1
fi

echo "${writestr}" > "${writefile}" 
if [[ $? -eq 1 ]]; then
    echo "Error creating a file"
    exit 1
fi