#!/bin/bash

if [ -z ${PACKAGES} ]; then
  echo 'no ENV var of PACKAGES present'
  exit 1
else
  echo 'installing packages'
  apt-get update
  IFS=',' read -ra INSTALL_PACKAGES <<< $PACKAGES
  for i in "${INSTALL_PACKAGES[@]}"; do
    echo $i
    apt-get install -y $i
  done
  echo 'installing Gems'
  bundle install
  echo 'listing installed packages:'
  dpkg --get-selections
fi
