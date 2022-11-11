title:: VS_Code
#vscode

- # VS Code
- ## Git with vscode
	- ## git clone
- ## Warnings and Debug
	- ### Visual Studio Code is unable to watch for file changes in this large workspace(error ENOSPC)
	  
	  **Solutions**
	  Check Maximum user watches avaliable  
	  `cat /proc/sys/fs/inotify/max_user_watches`
	  
	  To change the number of watches avaliable, edit file:  
	  `sudo vim /etc/sysctl.conf`
	  
	  Add new line  
	  `fs.inotify.max_user_watches=524288`
	  
	  Refresh settings  
	  `sudo sysctl -p`