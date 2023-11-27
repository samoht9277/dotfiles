status=$(ps -x | grep [p]icom -b | wc -l)

if [ $status = "1" ]; then
	killall -15 picom
else
	picom -b
fi