all: build

build:
	cd srcs && docker-compose build --no-cache

down:
	cd srcs && docker-compose down --rmi all

up:
	cd srcs && docker-compose up -d

fclean:
	cd srcs && docker-compose down --rmi all -v

restart:
	cd srcs && docker-compose restart

.PHONY: build down up