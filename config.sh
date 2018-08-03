#!/bin/bash

BAKDIR="$(dirname $0)/snapshots"
MYSQLCMD="mysql"
DUMPCMD="mysqldump"
ZIPCMD="gzip"
ZCATCMD="gunzip -c"

# verify backup dir
if [ ! -d "$BAKDIR" ] ; then echo "$BAKDIR is not a valid backup directory" ; exit 1 ; fi

# verify mysql commands
$MYSQLCMD --version 1>/dev/null 2>/dev/null || (echo 'mysql command is not valid' && exit 2)
$DUMPCMD  --version 1>/dev/null 2>/dev/null || (echo 'mysqldump command is not valid' && exit 2)

# verify zip commands
$ZIPCMD -V 1>/dev/null 2>/dev/null || (echo 'zip command is not valid' && exit 2)
$ZCATCMD -V 1>/dev/null 2>/dev/null || (echo 'zcat command is not valid' && exit 2)
