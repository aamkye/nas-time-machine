all: run
all-local: build run

build:
	docker build -f dockerfiles/avahi-dockerfile -t local/avahi:latest dockerfiles/
	docker build -f dockerfiles/samba-dockerfile -t local/samba:latest dockerfiles/

run-local:
	docker-compose \
		-f docker-compose/base-docker-compose.yml \
		-f docker-compose/local.yml \
		up -d

run:
	docker-compose \
		-f docker-compose/base-docker-compose.yml \
		-f docker-compose/public.yml \
		up -d

logs-local:
	docker-compose \
		-f docker-compose/base-docker-compose.yml \
		-f docker-compose/local.yml \
		logs

logs:
	docker-compose \
		-f docker-compose/base-docker-compose.yml \
		-f docker-compose/public.yml \
		logs

stop-local:
	docker-compose \
		-f docker-compose/base-docker-compose.yml \
		-f docker-compose/local.yml \
		down
	docker-compose \
		-f docker-compose/base-docker-compose.yml \
		-f docker-compose/local.yml \
		rm

stop:
	docker-compose \
		-f docker-compose/base-docker-compose.yml \
		-f docker-compose/public.yml \
		down
	docker-compose \
		-f docker-compose/base-docker-compose.yml \
		-f docker-compose/public.yml \
		rm
