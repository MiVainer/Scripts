#!/bin/bash

for i in {9..20}
do
    bs=$((2**i))
    dd bs="$bs" if=/dev/zero of=/dev/null status=progress |& { 
    mapfile -d$'\r' -n 6; printf '%-8s : %s\n' "$bs" "${MAPFILE[5]}"; }
done

exit
