all: build

ubuild:
	cd srcs && docker-compose build --no-cache

build:
	cd srcs && docker-compose build

run:
	cd srcs && docker-compose up -d

fclean:
	cd srcs && docker-compose down --rmi all -v

restart:
	cd srcs && docker-compose restart

stop:
	cd srcs && docker-compose stop

start:
	cd srcs && docker-compose start

.PHONY: build down up