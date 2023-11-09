FROM ubuntu:bionic-20220531

# Must be root to install the packages
USER root

# Install required deps
RUN apt update
RUN apt -y install gnupg wget apt-transport-https coreutils java-common

# Install ARM Amazon JDK
RUN wget https://corretto.aws/downloads/latest/amazon-corretto-8-aarch64-linux-jdk.deb -O amazon-jdk.deb
RUN dpkg --skip-same-version -i amazon-jdk.deb
RUN rm amazon-jdk.deb

workdir /usr

# add a non root user
run useradd -m elasticuser

# download extras
run apt update
run apt install -y curl nano

# download elasticsearch
run curl https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.0.tar.gz --output elasticsearch-5.6.0.tar.gz
run tar -xvf elasticsearch-5.6.0.tar.gz

# add config
add config/elasticsearch.yml /usr/elasticsearch-5.6.0/config/elasticsearch.yml
add config/jvm.options /usr/elasticsearch-5.6.0/config/jvm.options

#add system.conf /etc/sysctl.d/elasticsearch.conf

run chown -R elasticuser: .
user elasticuser

run cd elasticsearch-5.6.0/bin
run chown -R elasticuser: elasticsearch-5.6.0

expose 9200 9300
cmd cd /usr/elasticsearch-5.6.0/bin/ && ./elasticsearch