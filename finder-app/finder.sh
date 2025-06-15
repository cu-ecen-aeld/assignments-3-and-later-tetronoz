#!/bin/bash

filesdir=$1
searchstr=$2

if [ $# -lt 2 ]; then
    echo "One of the input prameters is missing..."
    exit 1
fi

if [ ! -d "${filesdir}" ]; then
    echo "${filesdir} directory doesn't exist..."
    exit 1
fi

number_of_files=$(find "${filesdir}" -type f | wc -l)
number_of_lines=$(grep -R "${searchstr}" "${filesdir}" | wc -l)

echo "The number of files are ${number_of_files} and the number of matching lines are ${number_of_lines}" 