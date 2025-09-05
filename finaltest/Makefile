HOME_DIR := $(shell echo $$HOME)
DOCKER_COMPOSE = srcs/docker-compose.yml

all: prepare
	@echo "\033[38;5;46mCreating and starting docker containers\033[0m"
	@docker compose -f $(DOCKER_COMPOSE) up --build -d > start.log
	@echo "\033[38;5;46mDockers succsefully created and started\033[0m"

prepare:
	@echo "\033[38;5;46mCreating directories for persistent storage\033[0m"
	@mkdir -p $(HOME_DIR)/data/mariadb
	@mkdir -p $(HOME_DIR)/data/wordpress

down:
	@rm -rf start.log
	@docker compose -f $(DOCKER_COMPOSE) down
	@echo "\033[38;5;226mAll containers are down\033[0m"

clean: down
	@docker rmi -f $(shell docker image ls -qa)
	@echo "\033[38;5;226mAll container images removed\033[0m"

evalclean:
	@docker stop $(shell docker ps -qa)
	@docker rm $(shell docker ps -qa)
	@docker rmi -f $(shell docker images -qa)
	@docker volume rm $(shell docker volume ls -q)
	@docker network rm inception
	@echo "\033[38;5;226mPerformed cleanup from evaluation sheet\033[0m"

fclean: down clean
	@docker volume rm $(shell docker volume ls -q)
	@echo "\033[38;5;226mFor complete cleanup please remove all contents of persisten storage at \033[1;38;5;196m$(HOME_DIR)/data/mariadb\033[0m \033[38;5;226mand \033[1;38;5;196m$(HOME_DIR)/data/wordpress\033[0m"

.PHONY: prepare all down clean fclean