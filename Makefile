### THIS IST THE VERSION WITH docker-compose

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help



# DOCKER TASKS

# Build the container
build: ## Build the release and develoment container. The development
	docker-compose build --no-cache
	docker-compose run  grunt build
	docker build -t .

run: stop ## Run container on port configured in `config.env`
	docker run -i -t --rm --env-file=./config.env -p=$(PORT):$(PORT) --name="$(APP_NAME)" $(APP_NAME)

dev: ## Run container in development mode
	docker-compose build --no-cache $(APP_NAME) && docker-compose run $(APP_NAME)

# Build and run the container
up: ## Spin up the project
	docker-compose up -d --build $(APP_NAME)

down: ## Spin up the project
	docker-compose down --build $(APP_NAME)

stop: ## Stop running containers
	docker stop $(APP_NAME)

rm: stop ## Stop and remove running containers
	docker rm $(APP_NAME)

clean: ## Clean the generated/compiles files
	echo "nothing clean ..."

service=elasticsearch
shell=/bin/bash
enter: ## Enter in docker
	docker exec -it docker-elk_$(service)_1 $(shell)

ps: ## Liste des docker ouvert
	docker-compose ps