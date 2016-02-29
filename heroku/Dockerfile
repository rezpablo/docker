FROM rezpablo/debian_base
MAINTAINER Pablo Rezende Silva <rezpablo@gmail.com>

RUN apt-get install -y wget

COPY /install /tmp/

RUN sh /tmp/install-ubuntu.sh && rm /tmp/install-ubuntu.sh
RUN heroku
RUN chmod 0600 /root/.netrc
