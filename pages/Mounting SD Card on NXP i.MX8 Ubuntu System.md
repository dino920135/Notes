title:: Mounting SD Card on NXP i.MX8 Ubuntu System
#sdcard #nxp #imx8 #ubuntu
{{renderer :tocgen2}}

- ## Check for device
	- Run `lsblk`
	  ```bash
	  root@jammy-dev64mq:~# lsblk
	  NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
	  mmcblk0      179:0    0 14.6G  0 disk
	  └─mmcblk0p1  179:1    0    7G  0 part /
	  mmcblk0boot0 179:32   0    4M  1 disk
	  mmcblk0boot1 179:64   0    4M  1 disk
	  mmcblk1      179:96   0 28.3G  0 disk
	  └─mmcblk1p1  179:97   0 28.3G  0 part
	  ```
	- `mmcblk0` is often the eMMC on NXP i.MX8
	- `mmcblk1` is typically the SD card
- ## Create mount point
	- ```bash
	  sudo mkdir -p /mnt/sdcard
	  ```
- ## Mount SD Card
	- Assuming the SD card has a partition (e.g., `mmcblk1p1`):
	  ```bash
	  sudo mount /dev/mmcblk1p1 /mnt/sdcard
	  ```
	  You can specify filesystem type if needed:
	  ```bash
	  # FAT32
	  sudo mount -t vfat /dev/mmcblk1p1 /mnt/sdcard
	  # EXT4
	  sudo mount -t ext4 /dev/mmcblk1p1 /mnt/sdcard
	  ```
- ## Unmount SD Card
	- Before removing card
	  ```bash
	  sudo umount /mnt/sdcard
	  ```
- ## Troubleshooting
	- ### SD card partition SIZE is not correct
	  e.g. a 64GB SD card is only showing 7.8GB partition
	  It's likely still has an old partition table on the SD card. Fixing the problem with formatting the SD card
		- #### Format SD card
		  #fromat #repartition
			- Identify the SD card partition with `lsblk`, should find the partition like below:
			  ```bash
			  mmcblk1     7.8G
			  ├─mmcblk1p1 ...
			  ```
			  **!!! make sure it's not the system partition (plug & unplug) !!!**
			- Delete and recreate partitions with `fdisk`
			  ```bash
			  sudo fdick /dev/mmcblk1
			  ```
			  Inside  `fdisk` :
				- Press `p` to view existing partitions
				- Press `d` to delete each one
				- Press `n` to create a new primary partition
				- Accept defaults to use full capacity
				- Press `w` to write and exit
			- Format the new partition with `mkfs`
				- For ext4 format
				  ```bash
				  sudo mkfs.ext4 /dev/mmcblk1p1
				  ```
				- For FAT32 format (for cross platform usage)
				  ```bash
				  sudo mkfs.vfat -F 32 /dev/mmcblk1p1
				  ```
				- If `mkfs` is not installed
				  ```bash
				  sudo apt update
				  sudo apt install dosfstools
				  ```