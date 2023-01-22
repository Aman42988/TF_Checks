#!/bin/bash

# Check if Trivy is installed
if ! [ -x "$(command -v trivy)" ]; then
  echo 'Error: Trivy is not installed.'
  wget https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.deb
  sudo dpkg -i trivy_0.18.3_Linux-64bit.deb
else
  echo 'Trivy is installed.'
fi
