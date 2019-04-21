#!/bin/bash -e

CURRENT=`pwd`

# protection for the "DIR=$( ).." line below:
if [ "$BASH" != "/bin/bash" ]
then
    echo "BASH is not /bin/bash - either use ./push-s3.sh  or bash push-s3.sh"
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

WWW=${DIR}/../www

if [ -f "$WWW" ]
then
    echo "Not a directory: $WWW"
    exit 1
fi

cd $WWW

aws s3 sync --profile admins3 . s3://www.timtiemens.com --exclude "*~"


