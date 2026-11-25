#!/bin/bash
# 1. Parameter für Anzhal erlaubte offene Updates
WARN=$1
#---
UPDATES=$(apt list --upgradable 2>/dev/null| tail -n +2)
if [ -z "$UPDATES" ]; then
        echo " 0 Updates verfügbar"
        exit 0
else
        Anzahl=$(echo "$UPDATES" | wc -l) 
        if [ $(echo "$WARN > $Anzahl " | bc ) = 1 ]; then 
                echo "$Anzahl offene Updates"
                echo "----------------------!"
                apt list --upgradable 2>/dev/null| tail -n +2
                exit 0
        else
                echo "$Anzahl offene Updates"
                echo "----------------------!"
                apt list --upgradable 2>/dev/null| tail -n +2
                exit 2
        fi
fi
