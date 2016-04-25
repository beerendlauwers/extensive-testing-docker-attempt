FROM centos:7
MAINTAINER "Beerend Lauwers" <beerendlauwers@gmail.com>
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

RUN yum install -y initscripts expect perl python unzip

COPY ExtensiveTesting-12.0.0.tar.gz /ExtensiveTesting-12.0.0.tar.gz

RUN mkdir /extensive-testing
RUN tar -zxf ExtensiveTesting-12.0.0.tar.gz -C /extensive-testing
RUN rm ExtensiveTesting-12.0.0.tar.gz

WORKDIR /extensive-testing/ExtensiveTesting-12.0.0
COPY custom_install.sh custom_install.sh
RUN ./custom_install.sh
RUN cat $PWD/install.log