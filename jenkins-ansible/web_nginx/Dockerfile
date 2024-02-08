FROM remote-host

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y install nginx-1.12.2 openssl \
    --enablerepo=nginx

EXPOSE 80 443
VOLUME /var/www/html /var/log/nginx
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./conf/start.sh /start.sh
RUN chmod +x /start.sh
CMD /start.sh
# CMD /usr/sbin/sshd -D