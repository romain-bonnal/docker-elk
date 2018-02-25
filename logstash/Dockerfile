# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash-oss:6.2.1

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
# RUN logstash-plugin install logstash-filter-json
RUN logstash-plugin install logstash-input-beats

# certs/keys for Beats and Lumberjack input
RUN mkdir -p /etc/pki/tls/certs
RUN mkdir -p /etc/pki/tls/private
ADD ./logstash-beats.crt /etc/pki/tls/certs/logstash-beats.crt
ADD ./logstash-beats.key /etc/pki/tls/private/logstash-beats.key