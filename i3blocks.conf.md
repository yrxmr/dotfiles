---
description: config file for py3status
---

# i3blocks.conf

```
# i3blocks config file

# Time
[time]
command=date '+%H:%M'
interval=60

# Network name
[network]
command=iw dev | grep ssid | awk '{print $NF}'
interval=60

# Connection status
[connection]
command=ping -c 1 google.com >/dev/null 2>&1 && echo "connected" || echo "disconnected"
interval=60

# Date
[date]
command=date '+%a %d %b %Y'
interval=60

# System load
[load]
command=uptime | awk '{print "load: " $10 " " $11 " " $12}'
interval=60


[greetings]
color=#f5af19
command=echo "Hello, $USER!"
interval=once

[battery]
command=/usr/bin/acpi | /usr/bin/awk '{print $4, $5}'
interval=60
color=#c8a2c8

# Now playing
[nowplaying]
command=mpc current
interval=10
color=#c8a2c8

# Weather
[weather]
command=curl -s "https://wttr.in/?format=%C%20%t%20%C%20%w" | awk '{print $1, $2, $3, $4}'
interval=3600
color=#c8a2c8

# CPU temperature
[temp]
command=sensors | awk '/^Core/ {print $1, $3}'
interval=10
color=#c8a2c8


```
