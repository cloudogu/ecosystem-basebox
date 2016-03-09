#!/bin/bash
echo "check packages"

if [ -f "$INSTALL_HOME/install/debconf-set-selections" ]; then
  while read SEL; do
    echo $SEL | /usr/bin/debconf-set-selections
  done < $INSTALL_HOME/install/debconf-set-selections
fi

ALL=$(dpkg -l | awk '{print $2}')
NEWPKGS="htop iftop jq btrfs-tools ruby ruby-dev"

INSTALL=0
for PKG in $NEWPKGS; do
  echo $ALL | grep "$PKG"
  if [ $? = 0 ]; then
    echo "package $PKG is already installed"
  else
    INSTALL=1
  fi
done

if [ $INSTALL != 0 ]; then
  echo "installing $NEWPKGS"
  apt-get update
  apt-get install -yy \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" $NEWPKGS
else
  echo "all packages already installed"
fi

echo "check packages - end"
