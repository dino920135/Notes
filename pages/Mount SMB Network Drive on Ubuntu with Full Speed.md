- #smb #ubuntu #linux #[[network drive]] #nas
- ## Install cifs
	- ```bash
	  sudo apt update
	  sudo apt install cifs-utils
	  ```
- ## Create Mount Point
	- ```bash
	  sudo mkdir -p /mnt/Share
	  ```
- ## Mount Permanently (Auto-mount on Boot)
	- ### Credential file
		- ```bash
		  nano ~/.smbcredentials
		  ```
		- Add username and password
		- ```text
		  username=YOUR_USER
		  password=YOUR_PASSWORD
		  ```
		- Secure the file
		- ```bash
		  chmod 600 ~/.smbcredentials
		  ```
	- ### Add Mount Point to /etc/fstab
		- ```bash
		  sudo nano /etc/fstab
		  ```
		- Add the mount point
		- ```bash
		  //192.168.x.x/Share /mnt/Share cifs credentials=/home/YOUR_LOCAL_USER/.smbcredentials,uid=1000,gid=1000,iocharset=utf8,rsize=130048,wsize=130048,vers=3.0,x-systemd.automount 0 0
		  ```
	- ### Test the Mount
		- ```bash
		  sudo mount -a
		  ```
		- If showing 
		  ```bash
		  $ sudo mount -a
		  [sudo] password for point-3080:
		  mount: /mnt/Share: cannot mount //192.168.xxx.xxx/Share read-only.
		  mount: /mnt/Personal: cannot mount //192.168.xxx.xxx/Personal read-only.
		  ```
		  Means `cifs-utils` is not installed