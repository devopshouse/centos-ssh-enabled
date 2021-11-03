FROM centos

LABEL author="DevOpsHouse"
LABEL version="1.0"
LABEL description="SSH Enabled CentOS Image for Test and Dev purposes ONLY!"
LABEL note="THIS IMAGE IS TO BE USED FOR TEST AND LEARNIGN PURPOSES ONLY! NOT TO BE USED IN A PRODUCTION ENVIRONMENT!"

RUN yum update -y && yum install -y openssh-server net-tools python3 bind-utils
RUN mkdir /var/run/sshd
RUN echo 'root:Passw0rd' | chpasswd

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Generating rsa keypair
RUN /usr/bin/ssh-keygen -A

# Removing nologin messsage
RUN rm -rf /run/nologin

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
