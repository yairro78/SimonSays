#!/bin/bash

# Check the number of arguments provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <option>"
    echo "Options:"
    echo "  Build Native Simon Says game - raspberry"
    echo "  Build RaspberyPi Arm Simon Says game - native"
    exit 1
fi

# Read the arguments
option=$1
keysNumber=$2

# Define functions for each option
create_RaspberryPi() {
    cmake -DUSE_TOOLCHAIN=ON -DNUMBER_OF_KEYS_IN_GAME="$keysNumber" ..
}

createNative() {
    cmake -DUSE_TOOLCHAIN=OFF -DNUMBER_OF_KEYS_IN_GAME="$keysNumber" ..
}

# Specify the target path you want to compare against

mkdir build
cd ./build/ || exit

if [ -z "$(ls -A ./)" ]; then
    echo "Directory is empty"
else
    echo "Directory is not empty"
    rm * -r
fi

# Determine which option to execute

if [ "$option" == "raspberry" ]; then
    create_RaspberryPi
elif [ "$option" == "native" ]; then
    createNative

else
    echo "Invalid option: $option"
    exit 1
fi
make install all
