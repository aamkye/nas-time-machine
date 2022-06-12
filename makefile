all: run
all-local: build run

build:
	docker build -f dockerfiles/avahi-dockerfile -t local/avahi:latest dockerfiles/
	docker build -f dockerfiles/samba-dockerfile -t local/samba:latest dockerfiles/

run-local:
	docker-compose -d -f docker-compose/local-docker-compose.yml up

run:
	docker-compose -d -f docker-compose/docker-compose.yml up

logs-local:
	docker-compose -f docker-compose/local-docker-compose.yml logs

logs:
	docker-compose -f docker-compose/docker-compose.yml logs

stop-local:
	docker-compose -f docker-compose/local-docker-compose.yml down
	docker-compose -f docker-compose/local-docker-compose.yml rm

stop:
	docker-compose -f docker-compose/docker-compose.yml down
	docker-compose -f docker-compose/docker-compose.yml rm
