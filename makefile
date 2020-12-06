.SILENT:

# Setup —————————————————————————————————————————————————————————————————————————
DOCKER          = docker
DOCKER-COMPOSE  = docker-compose
DOCKER-ELASTIC  = docker-elk_elasticsearch_1
DOCKER-KIBANA   = docker-elk_kibana_1
DOCKER-LOGSTASH = docker-elk_logstash_1

LOGSTASH = docker exec --tty=true -w /usr/share/logstash -i $(DOCKER-LOGSTASH)

PARAM = $(filter-out $@,$(MAKECMDGOALS))

.DEFAULT_GOAL := help

##
## —— The OPPBTP Make file  ——————————————————————————————————
##

help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##
## Docker
## -----------------
##
docker-up: ## Docker up and build
	$(DOCKER-COMPOSE) up -d --build --force-recreate

docker-watch: ## Docker up, build and watch
	$(DOCKER-COMPOSE) up --build --force-recreate

docker-down: ## Docker down
	$(DOCKER-COMPOSE) down --remove-orphans	

dosker-ps: ## Liste des docker ouvert
	$(DOCKER-COMPOSE) ps

docker-down-all: ## Docker down all docker containers
	$(DOCKER) stop `docker ps -a -q`

docker-enter-elastic: ## Enter in docker elastic
	$(DOCKER) exec -it $(DOCKER-ELASTIC) /bin/bash

docker-enter-logstash: ## Enter in docker logstash
	$(DOCKER) exec -it $(DOCKER-LOGSTASH) /bin/bash

docker-enter-kibana: ## Enter in docker kibana
	$(DOCKER) exec -it $(DOCKER-KIBANA) /bin/bash

##
## Logstash
## -----------------
##

logstash-force: ## exec force logstash (l'option path.data permet de forcer la création d'une instance logstash)
	# $(LOGSTASH) logstash -r -f /usr/share/logstash/pipeline/logstash_file_to_stdout.conf --path.data /tmp
	$(LOGSTASH) logstash -r -f /usr/share/logstash/pipeline/logstash_mpg_file_to_elastic.conf --path.data /tmp

