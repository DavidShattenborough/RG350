# RG350

## macOS Internet Connection Sharing

Note: Tested only with "[Rogue](https://github.com/Ninoh-FOX/RG350-ROGUE-CFW)" firmware version [1.7.12](https://github.com/Ninoh-FOX/RG350-ROGUE-CFW/releases/tag/1.7.12)

1. Power on the RG350
2. Connect the RG350 to the computer (use port labeled "USB2" on the RG350)
3. ssh into the RG350 (10.1.1.2) and add nameserver to /etc/resolv.conf (this only needs to be done once, the resolv.conf file and contents are retained at reboot/power off):
````bash
nameserver 8.8.8.8
````
4. From macOS run the macos_connection_share.sh script (sudo)
5. Verify internet access from the RG350 (can ping an internet address from the RG350 command line or use the "ROGUE Updater" application)
