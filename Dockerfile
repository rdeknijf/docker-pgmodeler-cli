FROM ubuntu:xenial
MAINTAINER Rutger de Knijf <rutger@deknijf.com>

RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config\
    wget \
    qt5-default \
    qt5-qmake \
    libpq5 \
    libxml2 \
    pkg-config \
    xml2 \
    libxml2-dev \
    libpq-dev \
    libqt5svg5-dev \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/src/pgmodeler
WORKDIR "/usr/local/src/pgmodeler"
RUN wget https://github.com/pgmodeler/pgmodeler/archive/v0.9.0-beta1.tar.gz && \
        tar -xzvf v0.9.0-beta1.tar.gz  && \
        rm -f v0.9.0-beta1.tar.gz

RUN cd /usr/local/src/pgmodeler/pgmodeler-0.9.0-beta1/ && qmake pgmodeler.pro && make && make install

ENV QT_QPA_PLATFORM=offscreen

#CMD /bin/bash
CMD /usr/local/bin/pgmodeler-cli --input /usr/share/terrible2/db/terrible.dbm --export-to-file --output /usr/share/terrible2/db/terrible.sql
