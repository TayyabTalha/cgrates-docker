FROM debian:latest
MAINTAINER Muhammad Tayyab Talha, mtayyabtalha@gmail.com

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get upgrade -y \
&& apt-get install wget rsyslog -y \
&& cd /tmp \
&& wget http://www.cgrates.org/tmp_pkg/cgrates_0.9.1~rc8_amd64.deb \
&& dpkg -i cgrates_0.9.1~rc8_amd64.deb \
# cleanup
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

# set start command
ENTRYPOINT ["/opt/entrypoint.sh"]
