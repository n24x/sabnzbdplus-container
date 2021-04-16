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
echo 'LANG="en_US.UTF-8"' >> /etc/default/locale && \
sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
locale-gen && \
mkdir /mnt/data && \
mkdir /mnt/data/watched
	
	
EXPOSE 8080 
#ENTRYPOINT ["/usr/bin/sabnzbdplus"]
CMD ["/usr/bin/sabnzbdplus", "--config-file","/mnt/data","--browser","0","--console","--server",":8080"]
