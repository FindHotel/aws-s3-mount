FROM phusion/baseimage:0.9.18
MAINTAINER Anatoly Bubenkov "bubenkoff@gmail.com"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -q && apt-get install -y python-pip fuse \
	&& apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN pip install yas3fs
RUN sed -i'' 's/^# *user_allow_other/user_allow_other/' /etc/fuse.conf # uncomment user_allow_other
RUN chmod a+r /etc/fuse.conf # make it readable by anybody, it is not the default on Ubuntu
VOLUME /mnt
ADD run.sh /
CMD ["/run.sh"]
