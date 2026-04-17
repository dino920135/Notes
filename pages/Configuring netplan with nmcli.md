- #network #configure #netplan #nmcli
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