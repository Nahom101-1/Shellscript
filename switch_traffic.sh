#!/bin/bash

if [ "$1" == "down" ]; then
    echo "Bytter til nedetidsside..."
    uc change endpoint 10.212.172.185
elif [ "$1" == "up" ]; then
    echo "Bytter tilbake til hovedsiden..."
    uc change endpoint 10.212.168.98
else
    echo "Ukjent kommando. Bruk: $0 [up|down]"
fi
