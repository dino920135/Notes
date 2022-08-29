title:: TTY_autologin

- ## Enable Autologin
  * Add folder `serial-getty@YOUR_SERIAL_PORT.service.d/` under `/etc/systemd/system/`
  ```bash
  sudo mkdir -p /etc/systemd/system/serial-getty@YOUR_SERIAL_PORT.service.d/
  ```
  * Create config file `autologin.conf`
  ```bash
  sudo vim /etc/systemd/system/serial-getty@YOUR_SERIAL_PORT.service.d/autologin.conf
  ```
  * Add below lines into `autologin_conf`
  ```text
  [Service]
  ExecStart=
  ExecStart=-/sbin/agetty --autologin pi --noclear %I \$TERM
  ```
- Disable autologin
  ```bash
  sudo rm -rf /etc/systemd/system/serial-getty@YOUR_SERIAL_PORT.service.d/
  ```
- Reference
  [How do I enable autologin on TTY running on the Controllers serial port [Raspbian Buster/Bullseye]?](https://8086.support/content/23/110/en/how-do-i-enable-autologin-on-tty-running-on-the-controllers-serial-port-raspbian-buster_bullseye.html)