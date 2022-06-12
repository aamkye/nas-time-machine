all: build

build:
	docker build -f avahi-dockerfile -t local/avahi:latest .
	docker build -f samba-dockerfile -t local/samba:latest .

run:
	docker-compose up -d

logs:
	docker-compose logs

stop:
	docker-compose down
	docker-compose rm
