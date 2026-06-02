- #usb #port #udev
- ```bash
  $ ls -l /dev/serial/by-path/ | grep ttyACM
  
  lrwxrwxrwx 1 root root 13 Apr  1 16:22 platform-xhci-hcd.1-usb-0:2:1.0 -> ../../ttyACM0
  lrwxrwxrwx 1 root root 13 Apr  1 16:22 platform-xhci-hcd.1-usb-0:2:1.3 -> ../../ttyACM1
  lrwxrwxrwx 1 root root 13 Apr  1 16:22 platform-xhci-hcd.1-usbv2-0:2:1.0 -> ../../ttyACM0
  lrwxrwxrwx 1 root root 13 Apr  1 16:22 platform-xhci-hcd.1-usbv2-0:2:1.3 -> ../../ttyACM1
  ```
- ```bash
  $ ls -l /dev/serial/by-path/ | grep ttyACM
  
  lrwxrwxrwx 1 root root 13 Apr 16 14:16 platform-xhci-hcd.0-usb-0:2:1.0 -> ../../ttyACM0
  lrwxrwxrwx 1 root root 13 Apr 16 14:16 platform-xhci-hcd.0-usb-0:2:1.3 -> ../../ttyACM1
  lrwxrwxrwx 1 root root 13 Apr 16 14:16 platform-xhci-hcd.0-usbv2-0:2:1.0 -> ../../ttyACM0
  lrwxrwxrwx 1 root root 13 Apr 16 14:16 platform-xhci-hcd.0-usbv2-0:2:1.3 -> ../../ttyACM1
  ```
- Add rules to `/etc/udev/rules.d/99-usb.rules` file
  ```bash
  # ==============================================================================
  # TI mmWave Radar - Persistent Port Mapping for Raspberry Pi 5
  # ==============================================================================
  
  # Radar 1: USB 3.0 TOP (xhci-hcd.1-usb-0:1)
  SUBSYSTEM=="tty", KERNELS=="4-1:1.0", SYMLINK+="mmwave_cmd_1"
  SUBSYSTEM=="tty", KERNELS=="4-1:1.3", SYMLINK+="mmwave_data_1"
  
  # Radar 2: USB 3.0 BOTTOM (xhci-hcd.0-usb-0:1)
  SUBSYSTEM=="tty", KERNELS=="2-1:1.0", SYMLINK+="mmwave_cmd_2"
  SUBSYSTEM=="tty", KERNELS=="2-1:1.3", SYMLINK+="mmwave_data_2"
  
  # Radar 3: USB 2.0 TOP (xhci-hcd.0-usb-0:2)
  SUBSYSTEM=="tty", KERNELS=="2-2:1.0", SYMLINK+="mmwave_cmd_3"
  SUBSYSTEM=="tty", KERNELS=="2-2:1.3", SYMLINK+="mmwave_data_3"
  
  # Radar 4: USB 2.0 BOTTOM (xhci-hcd.1-usb-0:2)
  SUBSYSTEM=="tty", KERNELS=="4-2:1.0", SYMLINK+="mmwave_cmd_4"
  SUBSYSTEM=="tty", KERNELS=="4-2:1.3", SYMLINK+="mmwave_data_4"
  ```
- ```bash
  sudo udevadm control --reload-rules && sudo udevadm trigger
  ```
- ```bash
  $ ls /dev/mmwave*
  /dev/mmwave_cmd_1  /dev/mmwave_data_1
  ```
- https://gemini.google.com/share/86d5338c1f9f
- ```bash
  (Front)
  nvidia@localhost:~$ ls -l /dev/serial/by-path/ | grep ttyACM
  lrwxrwxrwx 1 root root 13 Jun  1 19:53 platform-3610000.usb-usb-0:2.4:1.0 -> ../../ttyACM0
  lrwxrwxrwx 1 root root 13 Jun  1 19:53 platform-3610000.usb-usb-0:2.4:1.3 -> ../../ttyACM1
  ```
- ```bash
  (Left)
  nvidia@localhost:~$ ls -l /dev/serial/by-path/ | grep ttyACM
  lrwxrwxrwx 1 root root 13 Jun  1 19:55 platform-3610000.usb-usb-0:2.3:1.0 -> ../../ttyACM2
  lrwxrwxrwx 1 root root 13 Jun  1 19:55 platform-3610000.usb-usb-0:2.3:1.3 -> ../../ttyACM3
  ```
- ```bash
  (Right)
  nvidia@localhost:~$ ls -l /dev/serial/by-path/ | grep ttyACM
  lrwxrwxrwx 1 root root 13 Jun  1 19:56 platform-3610000.usb-usb-0:2.2:1.0 -> ../../ttyACM4
  lrwxrwxrwx 1 root root 13 Jun  1 19:56 platform-3610000.usb-usb-0:2.2:1.3 -> ../../ttyACM5
  ```
- ```text
  # ==============================================================================
  # TI mmWave Radar - Persistent Port Mapping for AGX
  # ==============================================================================
  
  # Radar 2: Front
  SUBSYSTEM=="tty", KERNELS=="1-2.4:1.0", SYMLINK+="mmwave_cmd_2", MODE="0666"
  SUBSYSTEM=="tty", KERNELS=="1-2.4:1.3", SYMLINK+="mmwave_data_2", MODE="0666"
  
  # Radar 3: Left
  SUBSYSTEM=="tty", KERNELS=="1-2.3:1.0", SYMLINK+="mmwave_cmd_3", MODE="0666"
  SUBSYSTEM=="tty", KERNELS=="1-2.3:1.3", SYMLINK+="mmwave_data_3", MODE="0666"
  
  # Radar 4: Right
  SUBSYSTEM=="tty", KERNELS=="1-2.2:1.0", SYMLINK+="mmwave_cmd_4", MODE="0666"
  SUBSYSTEM=="tty", KERNELS=="1-2.2:1.3", SYMLINK+="mmwave_data_4", MODE="0666"
  ```