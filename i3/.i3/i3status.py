# -*- coding: utf-8 -*-
from i3pystatus import Status

status = Status(standalone=True)
red = "#FF0000"
orange = "#FF8200"
green = "#00FF00"
gray = "7A7A7A"

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
                format="%a %-d %b %X KW%V",)

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
                format="CPU: {temp:.0f}°C",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
                format="♪{volume}",
                format_muted="♪M{volume}")

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via dbus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
status.register(
    "battery",
    format="BAT:|{bar}| {status}{percentage:.2f}% {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=15,
    full_color=green,
    charging_color=green,
    critical_color=red,
    not_present_text="No battery available",
    not_present_color=gray,
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },)

# Shows the address and up/down state of eth0. If it is up the address is shown
# in green (the default value of color_up) and the CIDR-address is shown (i.e.
# 10.10.10.42/24).  If it's down just the interface name (eth0) will be
# displayed in red (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register(
    "network",
    interface="enp14s0",
    color_up=green,
    color_down=red,
    format_up="{interface}: {v4cidr}",
    format_down="{interface}",)

# Has all the options of the normal network and adds some wireless specific
# things like quality and network names.
#
# Note: requires both netifaces and basiciw
status.register(
    "network",
    interface="wlp13s0",
    color_up=green,
    color_down=red,
    format_up="{interface}: {quality:03.0f}% [{essid}] {v4cidr}",
    format_down="{interface}",)

status.register(
    "network",
    interface="tun0",
    color_up=green,
    color_down=red,
    format_up="{interface}: {v4cidr}",
    format_down="{interface}",
    unknown_up=True,)
# Shows disk usage of /media/maico/DATA
# Format:
# 42/128G [86G]
status.register(
    "disk",
    path="/home",
    critical_color=red,
    format="/home: {avail}G",)

# Shows disk usage of /media/maico/DATA
# Format:
# 42/128G [86G]
status.register(
    "disk",
    path="/mnt/data",
    critical_color=red,
    format="/mnt/data: {avail}G",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register(
    "disk",
    path="/",
    critical_color=red,
    format="/: {avail}G",)

status.run()
