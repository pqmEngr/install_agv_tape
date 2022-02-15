# Installation Documentation
![Build Status](https://img.shields.io/opencollective/backers/minh?color=red&label=MKAC)
![Build Status](https://img.shields.io/wheelmap/a/26699541?color=red&label=AGV_tape)


Hoàn thiện AGV_tape gồm 4 giai đoạn (Stage):
- Stage-1: Cài đặt phần mềm bao gồm các package và library liên quan cho hệ thống và arduino 
- Stage-2: ............................
- Stage-3: Testing (Kiếm tra lại IO arduino và Simulation Agv_Tape )
- Stage-4: Hoàn thiện

Stage 1 và 2 bạn có thể tìm kiếm source tại mã nguồn của MKAC  [MKAC](https://github.com/urastogi885/a-star-robot). A sample output for phase-3 of the project can be found [here](https://github.com/urastogi885/a-star-turtlebot#phase3-output)

## Authors

- [Umang Rastogi](https://github.com/urastogi885)
- [Naman Gupta](https://github.com/namangupta98)

## Todo

- Add path smoothing

## Dependencies

- Ubuntu 16.04/18.04
- ROS Kinetic/Melodic
- Gazebo
- Turtlebot3 Packages
- Python Packages: Numpy, OpenCV-Python, Math, Queue

## Install Dependencies

- Install Python3, Python3-tk, and the necessary libraries: (if not already installed)

```
sudo apt install python3 python3-tk
sudo apt install python3-pip
pip3 install numpy opencv-python
```

- Check if your system successfully installed all the dependencies
- Open terminal using Ctrl+Alt+T and enter python3.
- The terminal should now present a new area represented by >>> to enter python commands
- Now use the following commands to check libraries: (Exit python window using Ctrl+Z if an error pops up while running 
the below commands)

```
import tkinter
import numpy
import cv2
import math
import queue
```

- If you want to work on Ubuntu 16.04, you will need to install [ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu)
by following the instructions given on referenced web-page.
- If you want to work on Ubuntu 18.04, you will need to install [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu)
by following the instructions given on referenced web-page.
- We recommend installing the full-desktop version of ROS because it automatically installs the latest compatible version of
Gazebo on your system.
- If you wish to install Gazebo separately, then follow the instruction on the [Gazebo install page](http://gazebosim.org/tutorials?tut=install_ubuntu&cat=install).
- Install Turtlebot-3 package and its dependencies:
```
cd ~/<ROS_Workspace>/src
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd  ../ && catkin_make
sudo su
cp -r src/turtlebot3/ /opt/ros/<distro>/share/
cp -r src/turtlebot3_msgs/ /opt/ros/<distro>/share/
cp -r src/turtlebot3_simulations/ /opt/ros/<distro>/share/
```
- Using the same terminal window, check installation of turtlebot3:
```
source devel/setup.bash
roslaunch turtlebot3_gazebo turtlebot3_world.launch
```
- Note that Turtlebot-3 package is supported by ROS Melodic as well as Kinetic.

## Phase3 Output

In phase-3, a video output was generated to show the exploration and final path a differential-drive robot might take 
using the OpenCV library. The output for one case is presented below.

<p align="center">
  <img src="https://github.com/urastogi885/a-star-turtlebot/blob/master/images/phase3.gif">
  <br><b>Figure 2 - Exploration of a differential-drive robot using A* to find optimal path from start to goal</b><br>
</p>
 
## Run Instructions

- Clone the repository in your ROS workspace. Type
```
cd ~/<ROS_Workspace>/src
git clone https://github.com/urastogi885/a-star-turtlebot
```

- If you have a compressed version of the project, extract it, go into project directory, open the terminal, and type:

```
python3 a_star_turtlebot.py start_x,start_y,start_orientation goal_x,goal_y rpm1,rpm2,clearance animation
python3 a_star_turtlebot.py -4,-4.5,0 4.25,2.75 30,25,5 0
```

- This would generate a text file that will be used to run the Turtlebot-3 in Gazebo.
- Note the following to try the code with other inputs:
    - The origin of the map is taken at the center of the map s make sure to take into consideration in which 
    quadrant your points lie.
    - Provide start and goal coordinates in meters while start orientation is to be provided in degrees.
    - In addition to that, clearance is taken in centimeters.
    - Refer documentation of [*a_star_turtlebot.py*](https://github.com/urastogi885/a-star-turtlebot/blob/master/a_star_turtlebot.py) to
    understand further about input arguments.
    - Set animation to 1 to generate an exploration output as shown in [Phase3 Output](https://github.com/urastogi885/a-star-turtlebot#phase3-output).
    Note that this drastically increases exploration time. 
- Launch the world, spawn turtlebot, navigate it to the desired goal point. Type:

```
cd ~/<ROS_Workspace>
source devel/setup.bash
catkin_make or catkin build (For ROS Melodic, you might have to use catkin build instead of catkin_make)
roslaunch a-star-turtlebot launcher_1.launch
```

- Stop the execution, using ```Ctrl + C```. Do not close this terminal.
- Open *planner.py* from the scripts folder, replace *commander_1.txt* by *commander_2.txt* in the main section of the file.
- Essentially, the following line needs to be changed in *planner.py*:
```
with open(ros_root.get_path('a-star-turtlebot') + '/output_files/commander_1.txt', 'r') as command:
```

- From the same terminal, run:
```
roslaunch a-star-turtlebot launcher_2.launch
```
