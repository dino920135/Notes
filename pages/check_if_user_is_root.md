public:: true
title:: check_if_user_is_root
#shellscript #code #bash

	- ## `id -u`
		- `id -u` return **0** when user is **root**
		  ```shell
		  ##### Check Permission #####
		  if [ $(id -u) != 0 ];
		  then
		      echo "Please run as root! Exit setup tool."
		      exit
		  fi
		  ```