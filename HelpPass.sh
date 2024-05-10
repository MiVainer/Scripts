#!/bin/bash

set -e


MONTH=$(date +%m)

NEW_LINUX_PASSWORD=$(head -n $MONTH password | tail -n 1)

chpasswd <<<"ksdo001:${NEW_LINUX_PASSWORD}"

echo $NEW_LINUX_PASSWORD

