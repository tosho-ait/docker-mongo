#!/bin/bash
set -m
 
mongodb_cmd="mongod --storageEngine $STORAGE_ENGINE --config /etc/mongodb.conf --smallfiles --bind_ip_all"
#cmd="$mongodb_cmd --httpinterface --rest --master"
cmd="$mongodb_cmd --master"

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
 
if [ ! -f /data/db2/.mongodb_password_set ]; then
    /set_mongodb_password.sh
fi
 
fg
