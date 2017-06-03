#!/bin/bash

if [ -z ${PACKAGES} ]; then
  echo 'no ENV var of PACKAGES present'
  exit 1
else
  echo 'installing packages'
  apt-get update
  apt-get install -y ruby2.3 ruby2.3-dev
  IFS=',' read -ra INSTALL_PACKAGES <<< $PACKAGES
  for i in "${INSTALL_PACKAGES[@]}"; do
    echo $i
    apt-get install -y $i
  done
  echo 'installing Gems'
  gem install bundle
  bundle install
  echo 'listing installed packages:'
  dpkg --get-selections
fi
