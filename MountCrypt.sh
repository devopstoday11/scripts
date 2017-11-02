#!/bin/bash

exec nohup sshfs kexik@lith:/home/crypt  /mnt/crypt/ &>/dev/null &
