# centos-ssh-enabled
NOTE: THIS IMAGE IS TO BE USED FOR TEST AND LEARNIGN PURPOSES ONLY! NOT TO BE USED IN A PRODUCTION ENVIRONMENT!

SSH Enabled CentOS Image for Test and Dev purposes ONLY!

## Use:

### Runing the container using dockerhub image

```docker run -d --name centos devopshouse/centos-ssh-enabled```

Identify the Internal IP

```docker inspect centos -f '{{ .NetworkSettings.IPAddress }}'```

SSH

```ssh root@<container-ip>```

**Username:** root

**Password:** Passw0rd

### Building and running your local image
Clone the git repo

```
git clone https://github.com/devopshouse/centos-ssh-enabled.git
cd centos-ssh-enabled
docker image build -t centos-ssh-enabled .
docker run -d --name centos centos-ssh-enabled
```

Follow the same steps from before to get the container internal ip address

### If you are running MacOS or other operation system that acessing the internal IP is not possible:

```docker run -d --name centos -p 6069:22 devopshouse/centos-ssh-enabled```

SSH to the local port

```ssh root@localhost -p 6069```


Based on : https://docs.docker.com/engine/examples/running_ssh_service/
