#!/bin/bash

FOLDER=$HOME/.config/lenovo-fan-control

rm -r $FOLDER

if ! type "$foobar_doas" > /dev/null; then
  Sudo=doas
else 
  Sudo=sudo
fi
$sudo su -c 'rm -r $FOLDER'
$Sudo systemctl disable --now lenovo-fancurve.service lenovo-fancurve-restart.path lenovo-fancurve-restart.service
$Sudo rm /etc/systemd/system/lenovo-fancurve.service /etc/systemd/system/lenovo-fancurve-restart.path /etc/systemd/system/lenovo-fancurve-battery-restart.path /etc/systemd/system/lenovo-fancurve-restart.service
$Sudo systemctl daemon-reload
$Sudo su -c 'rm /usr/local/bin/lenovo-legion-fan-service.py'