#!/bin/sh

sudo ip addr add 192.168.7.1/24 dev enp0s20f0u2
sudo iptables -P FORWARD ACCEPT
sudo iptables -t nat -A POSTROUTING -o enp0s31f6 -j MASQUERADE

exec ssh pi
