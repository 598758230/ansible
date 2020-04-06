FROM centos:centos7.4.1708
WORKDIR /home/
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.baK
ADD CentOS7-Base-163.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum -y install unzip
RUN yum -y install gcc-c++
RUN yum -y install libevent
RUN yum -y install perl perl-devel
RUN yum -y install gcc automake autoconf libtool make
RUN yum -y install pcre pcre-devel
RUN yum -y install zlib zlib-devel 
RUN yum -y install openssl openssl-devel
# libfastcommon-master.zip
ADD libfastcommon-master.zip /opt/
RUN cd /opt/ && unzip libfastcommon-master.zip
RUN cd /opt/libfastcommon-master && ./make.sh && ./make.sh install
RUN ln -s /usr/lib64/libfastcommon.so /usr/local/lib/libfastcommon.so
RUN ln -s /usr/lib64/libfdfsclient.so /usr/local/lib/libfdfsclient.so 

# tracker
ADD fastdfs-master.zip /opt/
RUN cd /opt/ && unzip fastdfs-master.zip
RUN cd /opt/fastdfs-master && ./make.sh && ./make.sh install
RUN cd /opt/fastdfs-master/conf && cp * /etc/fdfs/
RUN mkdir -p /home/fdfs/tracker && mkdir -p /home/fdfs/storage && mkdir -p /home/fdfs/fastdf0

ADD tracker.conf /etc/fdfs/tracker.conf
ADD storage.conf /etc/fdfs/storage.conf
#NGINX
ADD fastdfs-nginx-module-master.zip /opt/
ADD nginx-1.8.0.tar.gz /opt/
RUN cd /opt && unzip fastdfs-nginx-module-master.zip
RUN cd /opt/nginx-1.8.0 && ./configure --prefix=/usr/local/nginx --add-module=/opt/fastdfs-nginx-module-master/src && make && make install
RUN ln -s /home/fdfs/fastdf0 /home/fdfs/fastdf0/M00

ADD mod_fastdfs.conf /etc/fdfs/mod_fastdfs.conf
ADD client.conf /etc/fdfs/client.conf
ADD nginx.conf /usr/local/nginx/conf/nginx.conf

ADD start.sh /usr/bin/start.sh
RUN chmod 777 /usr/bin/start.sh

ENTRYPOINT ["/usr/bin/start.sh"]
