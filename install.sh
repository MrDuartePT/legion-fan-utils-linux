#!/bin/zsh

USER=$(whoami)

#fix service and python file
#sed -i "s/user_name/$USER/g" "service/lenovo-fancurve.service"

chmod +x profile_man.py

if ! type "$foobar_doas" > /dev/null; then
  Sudo=doas
else 
  Sudo=sudo
fi
$Sudo su -c 'mkdir -p /home/$USER/.config/lenovo-fan-control'
$Sudo su -c 'cp service/*.sh /home/$USER/.config/lenovo-fan-control/'
$Sudo su -c 'cp service/*.profile /home/$USER/.config/lenovo-fan-control/'
$Sudo su -c 'cp profile_man.py /usr/local/bin/lenovo-legion-fan-service.py'
$Sudo cp service/*.service /etc/systemd/system
$Sudo cp service/*.path /etc/systemd/system
$Sudo systemctl daemon-reload
$Sudo systemctl enable --now lenovo-fancurve.service 
$Sudo systemctl enable --now lenovo-fancurve-restart.path lenovo-fancurve-battery-restart.path lenovo-fancurve-restart.service

#repair install script after install
#sed -i "s/$USER/user_name/g" "service/lenovo-fancurve.service"