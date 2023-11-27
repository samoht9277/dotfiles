#!/bin/sh

id="2"

if [ $1 = "wired" ]; then
	pactl set-card-profile alsa_card.pci-0000_2b_00.4 output:"analog-stereo"
	pactl move-sink-input $(pactl list sink-inputs short | grep ladspa | sed -e 's/\s.*$//') "alsa_output.pci-0000_2b_00.4.analog-stereo"
	pactl set-card-profile alsa_card.usb-Sony_Interactive_Entertainment_Wireless_Stereo_Headset-00 off
	pactl set-card-profile bluez_card.DC_A4_CA_C3_13_06 off
elif [ $1 = "wireless" ]; then
	if [ -z "$(pactl list cards short | grep Sony)" ]; then
		dunstify -t 5000 "Headphone status" "Wireless card is unavailable." -r "$id"
		exit
	fi
	pactl set-card-profile alsa_card.usb-Sony_Interactive_Entertainment_Wireless_Stereo_Headset-00 output:"iec958-stereo"
	pactl move-sink-input $(pactl list sink-inputs short | grep ladspa | sed -e 's/\s.*$//') "alsa_output.usb-Sony_Interactive_Entertainment_Wireless_Stereo_Headset-00.iec958-stereo"
	pactl set-card-profile alsa_card.pci-0000_2b_00.4 off
	pactl set-card-profile bluez_card.DC_A4_CA_C3_13_06 off
else
	if [ -z "$(pactl list cards short | grep bluez)" ]; then
		dunstify -t 5000 "Headphone status" "Beats card is unavailable." -r "$id"
		exit
	fi
	pactl set-card-profile bluez_card.DC_A4_CA_C3_13_06 "a2dp_sink"
	pactl move-sink-input $(pactl list sink-inputs short | grep ladspa | sed -e 's/\s.*$//') "bluez_sink.DC_A4_CA_C3_13_06.a2dp_sink"
	pactl set-card-profile alsa_card.usb-Sony_Interactive_Entertainment_Wireless_Stereo_Headset-00 off
	pactl set-card-profile alsa_card.pci-0000_2b_00.4 off
fi

dunstify -t 5000 "Headphone status" "Headphones are in $1 mode." -r "$id"