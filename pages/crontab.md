- #crontab
- # crontab
	- ## Basic commands
	  **crontab -option**
		- **-e**    edit user's crontab
		- **-l**    list user's crontab
		- **-r**    delete user's crontab
		- **-i**    prompt before deleting user's crontab
	- ## Editing Configure
		- ```bash
		  crontab -e
		  ```
	- ## Change editor to vim
		- crontab uses the default editor of bash. Change the editor with command `export EDITOR=vim`. Or add this line to `.bashrc`