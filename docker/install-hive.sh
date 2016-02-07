#! /bin/bash

wget --quiet http://mirrors.ukfast.co.uk/sites/ftp.apache.org/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz
tar xzf apache-hive-1.2.1-bin.tar.gz -C /opt/
ln -s /opt/apache-hive-1.2.1-bin /opt/hive
rm apache-hive-1.2.1-bin.tar.gz