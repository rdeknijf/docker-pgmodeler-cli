FROM ubuntu:xenial
LABEL maintainer "rutger@deknijf.com"

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

ENV PGM_VERSION "0.9.0-beta1"

RUN mkdir -p /usr/local/src/pgmodeler
WORKDIR "/usr/local/src/pgmodeler"
RUN wget https://github.com/pgmodeler/pgmodeler/archive/v$PGM_VERSION.tar.gz && \
        tar -xzvf v$PGM_VERSION.tar.gz  && \
        rm -f v$PGM_VERSION.tar.gz

RUN cd /usr/local/src/pgmodeler/pgmodeler-$PGM_VERSION/ && qmake pgmodeler.pro && make && make install

ENV QT_QPA_PLATFORM=offscreen

CMD /usr/local/bin/pgmodeler-cli
