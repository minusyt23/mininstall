DISPLAY_PRIMARY="HDMI-2"
DISPLAY_SECONDARY="DP-1"

sudo -u minus xrandr --output $DISPLAY_PRIMARY --auto --primary --output $DISPLAY_SECONDARY --auto --left-of $DISPLAY_PRIMARY --rate 60

systemctl set-property --runtime -- system.slice AllowedCPUs=0-7
systemctl set-property --runtime -- user.slice AllowedCPUs=0-7
systemctl set-property --runtime -- init.scope AllowedCPUs=0-7
