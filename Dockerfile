# from official image
FROM ubuntu:16.04

# key-value pairs
# allow more than one
#
LABEL version="1.0"

# install package
RUN apt-get update 
#RUN apt-get install -y openvpn ca-certificates curl wget unzip net-tools nano iputils-ping psmisc libwrap0 libwrap0-dev gcc make
RUN apt-get install -y openvpn ca-certificates curl wget unzip net-tools nano iputils-ping psmisc libwrap0 libwrap0-dev dante-server
RUN rm -rf /var/lib/apt/lists/*

# openvpn
RUN wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
RUN unzip ovpn.zip -d /etc/openvpn
RUN rm ovpn.zip

# sshd
#RUN mkdir /var/run/sshd
#RUN echo 'root:root' |chpasswd
#RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

# socks5
#ENV DANTE_VER 1.4.2
#ENV DANTE_URL https://www.inet.no/dante/files/dante-$DANTE_VER.tar.gz
#ENV DANTE_SHA baa25750633a7f9f37467ee43afdf7a95c80274394eddd7dcd4e1542aa75caad
#ENV DANTE_FILE dante.tar.gz
#ENV DANTE_TEMP dante
#ENV DANTE_DEPS build-essential curl
#
#RUN set -xe \
#    && apt-get update \
#    && apt-get install -y $DANTE_DEPS \
#    && mkdir $DANTE_TEMP \
#        && cd $DANTE_TEMP \
#        && curl -sSL $DANTE_URL -o $DANTE_FILE \
#        && echo "$DANTE_SHA *$DANTE_FILE" | shasum -c \
#        && tar xzf $DANTE_FILE --strip 1 \
#        && ./configure \
#        && make install \
#        && cd .. \
#        && rm -rf $DANTE_TEMP \
#    && apt-get purge -y --auto-remove $DANTE_DEPS \
#    && rm -rf /var/lib/apt/lists/*

#COPY sockd.sh /usr/local/bin/
COPY danted.conf /etc/
EXPOSE 1080

COPY nordvpn.sh /usr/bin/
#provide defaults for an executing container.
CMD nordvpn.sh


# list on port 22
#EXPOSE 22




