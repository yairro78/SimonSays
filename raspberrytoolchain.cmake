#File raspberrytoolchain.cmake for ROS and system packages to cross compile.
SET(CMAKE_SYSTEM_NAME Linux)
#SET(CMAKE_C_COMPILER arm-linux-gnueabihf-gcc)
#SET(CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++)

SET(CMAKE_C_COMPILER $ENV{HOME}/rpi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc)
SET(CMAKE_CXX_COMPILER $ENV{HOME}/rpi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-g++)


# Below call is necessary to avoid non-RT problem.
SET(CMAKE_LIBRARY_ARCHITECTURE arm-linux-gnueabihf)

SET(RASPBERRY_ROOT_PATH ${CMAKE_CURRENT_LIST_DIR}/arm_raspberry)
SET(RASPBERRY_KINETIC_PATH ${RASPBERRY_ROOT_PATH}/opt/ros/kinetic)

SET(CMAKE_FIND_ROOT_PATH ${RASPBERRY_ROOT_PATH} ${CATKIN_DEVEL_PREFIX})

#If you have installed cross compiler to somewhere else, please specify that path.
SET(COMPILER_ROOT /usr/arm-linux-gnueabihf) 

#Have to set this one to BOTH, to allow CMake to find rospack
#This set of variables controls whether the CMAKE_FIND_ROOT_PATH and CMAKE_SYSROOT are used for find_xxx() operations.
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

SET(CMAKE_PREFIX_PATH ${RASPBERRY_KINETIC_PATH} ${RASPBERRY_ROOT_PATH}/usr)

SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --sysroot=${RASPBERRY_ROOT_PATH}" CACHE INTERNAL "" FORCE)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --sysroot=${RASPBERRY_ROOT_PATH}" CACHE INTERNAL "" FORCE)
SET(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} --sysroot=${RASPBERRY_ROOT_PATH}" CACHE INTERNAL "" FORCE)
SET(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} --sysroot=${RASPBERRY_ROOT_PATH}" CACHE INTERNAL "" FORCE)

SET(LD_LIBRARY_PATH ${RASPBERRY_KINETIC_PATH}/lib)