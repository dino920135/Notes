- #linux #comport
- ## udev
  `udev` is the device manager in Linux kernel
	- It **dynamically creates and removes device nodes** in `/dev` (like `/dev/ttyUSB0`, `/dev/sda1`, etc.).
	- It handles hotplug events (USB insertion, serial ports appearing), and applies **rules** to set permissions, ownership, symlinks, etc.
- ## udevadm
  `udevadm` is the **administrative tool** to manage and monitor `udev`.
  ```bash
  root@jammy-dev64mm:~# udevadm --help
  udevadm [--help] [--version] [--debug] COMMAND [COMMAND OPTIONS]
  
  Send control commands or test the device manager.
  
  Commands:
    info          Query sysfs or the udev database
    trigger       Request events from the kernel
    settle        Wait for pending udev events
    control       Control the udev daemon
    monitor       Listen to kernel and udev events
    test          Test an event run
    test-builtin  Test a built-in command
  
  ```
	- ### Seeting comport access
	  needs to run `sudo chmod 777 /dev/ttymxc3` every time when rebooting the system? Here's the solution:
		- Create new udev rule file:
		  logseq.order-list-type:: number
		  ```bash
		  sudo vim /etc/udev/rules.d/99-ttymxc3.rules
		  ```
		- Add rules in the file:
		  logseq.order-list-type:: number
		  ```udev
		  KERNEL=="ttymxc3", MODE="0666"
		  ```
		- (If ) Restricting to a specific group:
		  logseq.order-list-type:: number
		  ```udev
		  KERNEL=="ttymxc3", GROUP="GROUP-NAME", MODE="0660"
		  ```
		- Reload udev rules and trigger:
		  logseq.order-list-type:: number
		  ```bash
		  sudo udevadm control --reload-rules
		  sudo udevadm trigger /dev/ttymxc3
		  ```