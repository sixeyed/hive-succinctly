FROM java:7
MAINTAINER Elton Stoneman <elton@sixeyed.com>

ENV JAVA_HOME=/usr
ENV HADOOP_HOME=/opt/hadoop
ENV HIVE_HOME=/opt/hive

RUN mkdir /hive-setup
WORKDIR /hive-setup

ADD install-hive.sh /hive-setup/
RUN ./install-hive.sh

# TODO - ADD hive-site.xml /opt/hive/conf/hive-site.xml
ADD start-hive-servers.sh /opt/hive/bin/start-hive-servers.sh

# Servers
EXPOSE 10000
EXPOSE 50111

ENV PATH=$PATH:/opt/hive/bin:/opt/hadoop/bin

# run servers:
CMD /opt/hive/bin/start-hive-servers.sh