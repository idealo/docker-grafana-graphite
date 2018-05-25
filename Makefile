# docker-grafana-graphite makefile

# Environment Varibles
CONTAINER = kamon-grafana-dashboard

.PHONY: up

prep :
	mkdir -p \
		data/whisper \
		data/elasticsearch \
		data/grafana \
		log/graphite \
		log/graphite/webapp \
		log/elasticsearch

pull :
	docker-compose pull

build :
	docker-compose build

up : prep build
	docker-compose up -d

down :
	docker-compose down

shell :
	docker exec -ti $(CONTAINER) /bin/bash

tail :
	docker logs -f $(CONTAINER)
