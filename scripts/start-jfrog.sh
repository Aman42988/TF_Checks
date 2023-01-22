#!/bin/bash

container_name='artifactory'

if [[ "$( docker inspect -f '{{.State.Running}}' ${container_name} )" == "false" ]]; then
    docker ps -a
    docker start $(docker ps -a -q -f status=exited)

else
	echo "Docker started"
fi
