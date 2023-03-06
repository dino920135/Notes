- ## Documents
	- [Run GitLab Runner in a container | GitLab](https://docs.gitlab.com/runner/install/docker.html)
- ## Gitlab Runner Docker  image usage
  `docker run --rm -t -i gitlab/gitlab-runner --help`
- ## Register
  `docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register`
- ## Verify
  `docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner verify`
- ## Install Environment
  `apt-get install cmake g++ g++-arm-linux-gnueabihf`
-