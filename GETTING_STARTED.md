elasticsearch = Data Storage
filebeat      = Listener des logs
logstash      = ETL
kibana        = Dashboard

# Start docker

docker-compose up -d

# Create log

se connecter a une appli apache local pour générer un log apache
http://jarvis.loc/

# Create index pattern

Créer un pattern dans kibana

# Discover

# Kibana

http://localhost:5601/app/home#/?_g=()
* user: *elastic*
* password: *changeme*


# Elastic

 Show index
curl --user elastic:changeme -XGET localhost:9200/redmine-*

 Remove index
curl --user elastic:changeme -XDELETE localhost:9200/redmine-*

 Add index
 curl --user elastic:changeme -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/redmine/issues/_bulk?pretty' --data-binary @redmine-issues.json
