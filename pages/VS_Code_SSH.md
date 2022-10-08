title:: VS_Code_SSH

- # Install SSH server
	- ## Linux as server
		- Installation
		  ```bash
		  sudo apt-get install openssh-server
		  ```
		- Enable & Start the ssh service
		  ```bash
		  sudo systemctl enable ssh
		  sudo systemctl start ssh
		  ```
	- ## Win as server
		- Installation
		  1. Open **Settings**, select **Apps**, then select **Optional Features**
		  2. If OpenSSH is not installed yet, select **Add a feature**, install **OpenSSH Client** & **OpenSSH Server**
		- Enable ssh service and check working
		  Open powershell as administrator
		  ```powershell
		  Start-Service sshd
		  Set-Service -Name sshd -StartupType 'Automatic'
		  Get-NetFirewallRule -Name *ssh*
		  ```
- # Connect to SSH server through VS Code
	- ## With Remote-Explorer
		- ### Installation