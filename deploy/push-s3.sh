#!/bin/bash

CURRENT=`pwd`

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

WWW=${DIR}/../www

if [ -f "$WWW" ]
then
    echo "Not a directory: $WWW"
    exit 1
fi


cd $WWW
aws s3 sync --profile admins3 . s3://www.timtiemens.com --exclude "*~"


