# https://github.com/elastic/elasticsearch-docker
FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.2.1

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu

RUN echo "PS1='\[\e[36;43m\]DOCKER ELASTICSEARCH\[\e[m\] ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /root/.bashrc
RUN echo "alias ll='ls -alF'" >> /root/.bashrc