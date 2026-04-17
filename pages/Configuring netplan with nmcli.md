- #network #configure #netplan #nmcli
- ## View Current Configures
	- ```bash
	  $ sudo nmcli connection
	  NAME          UUID                                  TYPE      DEVICE
	  837WL         2f204cb3-29ac-4dfb-a266-bec134cce408  wifi      wlan0
	  basler        1b026426-f3f6-450f-93b7-132ce5a19c35  ethernet  eth0
	  lo            edafe0de-bc2d-40ee-8434-a3c7e5f58e96  loopback  lo
	  awr1843       8eed8358-b27f-3a11-8616-61ab178dcf66  ethernet  --
	  netplan-eth0  626dd384-8b3d-3690-9511-192b2c79b3fd  ethernet  --
	  SyunSE2       2dfea8b1-4440-4140-ba0c-a8dfbc4224a2  wifi      --
	  ```
- ## Add New netplan
	- ```bash
	  sudo nmcli connection add \
	  type ethernet \
	  con-name "NETPLAN_NAME" \
	  ifname eth0 \
	  ip4 192.168.113.100/24 \
	  gw4 192.168.113.1
	  ```
- ## Activate netplan
	- ```bash
	  sudo nmcli connection up NETPLAN_NAME
	  ```
- ## Configure Files
	- The configuration files is locate in `/etc/netplan/*.yaml`