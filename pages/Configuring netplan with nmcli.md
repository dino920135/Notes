- #network #configure #netplan #nmcli
- ## Add New netplan
	- ```bash
	  sudo nmcli connection add \
	  type ethernet \
	  con-name "basler" \
	  ifname eth0 \
	  ip4 192.168.113.100/24 \
	  gw4 192.168.113.1
	  ```