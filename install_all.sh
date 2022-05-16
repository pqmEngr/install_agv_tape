#!/usr/bin/env sh
cd ..
git clone git@gitlab.com:mkac-agv/agv_msgs.git
git clone git@gitlab.com:mkac-agv/agv_tape_arduino.git -b agv_lidar_test
git clone git@gitlab.com:mkac-agv/agv_tape_config.git -b agv_lidar_test
git clone git@gitlab.com:mkac-agv/arduino_common_library.git
git clone git@gitlab.com:mkac-agv/magnetic_agv.git -b develop
git clone git@gitlab.com:mkac-agv/path_creator.git


git clone https://github.com/RobotWebTools/rosbridge_suite.git 
sudo apt-get install ros-melodic-kobuki-* -y
sudo apt-get install ros-melodic-ecl-streams -y
sudo apt-get install ros-melodic-yocs-velocity-smoother -y
sudo apt-get install ros-melodic-rosserial-arduino
sudo apt-get install ros-melodic-rosserial

sudo apt-get install ros-melodic-rosbridge-server
