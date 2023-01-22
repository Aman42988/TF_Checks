#!/bin/bash

# Check if Terrascan is installed
if ! [ -x "$(command -v terrascan)" ]; then
  echo 'Error: Terrascan is not installed.'
  curl -L "$(curl -s https://api.github.com/repos/tenable/terrascan/releases/latest | grep -o -E "https://.+?_Linux_x86_64.tar.gz")" > terrascan.tar.gz
  tar -xf terrascan.tar.gz terrascan && rm terrascan.tar.gz
  sudo install terrascan /usr/local/bin && rm terrascan
  terrascan
else
  echo 'Terrascan is installed.'
  terrascan
fi
