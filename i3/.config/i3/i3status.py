# -*- coding: utf-8 -*-
import os
from i3pystatus import Status

status = Status(standalone=True)
red = "#FF0000"
orange = "#FF8200"
green = "#4CAF50"
gray = "7A7A7A"

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
                format="%a %-d %b %X KW%V",)


status.register("mem",
                divisor=10**9,
                color=green,
                format="{avail_mem} G free")

if os.path.isfile("/proc/acpi/bbswitch"):
    status.register(
        "shell", format=" GPU: {output: >3s}",
        interval=1, color=green,
        on_rightclick="/home/maico/dotfiles/i3/.config/i3/i3pystatus_toggle_gpu",
        command="/home/maico/dotfiles/i3/.config/i3/i3pystatus_gpu.sh")

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
                format="♪ VOL: {volume}%",
                format_muted="♪ VOL: M{volume}%")

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
    format="BAT:|{bar_design}| {status}{percentage_design:.2f}% {remaining:%E%hh:%Mm}",
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

# Has all the options of the normal network and adds some wireless specific
# things like quality and network names.
#
# Note: requires both netifaces and basiciw
status.register(
    "network",
    interface="wlp2s0",
    color_up=green,
    color_down=red,
    format_up="  {interface}: {quality:03.0f}% [{essid}] {v4cidr}",
    format_down="  {interface}",)

# Shows disk usage of /media/maico/DATA
# Format:
# 42/128G [86G]
status.register(
    "disk",
    path="/home",
    critical_color=red,
    format=" /home: {avail}G",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register(
    "disk",
    path="/",
    critical_color=red,
    format=" /: {avail}G",)

status.run()
