FROM docker.io/library/debian

LABEL description="test for  SABnabPlus "

MAINTAINER n24x

RUN \
	echo "deb http://deb.debian.org/debian buster  contrib non-free" >> /etc/apt/sources.list.d/contrib.list && \

	echo "deb http://deb.debian.org/debian-security/ buster/updates contrib non-free" >> /etc/apt/sources.list.d/contrib.list && \

	echo "deb http://deb.debian.org/debian buster-updates contrib non-free" >> /etc/apt/sources.list.d/contrib.list && \

	apt update && \
	apt-get -y install sabnzbdplus unzip && \
    	apt clean && \

    	rm -rf /tmp/* \
    	   /var/lib/apt/lists/* \
           /var/tmp/* && \
	useradd -s /bin/bash sabnzbd 
	
USER sabnzbd
EXPOSE 8080 
ENTRYPOINT ["/usr/bin/sabnzbdplus"]
CMD ["--browser","0","--console","--server",":8080"]
