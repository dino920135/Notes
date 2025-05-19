- #tty #ubuntu #linux #permission #comport
  {{renderer :tocgen2}}
- ## Udev
  `udevadm` is the **command-line tool** used to **interact with the udev device manager** in Linux.
	- `udev` is the **device manager** for the Linux kernel.
	- It **dynamically creates and removes device nodes** in `/dev` (like `/dev/ttyUSB0`, `/dev/sda1`, etc.).
	- It handles hotplug events (USB insertion, serial ports appearing), and applies **rules** to set permissions, ownership, symlinks, etc.
	- ### Common command
	  collapsed:: true
		- #### Device information
		  logseq.order-list-type:: number
		  ```bash
		  root@jammy-dev64mq:~/GNSSINS# udevadm info --name=/dev/ttymxc3
		  P: /devices/platform/soc@0/30800000.bus/30a60000.serial/tty/ttymxc3
		  N: ttymxc3
		  L: 0
		  E: DEVPATH=/devices/platform/soc@0/30800000.bus/30a60000.serial/tty/ttymxc3
		  E: DEVNAME=/dev/ttymxc3
		  E: MAJOR=207
		  E: MINOR=19
		  E: SUBSYSTEM=tty
		  E: USEC_INITIALIZED=6564324
		  E: cpu=8MMQ
		  E: board=nitrogen8mm_som
		  E: TAGS=:systemd:
		  E: CURRENT_TAGS=:systemd:
		  ```
		- #### Reload udev rules
		  logseq.order-list-type:: number
		- #### Trigger rules & apply
		  logseq.order-list-type:: number
- ## Create new udev rules
	- Create new udev rules
	  logseq.order-list-type:: number
	  ```bash
	  sudo vim /etc/udev/rules.d/99-ttymxc3.rules
	  ```
	- Add this line
	  logseq.order-list-type:: number
	  ```plan text
	  KERNEL=="ttymxc3", MODE="0666"
	  ```
		- `KERNEL=="ttymxc3"` matches the device by name
		- `MODE="0666"` gives **read/write access to everyone**
	- Reload udev rules and trigger
	  logseq.order-list-type:: number
	  ```bash
	  sudo udevadm control --reload-rules
	  sudo udevadm trigger /dev/ttymxc3
	  ```
	- Confirm Permission
	  logseq.order-list-type:: number
	  ```bash
	  root@jammy-dev64mq:~/GNSSINS# ls -al /dev/ttymxc*
	  crw-rw---- 1 root dialout 207, 16 May  6 20:14 /dev/ttymxc0
	  crw--w---- 1 root tty     207, 17 May  6 20:14 /dev/ttymxc1
	  crw-rw---- 1 root dialout 207, 18 May  6 20:14 /dev/ttymxc2
	  crw-rw-rw- 1 root dialout 207, 19 May 18 23:49 /dev/ttymxc3
	  ```
	  For `/dev/ttymxc3` shows `crw-rw-rw-`