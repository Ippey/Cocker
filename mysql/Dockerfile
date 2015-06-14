FROM ubuntu:trusty

MAINTAINER cocker

# Modify policy-rc.d
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

# Security update
#RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ quantal-updates main restricted" >> /etc/apt/sources.list
#RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ quantal-updates main restricted" >> /etc/apt/sources.list
RUN apt-get update

# Hack initctl
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

#RUN apt-get -y install python-setuptools
#RUN easy_install supervisor
#RUN mkdir -p /var/log/supervisor

# Setup MySQL
RUN apt-get install -y -o Dpkg::Options::="--force-confold" mysql-common
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y mysql-server
RUN apt-get clean
RUN rm -rf /var/lib/mysql

VOLUME ["/var/lib/mysql"]

# MySQL config
RUN sed -i -e "s/,STRICT_TRANS_TABLES//" /etc/mysql/my.cnf
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
#RUN (/usr/bin/mysqld_safe &); sleep 10; mysqladmin -u root password 'passw0rd'; (echo 'grant all privileges on *.* to root@"%" identified by "passw0rd" with grant option;' | mysql -u root -ppassw0rd)
#RUN (/usr/bin/mysqld_safe &); sleep 3; echo "grant all privileges on *.* to root@'%';" | mysql -u root -ppassword

ADD launch /launch
RUN chmod 755 /launch

EXPOSE 3306

CMD ["/launch"]
#CMD ["/usr/bin/mysqld_safe"]
#CMD ["supervisord", "-n"]
