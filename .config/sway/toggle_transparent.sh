 #!/bin/bash
# tested on sway v1.8

swaymsg "set \$min_opa 0.8"
swaymsg "set \$inc_opa 0.1"
if [[ $1 == "toggle" ]]; then
	swaymsg "opacity plus \$inc_opa"
fi 

if [ $? -eq 2 ]; then
	swaymsg "opacity set \$min_opa"
fi
