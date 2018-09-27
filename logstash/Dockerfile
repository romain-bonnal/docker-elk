# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash-oss:6.2.1

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
# https://www.elastic.co/guide/en/logstash/current/filter-plugins.html
# Plugin pour filebeat
RUN logstash-plugin install logstash-input-beats
# Plugin popur charger des patterns customs
RUN logstash-plugin install logstash-filter-grok
RUN logstash-plugin install logstash-input-jdbc

# Dépendance
RUN curl https://downloads.mysql.com/archives/get/file/mysql-connector-java-5.1.33.tar.gz --output mysql-connector-java-5.1.33.tar.gz | \
    tar zxf mysql-connector-java-5.1.33.tar.gz
# RUN ls -l
# RUN tar zxf /opt/mysql-connector-java-5.1.45.tar.gz
    # ls -l /usr/share/

# certs/keys for Beats and Lumberjack input
RUN mkdir -p /etc/pki/tls/certs
RUN mkdir -p /etc/pki/tls/private
ADD ./logstash-beats.crt /etc/pki/tls/certs/logstash-beats.crt
ADD ./logstash-beats.key /etc/pki/tls/private/logstash-beats.key