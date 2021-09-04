#!/bin/sh
echo $(sensors | awk -v FS="(SMBUSMASTER 0:          +|)" '{print $2}' | tr "\n" " " | tr -d " " | cut -d "+" -f 2 | cut -d "." -f 1)