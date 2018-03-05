# WebApp-WiFi-Configuration-RPi
This is a NodeJS application to configure the Wi-Fi connection without ssh into the Raspbery Pi!

A lot of steps have been omitted here.(The work is from 2016 Spring)
But here is a demo on after successfully running the app:(Lucky)

![Alt Text](file:///Users/LilyWU/Documents/photobooth-rbpi/Done!!!.gif)

Basically there are three steps:
1. Check if the WiFi connection is secure
2. If ifconfig is down, then pull it up, and then start a WiFi hotspot using hostpad API
3. Afterwards, the app will run a web server for you to configure the WiFi connection, by logging into 192.168.42.1:3000
4. After entering the WiFi password, the web server will be down, and Raspberry Pi will be configured correctly and system reboot.

The web application has been recognized as a great success at the company Treeline. http://treelineinteractive.com/
