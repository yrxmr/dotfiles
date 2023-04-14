---
description: config file for py3status
---

# config

```
#py3status

general {
    color_bad = "#dc322f"
    color_degraded = "#cb4b16"
    color_good = "#859900"
    color_separator = "#C3B1E1"
    colors = true
    interval = 150
    markup = "pango"
    output_format = "i3bar"
}

py3status {

   align = 'left'
   markup = 'pango'
   min_width = 5
   separator = True
   separator_block_width = 9

   border_bottom = 1
   border_left = 1
   border_right = 1
   border_top = 1

   min_length = 15
   position = 'right'}

order += "whoami"
order += "wireless _first_"
order += "volume_status speakers"
order += "battery_level"
order += "tztime local"




emerge_status {
    format = "[\?if=is_running {prefix}[\?if=!total=0  {current}/{total}]]"
    prefix = "⚙"
}


whoami {
    format = "Hi Yara ☕"
}

xrandr {
    urgent_background = 'crimson'
    urgent_foreground = "black"
    urgent_border_bottom = "green"
    force_on_start = "eDP1+DP1"
      force_on_change = ["eDP1+DP1", "eDP1"]
      DP1_pos = "right-of eDP1"
      DP2_pos = "right-of eDP1"
      DP1-2_pos = "right-of eDP1"
      DP2-2_pos = "right-of eDP1"
}

do_not_disturb {
    format = '[\?color=state [\?if=state |]]'
    thresholds = [(0, 'good'), (1, 'bad')]
}

process_status xautolock {
    cache_timeout = 300
    icon_off = ""
    icon_on = ""
    on_click 1 = "exec pidof xautolock || xautolock -secure -time 5 -locker '/usr/bin/i3lock -ef -c 002b36'"
    on_click 3 = "exec killall xautolock"
    process = "xautolock"
}

bluetooth {
    format = ""
    on_click 1 = "exec bluetoothctl power on && bluetoothctl connect 2C:41:A1:F7:DA:B2"
    on_click 3 = "exec bluetoothctl power off"
}

backlight {
    device = "intel_backlight"
    format = ""
    color = "#b58900"
}

xrandr_controls {
    format_output = '{name} {brightness}'
}

yubikey {
    format = "[[\?if=is_gpg ][\?if=is_u2f ]]"
    gpg_check_watch_paths = []
    socket_path = "/home/alexys/.run/yubikey-touch-detector.socket"
}

frame calendar_mm {
    format = '{output}{button}'
    format_button_open = ''
    format_button_closed = ''

    google_calendar mm {
        color_time = "#cb4b16"
        auth_token = "/home/alexys/.i3/calendar_1m/auth.token"
        blacklist_events = ['ooo', 'cloudera', 'booked']
        client_secret = "/home/alexys/.i3/calendar_1m/client_secret.json"
        force_lowercase = True
        format_event = '[\?color=event {summary}][\?if=is_toggled  : [\?color=time {location}]|[ : {format_timer}]]'
        format_timer = '\?color=time [\?if=days {days}d ][\?if=hours {hours}h ][\?if=minutes {minutes}m] [\?if=is_current left]'
        ignore_all_day_events = True
        num_events = 2
        time_max_hours = 6
    }
}



group tz {
    cycle = 10
    format = "{output}"

    tztime la {
        format = "LA %H:%M"
        timezone = "America/Los_Angeles"
    }

    tztime ny {
        format = "NY %H:%M"
        timezone = "America/New_York"
    }

    tztime du {
        format = "DU %H:%M"
        timezone = "Asia/Dubai"
    }
}

dpms {
    icon_off = ""
    icon_on = ""
}

volume_status speakers {
    command = "pactl"
    format = ' {percentage}%'
    format_muted = ' {percentage}%'
    button_down = 5
    button_mute = 1
    button_up = 4
    thresholds = [(0, 'bad'), (5, 'degraded'), (10, 'good')]
    max_volume = 200
}

volume_status mic {
    format = ' {percentage}%'
    format_muted = ' {percentage}%'
    button_down = 5
    button_mute = 1
    button_up = 4
    is_input = true
    thresholds = [(0, 'bad'), (10, 'degraded'), (20, 'good')]
}

whatismyip {
    format_offline = ""
    format_online = ""
    mode = 'status'
}

wireless _first_ {
    format_down = "📶"
    format_up = "📶"
    on_click 1 = "exec pidof nm-applet || dbus-launch nm-applet"
    on_click 3 = "exec killall nm-applet"
}

battery _first_ {
    format = "🔋 %percentage"
    integer_battery_capacity = true
    low_threshold = 15
    threshold_type = time
}

process_status VPN {
    format = "{icon}"
    icon_on = "VPN"
    icon_off = "VPN"
    process = "openvpn"
    on_click 1 = "exec terminator -c openvpn -e 'test -f /run/openvpn.pid || sudo systemctl start openvpn-client@numberly'"
    on_click 3 = "exec sudo systemctl stop openvpn-client@numberly"
}

tztime local {
    format = "%d/%m %H:%M:%S"
}

load {
    format = "%5min"
}

disk "/" {
    format = "/ %free"
    on_click 1 = "exec thunar ~"
}

cpu_temperature 0 {
    format = "%degrees°C"
    path = "/sys/devices/platform/coretemp.0/temp1_input"
}

weather_owm paris {
    api_key = env("OWM_API_KEY")
    cache_timeout = 7200
    forecast_include_today = True
    format = "{forecast}"
    icon_sun = "☀"
    icon_rain = "☂"
    icon_thunderstorm = "☔"
    unit_temperature = "c"
    on_click 1 = "exec firefox-bin http://www.meteo.fr"
}

volume master {
    device = "default"
    format = "♪ %volume"
    mixer = "Master"
    mixer_idx = 0
    on_click 1 = "exec amixer set Master toggle"
    on_click 4 = "exec amixer set Master 5%+"
    on_click 5 = "exec amixer set Master 5%-"
}

battery_level {
    blocks = ''
    charging_character = ''
    format = '{icon}'
    hide_when_full = True
    measurement_mode = 'sys'
}
```
