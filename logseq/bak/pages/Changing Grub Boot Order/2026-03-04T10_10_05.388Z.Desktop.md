tag:: #grub #boot #entry

- Updating **TrueNAS SCALE** few months ago from `25.04.2.4` to `25.04.2.6`. But the update failed . Then the new boot environment was unable to remove cause it's stuck at
- Check grub menu index 
  `sudo grep -i "menuentry '" /boot/grub/grub.cfg|sed -r "s|--class .*$||g"|nl -v 0`
  ```shell
  truenas_admin@truenas:~$ sudo grep -i "menuentry '" /boot/grub/grub.cfg|sed -r "s|--class .*$||g"|nl -v 0
  [sudo] password for truenas_admin: 
       0  menuentry 'TrueNAS Scale GNU/Linux 25.04.2.6' 
       1          menuentry 'TrueNAS Scale GNU/Linux 25.04.2.6, with Linux 6.12.15-debug+truenas' 
       2  menuentry 'TrueNAS Scale GNU/Linux 25.04.2.4' 
       3          menuentry 'TrueNAS Scale GNU/Linux 25.04.2.4, with Linux 6.12.15-debug+truenas' 
       4  menuentry 'UEFI Firmware Settings' $menuentry_id_option 'uefi-firmware' {
  ```
- Related links
	- [How can I get grub2 to boot a different option only on the next boot? - Ask Ubuntu](https://askubuntu.com/questions/574295/how-can-i-get-grub2-to-boot-a-different-option-only-on-the-next-boot)
	-