#!/bin/sh
BUDS_STATUS=$(earbuds status -o json -q)
REQ_STATUS=$(echo $BUDS_STATUS | jq '.status' -r)

if [ "$REQ_STATUS" != "success" ]; then
	printf '{"text":" -- |  --","class":"none","percentage":0}\n'
	exit 0
fi
case=' '$(echo $BUDS_STATUS | jq -r '.payload.batt_case')

left=''
right=''
bat=()
for i in "left" "right"; do
	BAT=$(echo $BUDS_STATUS | jq -r '.payload.batt_'$i)
	bat+=($BAT)
	POS=$(echo $BUDS_STATUS | jq '.payload.placement_'$i)
	case $POS in
		1)
			eval "$i=' '$BAT"
			;;
		2)
			eval "$i=' '$BAT"
			;;
		3)
			eval "$i=' '$BAT"
			;;
		*)
			eval "$i=' '$BAT"
			;;
	esac
done
min=$( printf "%s\n" "${bat[@]}" | awk '$0>0' | sort -n | head -n1 )
printf '{"text":"%s | %s","class":"bluetooth","percentage":%d}\n' "$left" "$right" "$min"
