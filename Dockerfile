FROM centos:6
RUN yum -y install mysql-server
ADD ./startup.sh /usr/local/sbin
CMD /usr/local/sbin/startup.sh
