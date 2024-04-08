# Variables
DOCKER_COMPOSE = docker-compose
PHP_CONTAINER = php
SYMFONY_CONSOLE = bin/console
BUILD-PHP=docker-compose run --rm -e HOST_USER_ID=$(HOST_USER_ID) -w /var/www/code symfony_php /bin/sh -c

# Targets
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  help              : Display this help message"
	@echo "  build             : Build the Docker container"
	@echo "  up                : Start the Docker container"
	@echo "  down              : Stop the Docker container"
	@echo "  composer-install  : Install PHP dependencies with Composer"
	@echo "  cache-clear       : Clear Symfony cache"
	@echo "  doctrine-migrate  : Run Doctrine database migrations"

build:
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

composer-install:
	$(DOCKER_COMPOSE) exec $(PHP_CONTAINER) composer install

composer-update:
	$(BUILD-PHP) "php ./composer.phar update $(MODULE)"

cache-clear:
	$(BUILD-PHP) "php $(SYMFONY_CONSOLE) cache:clear"

start:
	docker exec -it symfony_php symfony server:start -vv

stop:
	$(BUILD-PHP) "symfony server:stop"

logs:
	docker exec -it symfony_php symfony console debug:router

generate:
	docker exec -it symfony_php symfony console $(COMMAND)

create:
	$(BUILD-PHP) "php ./composer.phar create-project symfony/skeleton:"7.0.*" my_project"

doctrine:
	docker exec -it symfony_php symfony console doctrine:database:create
