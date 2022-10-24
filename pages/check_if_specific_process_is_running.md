title:: check_if_specific_process_is_running

- # Check if specific process is running
	- ```shell
	  while true
	  do
	  	if [[ $(ps -ef | grep MY_PROCESS | grep -v grep | wc -l) != 0 ]]
	  	then
	  		sleep 1
	  		echo MY_PROCESS running
	  	else
	      	# Print "." along the same line
	  		echo -ne "."
	  		sleep 1
	  	fi
	  done
	  ```