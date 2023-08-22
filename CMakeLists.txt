cmake_minimum_required(VERSION 3.5.0)

set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")


#option to enable/disable using Raspberry Pi toolchain
option(USE_TOOLCHAIN "Use toolchain for compilation" OFF)

if(USE_TOOLCHAIN)
    message("Using toolchain for compilation")
    set(CMAKE_TOOLCHAIN_FILE ~/SimonArm/CrossCompilation.cmake)
endif()
project(SimonSays_project VERSION 1.0.0)

add_subdirectory(bsp)


add_executable(SimonSays
main.cpp)

target_link_libraries(SimonSays bsp)

message("CMAKE_INSTALL_PREFIX = ${CMAKE_INSTALL_PREFIX}")

#other modifications are in subdirectory level CMakeLists.txt
#check the file at my_math/CMakeLists.txt




