#!/bin/bash

# Check the number of arguments provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <option>"
    echo "Options:"
    echo "  Build Native Simon Says game - raspberry"
    echo "  Build RaspberyPi Arm Simon Says game - native"
    exit 1
fi

# Read the arguments
option=$1

# Define functions for each option
create_RaspberryPi() {
    cmake -DUSE_TOOLCHAIN=ON ..
}

createNative() {
    cmake -DUSE_TOOLCHAIN=OFF ..
}

# Specify the target path you want to compare against
cd ./build/ || exit
rm * r

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
