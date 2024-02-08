FROM remote-host

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y install nginx-1.12.2 openssl --enablerepo=nginx

RUN yum -y install yum-utils \
                   http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum-config-manager --enable remi-php71

RUN yum install -y php-fpm php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo


# RUN yum install -y https://repo.ius.io/ius-release-el7.rpm   && \
#                    php71u-fpm \
#                    php71u-cli    \
#                    php71u-mysqlnd    \
#                    php71u-soap    \
#                    php71u-xml    \
#                    php71u-zip    \
#                    php71u-json    \
#                    php71u-mcrypt    \
#                    php71u-mbstring    \
#                    php71u-zip    \
#                    php71u-gd    \
#                     --enablerepo=ius && yum clean all

EXPOSE 80 443
VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm
COPY ./conf/index.html /var/www/html/index.html
COPY ./conf/info.php /var/www/html/info.php
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./conf/start.sh /start.sh
RUN chmod +x /start.sh
CMD /start.sh