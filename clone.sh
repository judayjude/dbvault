#!/bin/sh -e

THISDIR=$(dirname $0)
source ${THISDIR}/config.sh

SOURCEDB=$1
TARGETDB=$2
TAG=$3
LASTBAK=`ls -1 -r ${BAKDIR}/${SOURCEDB}.1*${TAG}.sql* | head -1`
echo "Attempting restore from: ${LASTBAK}"
echo "Cloning over: ${TARGETDB}"
$MYSQLCMD --user=root -e "drop database if exists $TARGETDB"
$MYSQLCMD --user=root -e "create database $TARGETDB"
${ZCATCMD} ${LASTBAK} | sed "s/$SOURCEDB/$TARGETDB/g" | $MYSQLCMD --user=root ${TARGETDB}
