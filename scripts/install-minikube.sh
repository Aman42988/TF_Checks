#!/bin/bash

minikube version &> /dev/null
if [ $? -eq 0 ]; then
     echo "minikube is installed"
     minikube version
else
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    minikube start --driver=docker
fi

