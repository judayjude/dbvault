#!/bin/sh -e

THISDIR=$(dirname $0)
source ${THISDIR}/config.sh

makeFileName() {
    local DB=$1
    local TG=$2
    local DT=`date +%y%m%d.%H%M`
    if [[ -z $TG ]] ; then
        TG="last"
    fi
    echo "${DB}.${DT}.${TG}.sql"
}

DBNAME=$1
TAG=$2
BAKFILENAME=$(makeFileName $DBNAME $TAG)
BAKPATH="${BAKDIR}/${BAKFILENAME}"

$DUMPCMD --user=root $DBNAME > $BAKPATH
$ZIPCMD $BAKPATH
