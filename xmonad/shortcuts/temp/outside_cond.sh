condition=$(curl --connect-timeout 5 -s "http://api.weatherapi.com/v1/current.json?key=a4cf2db8e49843fcb0f52602211506&q=Canning%20BuBuenos%20Aires&aqi=no" | jq .current.condition.text | tr -d '"')

if [ ${#condition} -gt 1 ]; then
	echo "${condition,,}"
else
	echo "n/a"
	exit 0
fi
