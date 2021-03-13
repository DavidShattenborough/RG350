#!/usr/bin/env bash

# Use ifconfig to determine your interface and IP address values. en1 is
# the wireless interface, en3 is the RNDIS/Ethernet Gadget interface.

UPSTREAM_IFACE=${1:-en1}
USB_IFACE='en3'
USB_IP=${2:-10.1.1.1}

for i in $(ifconfig -lu); do
  if ifconfig $i | grep -q "${USB_IP}" ; then USB_IFACE=$i; fi;
done

if [ -z "$USB_IFACE" ]
then
  echo "can't find usb interface with ip $USB_IP"
  exit 1
fi

echo "sharing connecting from upstream interface $UPSTREAM_IFACE to usb interface $USB_IFACE ..."

sysctl -w net.inet.ip.forwarding=1
pfctl -e
echo "nat on ${UPSTREAM_IFACE} from ${USB_IFACE}:network to any -> (${UPSTREAM_IFACE})" | pfctl -f -
