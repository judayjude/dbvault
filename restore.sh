#!/bin/sh -e

THISDIR=$(dirname $0)
source ${THISDIR}/config.sh

DBNAME=$1
TAG=$2
INTODB=$3
if [[ -z "$INTODB" ]] ; then
    INTODB=$DBNAME
fi
LASTBAK=`ls -1 -r ${BAKDIR}/${DBNAME}.1*${TAG}.sql* | head -1`
echo "Attempting restore from: ${LASTBAK}"
$MYSQLCMD --user=root -e "drop database if exists $INTODB"
$MYSQLCMD --user=root -e "create database $INTODB"
${ZCATCMD} ${LASTBAK} | $MYSQLCMD --user=root ${INTODB}
