public:: true
title:: VS Code
#vscode

- ## Navigate
  [42 Visual Studio Code Shortcuts for Boosting Your Productivity](https://www.sitepoint.com/visual-studio-code-keyboard-shortcuts/)
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
- ## Coo-work Tips
	- ### Recommended extesion
	  `ctrl + shift + P` and type `Extensions: Configure Recommended Extensions (Workspace)`
	  ```json
	  // Example (in .code-workspace)
	  "extensions": {
	    "recommendations": [
	      "takumii.markdowntable",
	      "mhutchie.git-graph",
	      "eamodio.gitlens",
	      "shd101wyy.markdown-preview-enhanced",
	      "davidanson.vscode-markdownlint",
	      "gruntfuggly.todo-tree",
	      "llvm-vs-code-extensions.vscode-clangd",
	      "twxs.cmake",
	      "ms-vscode.cmake-tools"
	    ]
	  }
	  ```
- ## Warnings and Debug
	- ### Visual Studio Code is unable to watch for file changes in this large workspace(error ENOSPC)
	  
	  **Solutions**
	  Check Maximum user watches avaliable  
	  ```bash
	  cat /proc/sys/fs/inotify/max_user_watches
	  ```
	  
	  To change the number of watches avaliable, edit file:  
	  ```bash
	  sudo vim /etc/sysctl.conf
	  ```
	  
	  Add new line  
	  ```bash
	  fs.inotify.max_user_watches=524288
	  ```
	  
	  Refresh settings  
	  `sudo sysctl -p`