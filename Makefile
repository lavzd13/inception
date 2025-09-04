HOME_DIR := $(shell echo $$HOME)
DOCKER_COMPOSE = srcs/docker-compose.yml

all: prepare
	docker compose -f $(DOCKER_COMPOSE) up --build -d

prepare:
	mkdir -p $(HOME_DIR)/data/mariadb
	mkdir -p $(HOME_DIR)/data/wordpress

down:
	docker compose down

clean: down
	docker rmi -f $(shell docker image ls -qa)

fclean: down clean
	sudo rm -rf $(HOME_DIR)/data/mariadb/*
	sudo rm -rf $(HOME_DIR)/data/wordpress/*

.PHONY: prepare all down clean fclean