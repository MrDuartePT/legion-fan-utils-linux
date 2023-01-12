#!/bin/bash

FOLDER_OLD=$HOME/.config/lenovo-fan-control
FOLDER=/etc/lenovo-fan-control

#fix service and python file
sed -i "s@folder@$FOLDER@" "service/lenovo-fancurve.service"

chmod +x profile_man.py

if ! type "$foobar_doas" &> /dev/null; then
  sudo=doas
else 
  sudo=sudo
fi

$sudo su -c 'mkdir -p /etc/lenovo-fan-control'
$sudo su -c 'cp service/*.sh /etc/lenovo-fan-control'
$sudo su -c 'cp service/*.profile /etc/lenovo-fan-control'
$sudo su -c 'cp profile_man.py /usr/local/bin/lenovo-legion-fan-service.py'
$sudo cp service/*.service /etc/systemd/system
$sudo cp service/*.path /etc/systemd/system
$sudo systemctl daemon-reload
$sudo systemctl enable --now lenovo-fancurve.service 
$sudo systemctl enable --now lenovo-fancurve-restart.path lenovo-fancurve-battery-restart.path lenovo-fancurve-restart.service

#repair install script after install
sed -i "s@$FOLDER@folder@" "service/lenovo-fancurve.service"