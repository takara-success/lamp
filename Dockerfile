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
RUN yum -y localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm

RUN yum -y install wget yum-utils
RUN yum-config-manager --disable mysql57-community
RUN yum-config-manager --enable mysql56-community
RUN yum -y install --enablerepo=mysql56-community mysql-community-server mysql-community-devel
RUN yum -y install nginx
RUN yum -y install redis
RUN yum -y install openssh-server
RUN systemctl enable sshd
RUN systemctl enable nginx
RUN systemctl enable mysqld
RUN systemctl enable redis
RUN systemctl enable php-fpm
RUN echo "NETWORKING=yes" > /etc/sysconfig/network
RUN yum -y reinstall glibc-common
RUN localedef -f UTF-8 -i ja_JP ja_JP
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ADD asset/git-2.29.2.tar.gz /root
WORKDIR /root/git-2.29.2/
RUN yum -y install curl-devel
RUN yum -y install expat-devel
RUN make prefix=/ install


VOLUME ["/var/lib/mysql"]

CMD ["/sbin/init"]
