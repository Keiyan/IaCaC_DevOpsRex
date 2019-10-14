#!/bin/bash

set -e

# wait if necessary
sleep $SLEEP_TIME

# replace task container name
mv /etc/tower/settings.py /etc/tower/settings.py.bak
cat /etc/tower/settings.py.bak | sed 's/CLUSTER_HOST_ID = ".*"/CLUSTER_HOST_ID = "'$TASK_NAME'"/g' > /etc/tower/settings.py

# Start the task
/usr/bin/launch_awx_task.sh
