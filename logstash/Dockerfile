ARG ELK_VERSION

# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash-oss:${ELK_VERSION}

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
# https://www.elastic.co/guide/en/logstash/current/filter-plugins.html
# Plugin pour filebeat
RUN logstash-plugin install logstash-input-beats
# Plugin popur charger des patterns customs
RUN logstash-plugin install logstash-filter-grok
# Plugin redmine
RUN logstash-plugin install logstash-filter-grok

# certs/keys for Beats and Lumberjack input
RUN mkdir -p /etc/pki/tls/certs
RUN mkdir -p /etc/pki/tls/private
ADD ./logstash-beats.crt /etc/pki/tls/certs/logstash-beats.crt
ADD ./logstash-beats.key /etc/pki/tls/private/logstash-beats.key