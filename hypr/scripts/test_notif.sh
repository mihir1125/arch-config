dunstify "Notification" "Normal urgency"

dunstify -u low "Notification" "Low urgency"

dunstify -u critical "Notification" "Critical urgency"

dunstify -i /usr/share/icons/breeze-dark/status/22/audio-volume-high.svg \
    "Notification" "Appimage / Hintimage"

dunstify "Progress" \
    -i /usr/share/icons/breeze-dark/status/22/audio-volume-high.svg \
    --hints int:value:90

dunstify "Yes or no?" \
    -i /usr/share/icons/breeze-dark/status/22/audio-volume-high.svg \
	-A "cancel,Cancel" -A "ok,OK" -A "idk,Idk"

dunstify "Yes or no?" -A "idk,Idk" -A "cancel,Cancel" -A "ok,OK"
