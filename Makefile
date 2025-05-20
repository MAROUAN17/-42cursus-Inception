all: build

ubuild:
	cd srcs && docker compose build --no-cache

build:
	cd srcs && docker compose build

run:
	cd srcs && docker compose up -d

fclean:
	sudo rm -rf ~/data/wp-data/* ~/data/db-data/* ~/data/portainer-data/* && cd srcs && docker compose down --rmi all -v 

down:
	cd srcs && docker compose down --rmi all

restart:
	cd srcs && docker compose restart

stop:
	cd srcs && docker compose stop

start:
	cd srcs && docker compose start

re:
	make fclean && make build && make run

cache:
	docker system prune

.PHONY: build down run
