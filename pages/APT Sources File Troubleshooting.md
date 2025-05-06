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
		- Update and install
		  ```bash
		  sudo apt update
		  sudo apt install vim
		  ```
-