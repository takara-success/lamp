FROM centos:7

MAINTAINER takara

RUN yum -y update
RUN yum -y groupinstall "Development Tools"
RUN yum -y install epel-release
# PHP 7.2
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum -y install --enablerepo=remi,remi-php72 php php-devel php-bcmath php-gd php-mbstring php-mcrypt php-mysqli php-pdo php-pear \
	php-pecl-amqp php-pecl-apcu php-pecl-apcu-devel php-pecl-memcache php-pecl-redis php-pecl-zip php-process php-fpm php-opcache
# mysql
RUN yum -y localinstall http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm
RUN yum -y install wget yum-utils
RUN yum-config-manager --disable mysql57-community
RUN yum-config-manager --enable mysql56-community
RUN yum -y install --enablerepo=mysql56-community mysql-community-server mysql-community-devel
RUN yum -y install nginx
RUN yum -y install redis
RUN systemctl enable nginx
RUN systemctl enable mysqld
RUN systemctl enable redis
RUN systemctl enable php-fpm


VOLUME ["/var/lib/mysql"]

CMD ["/sbin/init"]
