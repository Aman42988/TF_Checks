#!/bin/bash

DIR="/opt/jfrog"
if [ -d "$DIR" ]; then
     echo "Jfrog is installed successfully"
else
    export JFROG_HOME=/opt/jfrog
    sudo mkdir -p $JFROG_HOME/artifactory/var/etc/
    cd $JFROG_HOME/artifactory/var/etc/
    sudo touch ./system.yaml
    sudo chown -R 1030:1030 $JFROG_HOME/artifactory/var
    sudo chmod -R 777 $JFROG_HOME/artifactory/var
    docker run --name artifactory -v $JFROG_HOME/artifactory/var/:/var/opt/jfrog/artifactory -d -p 8081:8081 -p 8082:8082 releases-docker.jfrog.io/jfrog/artifactory-oss:latest
fi
