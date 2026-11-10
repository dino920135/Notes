category:: [[Linux]]

- {{renderer :tocgen2}}
- ## Install SSH server
	- #ssh
	- ### Linux as server
		- Installation
	-
- ```bash
  sudo apt-get install openssh-server
  sudo systemctl enable ssh
  sudo systemctl start ssh
  ```
- ### Win as server
	- Installation
- Open **Settings**, select **Apps**, then select **Optional Features**
  logseq.order-list-type:: number
- If OpenSSH is not installed yet, select **Add a feature**, install **OpenSSH Client** & **OpenSSH Server**
  logseq.order-list-type:: number
	- Start-Service sshd
	- Set-Service -Name sshd -StartupType 'Automatic'
	- Get-NetFirewallRule -Name *ssh*
	- **Remember to setup login password** in **Settings > Accounts > Sign-in options**
	- ![image.png](../assets/image_1666464085880_0.png)
	- ## Enable root login for SSH
	- Edit the ssh configuration file (`/etc/ssh/sshd_config`) with root permissions
- ```bash
  vim /etc/ssh/sshd_config
  ```
- Find the line `#PermitRootLogin `
- Change it to
- ```plantext
  # Authentication:
  #LoginGraceTime 2m
  PermitRootLogin yes
  ```
- Restart sshd service
- ```bash
  service sshd restart
  ```