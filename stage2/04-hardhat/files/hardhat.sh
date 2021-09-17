#!/bin/sh

raspi-gpio set 19 pd

if raspi-gpio get 19 | grep -Po "level=1"; then
    if cat /boot/cmdline.txt | grep "console=serial0"; then
        sed -i 's/console=serial0/console=serial1/g' /boot/cmdline.txt
        reboot now
    fi
    python3 /root/pah.py
else
    if cat /boot/cmdline.txt | grep "console=serial1"; then
        sed -i 's/console=serial1/console=serial0/g' /boot/cmdline.txt
        reboot now
    fi
fi