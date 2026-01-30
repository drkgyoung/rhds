#!/bin/bash

# set -e

source config.env

mkdir -p $datadir
mkdir -p $resultsdir

# for loop line by line in data/files.csv
# Skip the first line
{
    read
    while IFS=, read -r url filename date time size
    do
        echo "Downloading $filename from $url"
        curl -L $url/$filename -o $datadir/$filename
    done
} < files.csv
