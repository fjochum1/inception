SHELL=/bin/bash -e

all:	build up

up:
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

build:
	mkdir -p ${HOME}/data/mariadb
	mkdir -p ${HOME}/data/wordpress
	docker compose -f srcs/docker-compose.yml build

clean: 	down
	docker system prune -af

fclean:	clean
	rm -rf ${HOME}/data/mariadb
	rm -rf ${HOME}/data/wordpress

re:	clean
	make all

.PHONY: all build up down run clean fclean re
