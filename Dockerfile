FROM centos:7

MAINTAINER takara

RUN yum -y update
RUN yum -y install epel-release
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum -y install https://dev.mysql.com/get/mysql80-community-release-el7-2.noarch.rpm
RUN yum -y install wget
RUN yum -y groupinstall "Development Tools"
RUN yum -y install --enablerepo=mysql56-community mysql-community-server mysql-community-devel mysql-utilities
RUN yum -y install --enablerepo=remi,remi-php72 php php-devel php-bcmath php-gd php-mbstring php-mcrypt php-mysqli php-pdo php-pear \
	php-pecl-amqp php-pecl-apcu php-pecl-apcu-devel php-pecl-memcache php-pecl-redis php-pecl-zip php-process php-fpm php-opcache
RUN yum -y install nginx
RUN yum -y install redis
RUN systemctl enable nginx
RUN systemctl enable mysqld
RUN systemctl enable redis
RUN systemctl enable php-fpm


VOLUME ["/var/lib/mysql"]

CMD ["/sbin/init"]
