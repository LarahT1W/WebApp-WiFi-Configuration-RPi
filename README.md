# WebApp-WiFi-Configuration-RPi
This is a NodeJS application to configure the Wi-Fi connection without ssh into the Raspbery Pi!

A lot of steps have been forgotten here.(The work is done in 2016 Spring with a group of engineers at UCSD ECE 191 course, which also means successfully running the app will require the actual Hardware toolkits, e.g. Rapsberry Pi 2, the software build of PhotoBooth, Bluetooth USB, etc.)

But here is a demo on after successfully running the app: (Luckily!)

![Alt Text](https://github.com/LarahT1W/WebApp-WiFi-Configuration-RPi/blob/master/Done!!!.gif)

Basically there are four steps:

1. Check if the WiFi connection is secure
2. If ifconfig is down, then pull it up, and then start a WiFi hotspot using hostpad API
3. Afterwards, the app will run a web server for you to configure the WiFi connection, by logging into 192.168.42.1:3000
4. After entering the WiFi password, the web server will be down, and Raspberry Pi will be configured correctly and system reboot.

![Alt Text](https://github.com/LarahT1W/WebApp-WiFi-Configuration-RPi/blob/master/Screen%20Shot%202018-03-18%20at%204.07.04%20PM.png)

The web application has been recognized as a great success at company Treeline during my part time internship. http://treelineinteractive.com/
