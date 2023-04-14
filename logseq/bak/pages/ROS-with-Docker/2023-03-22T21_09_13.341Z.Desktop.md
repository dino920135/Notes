title::
#ROS #Docker

- ## References
	- [ROS with Docker | tuw-cpsg.github.io](https://tuw-cpsg.github.io/tutorials/docker-ros/)
	- [docker/Tutorials/Docker - ROS Wiki](http://wiki.ros.org/docker/Tutorials/Docker)
- ## Pull Docker Image
	- ```bash
	  docker pull ros:melodic
	  ```
- ## Run Docker Container
	- ### First time
	  ```bash
	  docker run \
	  -it --detach \
	  --net=host \
	  --volume /home/point001/TS/testDocker:/home/testDocker \
	  --env ROS_MASTER_URI=http://localhost:11311 \
	  --name rosTS \
	  ros:melodic
	  ```
	- ### Enter running container
	  ```bash
	  docker exec -it rosTS bash
	  ```
	-
	-