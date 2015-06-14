FROM ubuntu:trusty

MAINTAINER cocker

# Modify policy-rc.d
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

# Update Ubuntu
RUN apt-get -y update

# Install unzip
RUN apt-get -y install unzip



# Setup Apache
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2 libapache2-mod-php5 php5-mysql php5-gd php-pear php-apc php5-curl curl lynx-cur
RUN a2enmod php5
RUN a2enmod rewrite

ENV APACHE_SERVER_NAME localhost

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND
