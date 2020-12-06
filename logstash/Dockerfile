ARG ELK_VERSION

# https://www.docker.elastic.co/
FROM docker.elastic.co/logstash/logstash:${ELK_VERSION}

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
# https://www.elastic.co/guide/en/logstash/current/filter-plugins.html
# Plugin pour filebeat
# RUN logstash-plugin install logstash-input-beats
# Plugin popur charger des patterns customs
# RUN logstash-plugin install logstash-filter-grok
# Plugin de chargement a partir d'une commande exec
# RUN logstash-plugin install logstash-input-exec
# Plugin de chargement a partir d'un appel http
# RUN logstash-plugin install logstash-input-http_poller
# Plugin json filter
RUN logstash-plugin install logstash-filter-json

# certs/keys for Beats and Lumberjack input
# RUN mkdir -p /etc/pki/tls/certs
# RUN mkdir -p /etc/pki/tls/private
# ADD ./logstash-beats.crt /etc/pki/tls/certs/logstash-beats.crt
# ADD ./logstash-beats.key /etc/pki/tls/private/logstash-beats.key
