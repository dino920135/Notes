public:: true

- {{renderer :tocgen}}
- # Useful Command
	- Check doker container
	  `doker container ps`
	- Check logs
	  `docker logs -f gitlab`
	- Get into container with bash
	  `docker exec -it gitlab bash`
- # Backup Gitlab in docker
  id:: 64153b91-5c7a-40a2-8298-a1019bc911fd
  [Backup and restore Gitlab in docker - A code to remember (copdips.com)](https://copdips.com/2018/09/backup-and-restore-gitlab-in-docker.html#backup-gitlab-in-docker)
	- ## Check backup path
		- ### Synology NAS
		  ```bash
		  # depeneds on the space set for docker
		  # locate Gitlab configuration file gitlab.rb
		  
		  Pointshare@PointNAS:/$ sudo ls volume1/gitlab/config/
		  Password:
		  gitlab.rb            ssh_host_ecdsa_key.pub    ssh_host_rsa_key
		  gitlab-secrets.json  ssh_host_ed25519_key      ssh_host_rsa_key.pub
		  ssh_host_ecdsa_key   ssh_host_ed25519_key.pub  trusted-certs
		  
		  # Locate backup_path
		  
		  Pointshare@PointNAS:/$ sudo cat volume1/gitlab/config/gitlab.rb | grep backup_path
		  # gitlab_rails['manage_backup_path'] = true
		  # gitlab_rails['backup_path'] = "/var/opt/gitlab/backups"
		  # gitlab_rails['backup_gitaly_backup_path'] = "/opt/gitlab/embedded/bin/gitaly-backup"
		  ```
	- ## Create Backup
		- ### Backup
		  ```bash
		  root@d44c48535c28:/# sudo docker exec -it gitlab gitlab-rake gitlab:backup:create
		  2023-03-18 04:48:17 +0000 -- Dumping database ...
		  Dumping PostgreSQL database gitlabhq_production ... [DONE]
		  2023-03-18 04:48:25 +0000 -- Dumping database ... done
		  2023-03-18 04:48:25 +0000 -- Dumping repositories ...
		  .
		  .
		  .
		  2023-03-18 04:48:45 +0000 -- Dumping repositories ... done
		  2023-03-18 04:48:45 +0000 -- Dumping uploads ...
		  2023-03-18 04:48:47 +0000 -- Dumping uploads ... done
		  2023-03-18 04:48:47 +0000 -- Dumping builds ...
		  2023-03-18 04:48:47 +0000 -- Dumping builds ... done
		  2023-03-18 04:48:47 +0000 -- Dumping artifacts ...
		  2023-03-18 04:49:01 +0000 -- Dumping artifacts ... done
		  2023-03-18 04:49:01 +0000 -- Dumping pages ...
		  2023-03-18 04:49:01 +0000 -- Dumping pages ... done
		  2023-03-18 04:49:01 +0000 -- Dumping lfs objects ...
		  2023-03-18 04:49:01 +0000 -- Dumping lfs objects ... done
		  2023-03-18 04:49:01 +0000 -- Dumping terraform states ...
		  2023-03-18 04:49:01 +0000 -- Dumping terraform states ... done
		  2023-03-18 04:49:01 +0000 -- Dumping container registry images ... [DISABLED]
		  2023-03-18 04:49:01 +0000 -- Dumping packages ...
		  2023-03-18 04:49:01 +0000 -- Dumping packages ... done
		  2023-03-18 04:49:01 +0000 -- Creating backup archive: 1679114897_2023_03_18_15.0.4_gitlab_backup.tar ...
		  2023-03-18 04:49:14 +0000 -- Creating backup archive: 1679114897_2023_03_18_15.0.4_gitlab_backup.tar ... done
		  2023-03-18 04:49:14 +0000 -- Uploading backup archive to remote storage  ...
		   [SKIPPED]
		  2023-03-18 04:49:14 +0000 -- Deleting tar staging files ...
		  2023-03-18 04:49:14 +0000 -- Cleaning up /var/opt/gitlab/backups/backup_information.yml
		  2023-03-18 04:49:14 +0000 -- Cleaning up /var/opt/gitlab/backups/db
		  2023-03-18 04:49:14 +0000 -- Cleaning up /var/opt/gitlab/backups/repositories
		  2023-03-18 04:49:14 +0000 -- Cleaning up /var/opt/gitlab/backups/uploads.tar.gz
		  2023-03-18 04:49:14 +0000 -- Cleaning up /var/opt/gitlab/backups/builds.tar.gz
		  2023-03-18 04:49:14 +0000 -- Cleaning up /var/opt/gitlab/backups/artifacts.tar.gz
		  2023-03-18 04:49:14 +0000 -- Cleaning up /var/opt/gitlab/backups/pages.tar.gz
		  2023-03-18 04:49:14 +0000 -- Cleaning up /var/opt/gitlab/backups/lfs.tar.gz
		  2023-03-18 04:49:14 +0000 -- Cleaning up /var/opt/gitlab/backups/terraform_state.tar.gz
		  2023-03-18 04:49:14 +0000 -- Cleaning up /var/opt/gitlab/backups/packages.tar.gz
		  2023-03-18 04:49:14 +0000 -- Deleting tar staging files ... done
		  2023-03-18 04:49:14 +0000 -- Deleting old backups ... [SKIPPED]
		  2023-03-18 04:49:14 +0000 -- Warning: Your gitlab.rb and gitlab-secrets.json files contain sensitive data
		  and are not included in this backup. You will need these files to restore a backup.
		  Please back them up manually.
		  2023-03-18 04:49:14 +0000 -- Backup 1679114897_2023_03_18_15.0.4 is done.
		  ```
		- ### Backup configuration and secret files
			- ### Entering container
			  ```bash
			  docker exec -it gitlab bash
			  ```
			- `gitlab.rb` and `gitlab-secrets.json` locate in `/etc/gitlab/`  
			  ```bash
			  root@d44c48535c28:/# ls -al /etc/gitlab/
			  total 172
			  drwxrwxr-x 1 root root    322 Aug  4  2022 .
			  drwxr-xr-x 1 root root   1362 Aug  4  2022 ..
			  -rw------- 1 root root  19205 Sep 22 01:56 gitlab-secrets.json
			  -rw------- 1 root root 130379 Feb 12  2022 gitlab.rb
			  -rw------- 1 root root    505 Feb 10  2022 ssh_host_ecdsa_key
			  -rwxrwxrwx 1 root root    173 Feb 10  2022 ssh_host_ecdsa_key.pub
			  -rw------- 1 root root    399 Feb 10  2022 ssh_host_ed25519_key
			  -rwxrwxrwx 1 root root     93 Feb 10  2022 ssh_host_ed25519_key.pub
			  -rw------- 1 root root   2590 Feb 10  2022 ssh_host_rsa_key
			  -rwxrwxrwx 1 root root    565 Feb 10  2022 ssh_host_rsa_key.pub
			  drwxr-xr-x 1 root root      0 Feb 10  2022 trusted-certs
			  ```
			- Copy `gitlab.rb` and `gitlab-secrets.json`
			  ```bash
			  root@d44c48535c28:/# cp /etc/gitlab/gitlab.rb /var/opt/gitlab/backups/gitlab.rb
			  root@d44c48535c28:/# cp /etc/gitlab/gitlab-secrets.json /var/opt/gitlab/backups/gitlab-secrets.json
			  ```
	- ## Check backup
		- ```bash
		  root@d44c48535c28:/# ls -lart /var/opt/gitlab/backups/
		  total 2605248
		  -rw------- 1 git  git  1007308800 Aug  4  2022 1659582860_2022_08_04_14.7.2_gitlab_backup.tar
		  drwxr-xr-x 1 root root        506 Sep 22 01:56 ..
		  -rw------- 1 git  git  1660313600 Mar 18 04:49 1679114897_2023_03_18_15.0.4_gitlab_backup.tar
		  drwx------ 1 git  root        240 Mar 18 04:49 .
		  -rw------- 1 root root     130379 Mar 18 05:56 gitlab.rb
		  -rw------- 1 root root      19205 Mar 18 05:56 gitlab-secrets.json
		  ```
		- Pointshare@PointNAS:/$ sudo docker cp gitlab:/var/opt/gitlab/backups /volume2/Personal/Dino/
- # Update Gitlab in docker
  [Update Gitlab in docker - A code to remember (copdips.com)](https://copdips.com/2018/10/update-gitlab-in-docker.html)
	- ## Backup (important)
	  Refer to ((64153b91-5c7a-40a2-8298-a1019bc911fd))
	- ## Verify the docker container volumes
		- ```bash
		  Pointshare@PointNAS:/$ sudo docker container inspect -f "{{ json .HostConfig
		  .Binds }}" gitlab | python3 -m json.tool
		  Password:
		  [
		      "/volume1/gitlab/log:/var/log/gitlab",
		      "/volume1/gitlab/data:/var/opt/gitlab",
		      "/volume1/gitlab/config:/etc/gitlab"
		  ]
		  ```
		- ### Update Gitlab docker version
		  [GitLab Docker images | GitLab](https://docs.gitlab.com/ee/install/docker.html#upgrade-gitlab-to-newer-version)
			- Check previously specified options when creating the container
			  ```bash
			  root@PointNAS:~# docker container ps
			  CONTAINER ID   IMAGE                         COMMAND                  CREATED         STATUS                 PORTS                                                 NAMES
			  d92ed934028e   gitlab/gitlab-ce:latest       "/assets/wrapper"        8 hours ago     Up 7 hours (healthy)   443/tcp, 0.0.0.0:2222->22/tcp, 0.0.0.0:8080->80/tcp   gitlab
			  ```
			- Pull new image  
			  `sudo docker pull gitlab/gitlab-ce:latest`
			- Stop old container
			  `docker stop gitlab`
			- Remove old container
			  `docker rm gitlab`
			- Create the container with same options when creating the old one
			  ```bash
			  docker run --detach \
			  --publish 8080:80 --publish 2222:22 \
			  --name gitlab \
			  --restart always \
			  --volume /volume1/gitlab/log:/var/log/gitlab \
			  --volume /volume1/gitlab/data:/var/opt/gitlab \
			  --volume /volume1/gitlab/config:/etc/gitlab \
			  gitlab/gitlab-ce:latest
			  ```
	- ## Other Related links
		- [Upgrading GitLab | GitLab](https://docs.gitlab.com/ee/update/)
			- [Upgrading GitLab without downtime](https://docs.gitlab.com/ee/update/#upgrading-without-downtime)
		- [Back up and restore GitLab | GitLab](https://docs.gitlab.com/ee/raketasks/backup_restore.html)
		-