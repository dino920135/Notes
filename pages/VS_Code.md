title:: VS_Code
#vscode

- # VS Code
- ## Navigate
	- ### Open file
	  `Ctrl` + `p`
	- ### Toggle Side Bar
	  `Ctrl` + `B`
	- ### Navigate tabs
	  `Ctrl` + `Tab` for **Forward**
	  `Ctrl` + `Tab`+`Shift` for **Backward**
	- ### Navigate Tab Group
	  `Ctrl` + `1` or `2` or `3`
	- ### Navigate To Integrated Terminal
	  Vocode only provide default hotkey for **open terminal**:`Ctrl` + `J`. In order to navigate to terminal, need to edit `> Preferences : Open Keybord Shortcuts (JSON)`.  Add the follow lines:
	  ```json
	  // Toggle terminal focus
	  {
	    "key":     "ctrl+KEY_YOU_DEFINE",
	    "command": "workbench.action.terminal.focus"
	  }
	  ```
	  Then the terminal can be focus with `Ctrl` + `KEY_YOU_DEFINE`
	-
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