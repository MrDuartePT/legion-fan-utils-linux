#!/bin/bash

FOLDER_OLD=$HOME/.config/lenovo-fan-control

rm -r $FOLDER_OLD

if ! type "$foobar_doas" &> /dev/null; then
  sudo=doas
else 
  sudo=sudo
fi

$sudo su -c 'rm -r $HOME/.config/lenovo-fan-control'
$sudo su -c 'rm -r /etc/lenovo-fan-control'
$sudo systemctl disable --now lenovo-fancurve.service lenovo-fancurve-restart.path lenovo-fancurve-restart.service
$sudo rm /etc/systemd/system/lenovo-fancurve.service /etc/systemd/system/lenovo-fancurve-restart.path /etc/systemd/system/lenovo-fancurve-battery-restart.path /etc/systemd/system/lenovo-fancurve-restart.service
$sudo systemctl daemon-reload
$sudo su -c 'rm /usr/local/bin/lenovo-legion-fan-service.py'