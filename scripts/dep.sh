#!/bin/bash
#
# Setup the the box. This runs as root
apt-get -y update
apt-get -y install curl htop iftop jq btrfs-tools ruby ruby-dev
# You can install anything you need here.
echo "installing docker"
curl -sSL https://get.docker.com/ | sh
echo "install docker - end"
