public:: true

- ## Documents
	- [Run GitLab Runner in a container | GitLab](https://docs.gitlab.com/runner/install/docker.html)
- ## Pull docker image from docker hub
  `docker pull gitlab/gitlab-runner:latest`
- ## Gitlab runner docker  image usage
  `docker run --rm -t -i gitlab/gitlab-runner --help`
- ## Start docker container
	- ### Register
	  `docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register`
	- ### Verify
	  `docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner verify`
	- docker run -d --name gitlab-runner --restart always \
	  -v /var/run/docker.sock:/var/run/docker.sock \
	  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
	  -v /home/point001/TS/Data:/home/Data \
	  --name multiSensor-runner \
	  gitlab/gitlab-runner:latest register
- ## Install environment
  ```bash
  apt-get update
  apt-get upgrade
  apt install build-essential
  apt-get install cmake g++ g++-arm-linux-gnueabihf
  ```
-