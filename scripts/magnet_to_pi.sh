#!/bin/bash
REMOTE='192.168.0.102'
USER='pi'
PASS='raspberry'
sshpass -p $PASS ssh $USER@$REMOTE  "sudo /usr/bin/transmission-remote --add \"$1\""
