#!/bin/sh
BUDS_STATUS=`earbuds status -o json -q`

REQ_STATUS=`echo $BUDS_STATUS | jq '.status' -r`
if [ "$REQ_STATUS" != "success" ]; then
    #echo
	echo "{\"text\": \"﫽 -- : 﫽 --\", \"class\" : \"Buds+\", \"percentage\" : \"﫽 -- : 﫽 -- \"}"
    exit 0;
fi

LEFT=$(echo $BUDS_STATUS | jq -r '.payload.batt_left')
RIGHT=$(echo $BUDS_STATUS | jq -r '.payload.batt_right')

if [ "`echo $BUDS_STATUS | jq '.payload.placement_left'`" == "3" ]; then
    LEFT="⚡ $LEFT"
else
    LEFT="🎵 $LEFT"
fi

if [ "`echo $BUDS_STATUS | jq '.payload.placement_right'`" == "3" ]; then
    RIGHT="⚡ $RIGHT"
else
    RIGHT="🎵 $RIGHT"
fi

echo "{\"text\" : \"$LEFT : $RIGHT\", \"class\" : \"Buds+\", \"percentage\" : \"$LEFT : $RIGHT\"}"



