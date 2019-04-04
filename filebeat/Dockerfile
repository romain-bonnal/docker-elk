ARG ELK_VERSION

# https://github.com/elastic/beats-docker
FROM docker.elastic.co/beats/filebeat:${ELK_VERSION}

# https://www.elastic.co/guide/en/beats/filebeat/current/running-on-docker.html

# Add your filebeat plugins setup here
# Example: RUN kibana-plugin install <name|url>
# RUN ./filebeat modules enable apache2
# RUN ./filebeat modules list
# RUN ./filebeat setup -e