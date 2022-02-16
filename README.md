# Installation Documentation
![Build Status](https://img.shields.io/opencollective/backers/minh?color=red&label=MKAC)
![Build Status](https://img.shields.io/wheelmap/a/26699541?color=red&label=AGV_tape)


## Overview
- Stage-1: install software include Packages and Library for AGV magnetic tape (consists of Arduino)
- Stage-2: Testing hardware and simulation

You can find the source code made at [MKAC](https://gitlab.com/mkac-agv/magnetic_agv).

## Dependencies
- Ubuntu 18.04
- ROS Melodic
- ROS Arduino

## Install Dependencies
- Open the terminal with Ctrl+Alt+T and go to your workspace usually and enter below commands one at a time
  
```
cd .. 
cd ~/catkin_ws/src
```
Please refer to the script file.
- Install magnetic_agv, agv_tape_arduino, agv_tape_config and the necessary libraries (path_creator, agv_common_library, agv_msgs)
  
```
sudo apt-get update
sudo apt-get upgrade
git clone https://github.com/pqmEngr/Install_Agv_Tape.git
cd Install_Agv_Tape
sudo chmod +x install_all.sh
./install_all.sh
cd ~/catkin_ws/ && catkin_make
```
we have tried to keep the libraries on the PC running successfully AGV

- Install related libraries
```
pip install pipreqs
pip install -r requirements.txt
```
Check if your system successfully installed all the library, if the above installation fails. 

Please check the versions in the requirements.txt file to see if they are supported and an alternate version for it or contact MKAC

- Install ROS Ardruino
```
cd .. 
cd Arduino/libraries
rm -rf ros_lib
rosrun rosserial_arduino make_libraries.py .
```

## Program and Simulation

Running the following commands, if successful, dashborad interface is successful

- Run Dashborad 
```
rosrun agv_ui dashboard.py
rosrun agv_ui dashboard.py -s true
```

<p align="center">
  
  <img src="https://user-images.githubusercontent.com/82381342/154178893-ad5fe69a-6395-4d5f-a9b9-b6f9868771df.png">
  <br><b>Figure - Dashboard AGV TAPE</b><br>
</p>

- Run program
```
roslaunch agv_bringup agv_magnetic.launch subfix:=.py
roslaunch agv_bringup agv_magnetic.launch simulation:=true subfix:=.py
```
