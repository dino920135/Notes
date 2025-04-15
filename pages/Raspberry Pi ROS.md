- {{renderer :tocgen2}}
- # Reference
	- [Install Ubuntu MATE 18.04 and ROS on Raspberry Pi 3 B+ | by Rishabh Dev Yadav | Medium](https://rishabhdevyadav.medium.com/install-ubuntu-mate-18-04-and-ros-on-raspberry-pi-3-b-7ff84688fa37)
	- [melodic/Installation/Ubuntu - ROS Wiki](http://wiki.ros.org/melodic/Installation/Ubuntu)
	  id:: 6547e905-f91a-4fac-adbe-13fbcf7f3bad
- # Raspberry Pi OS (Ubuntu MATE)
	- It is suggested to use **Ubuntu MATE** for a **Raspberry Pi + ROS** system. Because the ROS1 system only works in ubuntu distribution before 20.04. It's necessary to download the legacy version. All released Ubuntu MATE version can be download from [Ubuntu MATE Releases - /archived/ (ubuntu-mate.org)](https://releases.ubuntu-mate.org/archived/). Be aware that Raspberry Pi is base on **ARM** architecture. According to the Raspberry Pi we use, the architecture might be **arm64 (64 bit)** or **armhf (32 bit)**, which is listed in [Raspberry Pi OS (64-bit) - Raspberry Pi](https://www.raspberrypi.com/news/raspberry-pi-os-64-bit/).
		- In my case: **Raspberry Pi 3B+** & **Ubuntu MATE 18.04 (arm64)**
		  ![image.png](../assets/image_1699206476922_0.png)
- # Install OS
	- ## Install Ubuntu MATE 18.04
	- ## Enable SSH
	  {{embed ((64e5b599-a0b5-4fb6-8350-518b82dbbb2a))}}
- # Install ROS (Melodic)
  Follow the steps on ((6547e905-f91a-4fac-adbe-13fbcf7f3bad))
	- ### Setup sources.lists
	  ```bash
	  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
	  ```
	- ### Setup keys
	  ```bash
	  sudo apt install curl
	  curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
	  ```
	- ### Official Installation Instruction
	  First,
	  ```bash
	  sudo apt update
	  sudo apt upgraade
	  ```
	  There are several ways to install ROS
		- Desktop-Full Install : `sudo apt install ros-melodic-desktop-full`
		- Desktop Install : `sudo apt install ros-melodic-desktop`
		- ROS-Base : `sudo apt install ros-melodic-ros-base`
		- Individual Package : `sudo apt install ros-melodic-PACKAGE`
	- ### Customized Installation
	  Some dependences required by ros-melodic-desktop was unmet, eg: ((6547f225-256e-4cb8-af48-10324ab51a77)). It is suggested to install **ROS-Base**, then install other packages afterward.
	  ```bash
	  sudo apt install ros-meldoic-ros-base
	  sudo apt install ros-melodic-rviz
	  sudo apt install ros-melodic-rqt
	  ```
	- ## Errors
		- unmet dependencies error
		  id:: 6547f225-256e-4cb8-af48-10324ab51a77
		  ```bash
		  ts@ts-raspi:~$ sudo apt install ros-melodic-desktop-full
		  [sudo] password for ts:
		  Reading package lists... Done
		  Building dependency tree
		  Reading state information... Done
		  Some packages could not be installed. This may mean that you have
		  requested an impossible situation or if you are using the unstable
		  distribution that some required packages have not yet been created
		  or been moved out of Incoming.
		  The following information may help to resolve the situation:
		  
		  The following packages have unmet dependencies:
		   ros-melodic-desktop-full : Depends: ros-melodic-perception but it is not going to be installed
		  E: Unable to correct problems, you have held broken packages.
		  ```