- #wsl #comport #usbipd
- ## Check Exist Ports
	- `usbipd list`
	  ```cmd
	  C:\Users>usbipd list
	  Connected:
	  BUSID  VID:PID    DEVICE                                                        STATE
	  1-4    8087:0029  Intel(R) Wireless Bluetooth(R)                                Not shared
	  2-2    04f2:b67c  Integrated Camera, Integrated IR Camera                       Not shared
	  6-2    0483:3748  STM32 STLink                                                  Not shared
	  6-3    10c4:ea60  Silicon Labs CP210x USB to UART Bridge (COM10)                Not shared
	  ```
- ## Bind Port
	- `usbipd bind -b [BUSID] `
		- Usage:
			- usbipd bind [options]
		- Options:
			- -b, --busid <BUSID>          Share device having <BUSID>
			- -f, --force                               Force binding; the host cannot use the device
			- -i, --hardware-id <VID:PID >  Share device having <VID>:<PID>
			- -?, -h, --help                           Show help and usage information
- ## Attach Port
	- `usbipd attach -a -b [BUSID] -w`
		- Usage:
			- usbipd attach [options]
		- Options:
			- -a, --auto-attach                      Automatically re-attach when the device is detached or unplugged
			- -b, --busid <BUSID>                    Attach device having <BUSID>
			- -i, --hardware-id <VID:PID>            Attach device having <VID>:<PID>
			- -w, --wsl <[DISTRIBUTION]> (REQUIRED)  Attach to WSL, optionally specifying the distribution to use
			- -o, --host-ip <IPADDRESS>              Use <IPADDRESS> for WSL to connect back to the host
			- -u, --unplugged                        Allows auto-attaching a currently unplugged device
			- -?, -h, --help                         Show help and usage information