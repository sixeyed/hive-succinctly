FROM java:7
MAINTAINER Elton Stoneman <elton@sixeyed.com>

ENV JAVA_HOME=/usr
ENV HADOOP_HOME=/opt/hadoop
ENV HIVE_HOME=/opt/hive

RUN mkdir /hive-setup
WORKDIR /hive-setup

ADD install-hive.sh /hive-setup/
RUN ./install-hive.sh

ADD ssh.config /root/.ssh/config
ADD setup-ssh.sh /hive-setup/


ADD hive-site.xml /opt/hive/conf/hive-site.xml
ADD ./dependencies/ /opt/hive/lib/
ADD start-hive-servers.sh /opt/hive/bin/start-hive-servers.sh

ADD core-site.xml /opt/hadoop/etc/hadoop/core-site.xml
ADD hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml
ADD mapred-site.xml /opt/hadoop/etc/hadoop/mapred-site.xml
ADD yarn-site.xml /opt/hadoop/etc/hadoop/yarn-site.xml
ADD hadoop-env.sh /opt/hadoop/etc/hadoop/hadoop-env.sh

RUN ./setup-ssh.sh

# Hadoop
EXPOSE 22
EXPOSE 50070
EXPOSE 9000
EXPOSE 8088

# Hive
EXPOSE 9999
EXPOSE 10000
EXPOSE 10002
EXPOSE 50111
EXPOSE 8080

ENV PATH=$PATH:/opt/hive/bin:/opt/hadoop/bin
ENV HIVE_AUX_JARS_PATH=/opt/hive/lib

# run servers:
CMD /opt/hive/bin/start-hive-servers.sh