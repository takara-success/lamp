FROM centos:8

MAINTAINER takara

RUN yum -y update
RUN yum -y install php
RUN yum -y install mysql-server
RUN yum -y install nginx
RUN systemctl enable nginx
RUN systemctl enable mysqld

RUN yum -y install wget

VOLUME ["/var/lib/mysql"]

CMD ["/sbin/init"]
