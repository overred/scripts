#!/bin/bash

user=${TUN_SSH_USER}
ip=${TUN_SSH_IP}
pass=${TUN_SSH_PASS}
port=${TUN_SSH_PORT:-22}

remote_ip=${TUN_REMOTE_IP:-localhost}
remote_port=${TUN_REMOTE_PORT:-80}
local_ip=${TUN_LOCAL_IP:-localhost}
local_port=${TUN_LOCAL_PORT:-80}

while true
do
    sshpass -p "$pass" ssh -o StrictHostKeyChecking=no -R $remote_ip:$remote_port:$local_ip:$local_port -N -p $port $user@$ip
    echo "$(date) > restoring ssh tunnel ..."
    sleep 1
done
