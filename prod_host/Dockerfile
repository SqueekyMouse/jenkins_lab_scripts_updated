FROM centos:7

RUN yum -y install initscripts openssh-server
RUN useradd prod_user && \
    echo "1234" | passwd prod_user --stdin && \
    mkdir /home/prod_user/.ssh && \
    chmod 700 /home/prod_user/.ssh 

COPY remote-key.pub /home/prod_user/.ssh/authorized_keys

RUN chown -R prod_user:prod_user /home/prod_user/.ssh/ && \
    chmod 600 /home/prod_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

RUN yum install -y yum-utils && \
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    yum install -y docker-ce docker-compose-plugin 

RUN groupmod -g 970 docker && \
    usermod -aG docker prod_user

# for scp!!!
RUN yum -y install openssh-clients

CMD /usr/sbin/sshd -D
