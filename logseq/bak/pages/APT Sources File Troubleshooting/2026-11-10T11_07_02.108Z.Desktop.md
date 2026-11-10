- #apt #source #install #ubuntu 
  {{renderer :tocgen2}}
- ## Missing /etc/apt/sources.list
	- ### Enable the official Ubuntu repositiories
		- Connect the device with internet, recreate the default  sources list:
		  ```bash
		  sudo nano /etc/apt/sources.list
		  ```
		- Add this content for Ubuntu 22.04 (Jammy Jellyfish):
		  ```bash
		  deb http://archive.ubuntu.com/ubuntu jammy main universe restricted multiverse
		  deb http://archive.ubuntu.com/ubuntu jammy-updates main universe restricted multiverse
		  deb http://archive.ubuntu.com/ubuntu jammy-security main universe restricted multiverse
		  ```
		  For ARM64 system
		  ```bash
		  deb http://ports.ubuntu.com/ubuntu-ports jammy main universe
		  deb http://ports.ubuntu.com/ubuntu-ports jammy-updates main universe
		  deb http://ports.ubuntu.com/ubuntu-ports jammy-security main universe
		  ```
		- Update and install
		  ```bash
		  sudo apt update
		  sudo apt install vim
		  ```
-