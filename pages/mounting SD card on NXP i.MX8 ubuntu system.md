title:: mounting SD card on NXP i.MX8 ubuntu system
#sdcard #nxp #imx8 #ubuntu

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