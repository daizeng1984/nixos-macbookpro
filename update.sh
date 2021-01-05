#!/bin/sh

basedir=$(cd $(dirname $0) ; pwd)
cat $basedir/$1 > $basedir/configuration.nix 
sudo [ -f /etc/nixos/configuration.nix ] && ( cat /etc/nixos/configuration.nix > /tmp/configuration.nix.$(date '+%Y-%m-%d-%H-%M-%S').bak )
sudo rsync --progress --partial --recursive --exclude LICENSE --exclude README.md --exclude $(basename $0) $basedir/* /etc/nixos
rm $basedir/configuration.nix
