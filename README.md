# SimonSays
Simon Says project for GM

Instructions
************

clone this repository to your home directory 

 $ git clone https://github.com/yairro78/SimonSays.git

the chmod commands grants premission to write bsp tp /usr/local &
user/local lib

$ sudo chmod -R 777 /usr/local/
$ sudo chmod -R 777 /usr/local/lib/

Install requiered Dependencies 

$ sudo apt-get update                        -----> updates apt
$ sudo apt install cmake make                ------> install cmake & make
$ sudo apt-get install build-essential        -----> install native compiler and other build essentials
$ sudo apt-get install g++-arm-linux-gnueabihf ----> install crosss compiler for ARM RaspberryPi
$ sudo apt-get install gdb-multiarch          -----> install GDB multi arch

execute instruction 
At ~/SimonSays/ there is a bash script name  ./buildSimonSays.sh 
the first parameter is which compilation/build to execute 

/buildSimonSays.sh  <param1>  <param2>

<param1>
*** native - for native linux 
*** raspberry - for ARM raspBerry
<param 2>
number of optional keys in the  game [1... max int number]

The game simulate Simon Says game rules
At the first wrong combination input by the player, the game end.
The score is displayed when the game ends.

