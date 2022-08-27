- Reference
  [How do I enable autologin on TTY running on the Controllers serial port [Raspbian Buster/Bullseye]?](https://8086.support/content/23/110/en/how-do-i-enable-autologin-on-tty-running-on-the-controllers-serial-port-raspbian-buster_bullseye.html)
- 1. Add `serial-getty@YOUR_SERIAL_PORT.service.d/` under `/etc/systemd/system/`
  ```bash
  sudo mkdir -p /etc/systemd/system/serial-getty@YOUR_SERIAL_PORT.service.d/
  ```
  2. Create config file `autologin.conf`
  ```bash
  sudo vim /etc/systemd/system/serial-getty@YOUR_SERIAL_PORT.service.d/autologin.conf
  ```
  3. Add