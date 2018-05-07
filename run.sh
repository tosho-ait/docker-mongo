#!/bin/bash
set -m
 
cmd="mongod --storageEngine $STORAGE_ENGINE --rest"

if [ "$AUTH" == "yes" ]; then
    cmd="$cmd --auth"
fi
 
if [ "$JOURNALING" == "no" ]; then
    cmd="$cmd --nojournal"
fi
 
if [ "$OPLOG_SIZE" != "" ]; then
    cmd="$cmd --oplogSize $OPLOG_SIZE"
fi
 
$cmd &
 
if [ ! -f /data/db/.mongodb_password_set ]; then
    /set_mongodb_password.sh
fi
 
fg
