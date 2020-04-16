MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -o errexit -o nounset -o pipefail -c
.SUFFIXES:

# SECTION: VARS
SERVICE_NAME := presto
CONTAINER_EXISTS := $(shell docker ps -a --format {{.Image}} | grep ${SERVICE_NAME})


# ------------------------------------------------------------------------------------------------------------------
# SECTION: MANAGE PRESTO
network-show:
	docker network list

clean:
	docker system prune -a

start:
	docker-compose -f presto-service.yml up -d
	$(MAKE) network-show

stop:
	docker-compose -f presto-service.yml down

shell:
	docker exec -it ${SERVICE_NAME} bash

# ------------------------------------------------------------------------------------------------------------------
# SECTION: QUERIES

inspect:
	docker exec -it ${SERVICE_NAME} presto --debug -f /app/queries/inspect.sql --output-format JSON

postgres-check:
	docker exec -it postgres psql -eb -U postgres -d presto_db -x -c \
	"SELECT * FROM pg_catalog.pg_tables limit 5"

# ------------------------------------------------------------------------------------------------------------------
# SECTION: DOC

network-show:
	docker network list
	docker network inspect presto-n
	docker exec -it presto ping postgres -v -c 5
