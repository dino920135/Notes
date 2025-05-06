- #sdcard #ubuntu #mount 
  {{renderer :tocgen2}}
- ## Identify the Device
	- Use `lsblk -f` to find the **device name**, **Filesystem** & **UUID**, here's the output:
	  ```bash
	  root@jammy-dev64mq:~# lsblk -f
	  NAME         FSTYPE FSVER LABEL   UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
	  mmcblk0
	  └─mmcblk0p1  ext4   1.0   sys-1Dh 5dea5efd-a79b-4fb6-8c71-ec455a3958b5  536.6M    87% /
	  mmcblk0boot0
	  mmcblk0boot1
	  mmcblk1
	  └─mmcblk1p1  vfat   FAT32         B202-5D46
	  ```
	  Take note of the **NAME**, **FSTYPE**, and **UUID**, take here as expample:
		- NAME: mmcblk1p1
		- FSTYPE: vfat
		- UUID: B202-5D46
- ## Edit `/etc/fstab`
  #fstab 
  `fstab` shorts for **File System Table** is the configuration file for Linux that tells the system **How & Where to Mount storage device** at boot
	- Open the file in the editor
	  ```bash
	  sudo vim /etc/fstab
	  ```
	- Add the following line to the file:
	  ```bash
	  # <device>    <mount_point>   <filesystem>   <options>        <dump> <pass>
	  UUID=B202-5D46 /mnt/sdcard vfat umask=001,noauto,x-systemd.automount 0 0
	  ```
		- |Field|Value|Description|
		  |--|--|--|
		  |device|`UUID=B202-5D46`|Can be `/dev/sdX1`, `/dev/mmcblk0p1`, `UUID=`, or `LABEL=`|
		  |mount point|`/mnt/sdcard`|Directory to mount the device (must exist)|
		  |filesystem|`vfat`|Type: `ext4`, `vfat`, `ntfs`, `exfat`, `nfs`, etc.|
		  |options|`umask=001,noauto,x-systemd.automount`|Mount options (`defaults`, `rw`, `noauto`, `uid=`, etc.)|
		- ### Mount options
			- `umask`  is a **bitmask** that subtracts permissions from the default (`777` for directories, `666` for files). so the `001` here means `776` as `chmod`
			- `noauto` option in `/etc/fstab` **tells the system not to automatically mount** the filesystem at boot **or when running `mount -a`**.
			  It is useful when:
				- The device is **removable** and **may not always be present**
				- You **don’t want the system to fail booting** if the SD card or USB drive is missing
				  You're using **`x-systemd.automount`**, which delays mounting until first access
			- `x-systemd.automount` option, the device **is not mounted at boot**, but **is automatically mounted the moment you access the mount point**.
		-
- ## ⚠️ Caution
	- **A bad `fstab` line can prevent the system from booting.**
	- Test your changes with:
	  
	  ```bash
	  sudo mount -a
	  ```
	-