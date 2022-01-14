DISPLAY_OFF="HDMI-2"

sudo -u minus xrandr --output $DISPLAY_OFF --off

systemctl set-property --runtime -- system.slice AllowedCPUs=0,4
systemctl set-property --runtime -- user.slice AllowedCPUs=0,4
systemctl set-property --runtime -- init.scope AllowedCPUs=0,4
