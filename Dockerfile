FROM docker.io/library/debian

LABEL description="SABnzbd Container"

MAINTAINER n24x

RUN \ 
echo "deb http://deb.debian.org/debian buster  contrib non-free" >> /etc/apt/sources.list.d/contrib.list && \
echo "deb http://deb.debian.org/debian-security/ buster/updates contrib non-free" >> /etc/apt/sources.list.d/contrib.list && \
echo "deb http://deb.debian.org/debian buster-updates contrib non-free" >> /etc/apt/sources.list.d/contrib.list && \
apt update && \
apt-get -y install sabnzbdplus unzip && \
apt clean && \
rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* && \
useradd -d /mnt/sabnzbd_data sabnzbd  
	
	
USER sabnzbd
EXPOSE 8080 
ENTRYPOINT ["/usr/bin/sabnzbdplus"]
CMD ["--config-file","/mnt/sabnzbd_data","--browser","0","--console","--server",":8080"]
