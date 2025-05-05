- {{renderer :tocgen2}}
- ## Install SSH server
  #ssh
	- ### Linux as server
		- Installation
		  id:: 64e5b599-a0b5-4fb6-8350-518b82dbbb2a
		  ```bash
		  sudo apt-get install openssh-server
		  sudo systemctl enable ssh
		  sudo systemctl start ssh
		  ```
	- ### Win as server
		- Installation
		  1. Open **Settings**, select **Apps**, then select **Optional Features**
		  2. If OpenSSH is not installed yet, select **Add a feature**, install **OpenSSH Client** & **OpenSSH Server**
		- Start-Service sshd
		  Set-Service -Name sshd -StartupType 'Automatic'
		  Get-NetFirewallRule -Name *ssh*
		- **Remember to setup login password** in **Settings > Accounts > Sign-in options**
		  ![image.png](../assets/image_1666464085880_0.png)
	- ## Enable root login for SSH
	  #root
		- Edit the ssh configuration file (`/etc/ssh/sshd_config`) with root permissions
		  ```bash
		  vim /etc/ssh/sshd_config
		  ```
		- Find the line `#PermitRootLogin `
		  Change it to 
		  ```plantext
		  # Authentication:
		  #LoginGraceTime 2m
		  PermitRootLogin yes
		  ```
		- Restart sshd service
		  ```bash
		  sevice sshd restart
		  ```
-