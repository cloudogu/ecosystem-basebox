#!/bin/bash
echo "importing apt keys"
# docker repository key
  FINGERPRINT="58118E89F3A912897C070ADBF76221572C52609D"
  apt-key finger | grep fingerprint | awk -F '=' '{print $2}' | sed -e 's/ //g' | grep "$FINGERPRINT" &>/dev/null
  if [ $? = 0 ]; then
    echo "key with fingerprint $FINGERPRINT is already installed"
  else
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$FINGERPRINT"
  fi
echo "importing apt keys - end"
