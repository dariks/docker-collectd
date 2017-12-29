FROM fr3nd/collectd

MAINTAINER Daniel Rippen <rippendaniel@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y python-pip libssl-dev python3-lxml python-lxml&& \
    apt-get clean

RUN rm -rf /var/lib/apt/lists/*
RUN pip install pyopenssl
RUN pip install fritzconnection fritzcollectd

