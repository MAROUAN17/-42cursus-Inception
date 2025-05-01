all: build

build:
	cd srcs && docker-compose build --no-cache

down:
	cd srcs && docker-compose down --rmi all -v

up:
	cd srcs && docker-compose up -d


.PHONY: build down up