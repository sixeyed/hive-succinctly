FROM java:7
MAINTAINER Elton Stoneman <elton@sixeyed.com>

ENV JAVA_HOME=/usr
ENV HADOOP_HOME=/opt/hadoop
ENV HIVE_HOME=/opt/hive

RUN mkdir /hive-setup
WORKDIR /hive-setup

ADD install-hive.sh /hive-setup/
RUN ./install-hive.sh

ADD hive-site.xml /opt/hive/conf/hive-site.xml
ADD ./dependencies/ /opt/hive/lib/
ADD start-hive-servers.sh /opt/hive/bin/start-hive-servers.sh

# Servers
EXPOSE 9999
EXPOSE 10000
EXPOSE 10002
EXPOSE 50111
EXPOSE 8080

ENV PATH=$PATH:/opt/hive/bin:/opt/hadoop/bin
ENV HIVE_AUX_JARS_PATH=/opt/hive/lib

# run servers:
CMD /opt/hive/bin/start-hive-servers.sh