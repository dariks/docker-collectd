FROM fr3nd/collectd

MAINTAINER Daniel Rippen <rippendaniel@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y python-pip libssl-dev python3-lxml python-lxml git curl && \
    curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

RUN git clone https://github.com/peckrob/collectd-unifi.git /opt/collectd-unifi && \
    cd /opt/collectd-unifi && npm install && \
    cp /opt/collectd-unifi/unifi.conf.sample /opt/collectd-unifi/unifi.conf

RUN rm -rf /var/lib/apt/lists/*
RUN pip install pyopenssl
RUN pip install fritzconnection fritzcollectd

