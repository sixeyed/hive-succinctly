FROM sixeyed/hadoop-succinctly
MAINTAINER Elton Stoneman <elton@sixeyed.com>

ENV HIVE_HOME=/opt/hive

RUN mkdir /hive-setup
WORKDIR /hive-setup

ADD install-hive.sh /hive-setup/
RUN ./install-hive.sh

ADD hive-site.xml /opt/hive/conf/hive-site.xml
# dependencies from:
#   hbase mapredcp | tr ':' '\n'
#ADD ./dependencies/ /opt/hive/lib/
RUN mkdir /opt/hive/auxlib/
ADD ./dependencies/ /opt/hive/auxlib/

ADD setup-auxlib.sh /hive-setup/
RUN ./setup-auxlib.sh

# Hive
EXPOSE 9999
EXPOSE 10000
EXPOSE 10002
EXPOSE 50111
EXPOSE 8080

ENV PATH=$PATH:/opt/hive/bin
ENV HIVE_AUX_JARS_PATH=/opt/hive/auxlib

# run servers:
ADD start-servers.sh /opt/hive/bin/start-servers.sh
CMD /opt/hive/bin/start-servers.sh