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

# Don't run build by default, it might be very costly
# if the data/ directory is already populated (everything's
# sent to the dockerd!). If you must build, then clone the
# repository into an empty directory (e.g. in /tmp) and run
# "make build" there.
up : prep
	docker-compose up -d

down :
	docker-compose down

shell :
	docker exec -ti $(CONTAINER) /bin/bash

tail :
	docker logs -f $(CONTAINER)
