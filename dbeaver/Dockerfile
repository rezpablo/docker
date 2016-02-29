FROM rezpablo/openjdk8
MAINTAINER Pablo Rezende Silva <rezpablo@gmail.com>

RUN apt-get install -y wget
RUN wget http://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb
RUN dpkg -i dbeaver-ce_latest_amd64.deb && rm dbeaver-ce_latest_amd64.deb

CMD ["dbeaver"]
