#!/bin/bash
wlan0=`ip addr show dev wlan0 | grep "inet[^6]" | awk '{print $2}' | cut -d'/' -f1 2>/dev/null`
eth0=`ip addr show dev eth0| grep "inet[^6]" | awk '{print $2}' | cut -d'/' -f1 2>/dev/null`
eth1=`ip addr show dev eth1| grep "inet[^6]" | awk '{print $2}' | cut -d'/' -f1 2>/dev/null`
usb0=`ip addr show dev usb0| grep "inet[^6]" | awk '{print $2}' | cut -d'/' -f1 2>/dev/null`
tun0=`ip addr show dev tun0| grep "inet[^6]" | awk '{print $2}' | cut -d'/' -f1 2>/dev/null`
tap0=`ip addr show dev tap0| grep "inet[^6]" | awk '{print $2}' | cut -d'/' -f1 2>/dev/null`
gpd0=`ip addr show dev gpd0| grep "inet[^6]" | awk '{print $2}' | cut -d'/' -f1 2>/dev/null`


status=""
if [ ! -z $wlan0 ]
then
        status+="\xEE\x82\xB3wlan0:$wlan0 "
fi
if [ ! -z $eth0 ]
then
        status+="\xEE\x82\xB3eth0:$eth0 "
fi
if [ ! -z $usb0 ]
then
        status+="\xEE\x82\xB3usb0:$usb0 "
fi
if [ ! -z $tun0 ]
then
        status+="\xEE\x82\xB3tun0:$tun0 "
fi
if [ ! -z $tap0 ]
then
        status+="\xEE\x82\xB3tap0:$tap0 "
fi
if [ ! -z  $gpd0 ]
then
        status+="\xEE\x82\xB3gpd0:$gpd0 "
fi

#printf '%s' "$status"
echo -e $status
