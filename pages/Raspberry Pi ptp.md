# Reference
	- [Sync up your clocks! Better PTP settings on Raspberry Pi | by Vincent Jordan | Oct, 2020 | Medium | Fun projects at Inatech](https://medium.com/inatech/sync-your-clocks-better-ptp-settings-on-raspberry-pi-37a9a54e4802)
	- [twteamware/raspberrypi-ptp: How to run IEEE-1588 on RaspberryPi hardware (github.com)](https://github.com/twteamware/raspberrypi-ptp)
	- [IEEE1588 Precision Time Protocol（PTP）_port 1 (ens33): uncalibrated to slave on master_cl-CSDN博客](https://blog.csdn.net/eliot_shao/article/details/102953355)
- # Check ethernet interface
	- ```bash
	  ts@ts-raspi:~$ ethtool -T eth0
	  Time stamping parameters for eth0:
	  Capabilities:
	          software-receive      (SOF_TIMESTAMPING_RX_SOFTWARE)
	          software-system-clock (SOF_TIMESTAMPING_SOFTWARE)
	  PTP Hardware Clock: none
	  Hardware Transmit Timestamp Modes: none
	  Hardware Receive Filter Modes: none
	  ```
- #