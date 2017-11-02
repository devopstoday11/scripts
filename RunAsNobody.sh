#!/bin/bash

sudo id > /dev/null

(

xhost +si:localuser:nobody &> /dev/null

sudo cp ~/.Xauthority /temp/
sudo chown nobody /temp/.Xauthority

sudo -u nobody "$@" 
#&>/temp/nobody.log

sudo rm /temp/.Xauthority

) &
