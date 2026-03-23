- #wsl #nas [[network drive]]
- ## Prepare
	- ### Create mount point
	  Creating mount point s `mkdir /mnt/s`
- ## Drives already mounted on Windows
  For those drives is already mounted in windows with **File Explorer**, drives can be mounted without password.
	- ### Manual mount (everytime)
		- ```bash
		  sudo mount -t drvfs S: /mnt/s
		  ```
	- ### Auto mount (once forever)
		- open `/etc/fstab`
		- Add line
		  ```bash
		  S: /mnt/s drvfs defaults 0 0
		  ```