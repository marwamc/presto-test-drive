MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -o errexit -o nounset -o pipefail -c
.SUFFIXES:

# SECTION: VARS
SERVICE_NAME := presto
CONTAINER_EXISTS := $(shell docker ps -a --format {{.Image}} | grep ${SERVICE_NAME})
CGET := curl -H "Content-Type: application/json" http://localhost:8083/ui


# ------------------------------------------------------------------------------------------------------------------
# SECTION: MANAGE PRESTO

start-service:
	docker-compose -f presto-service.yml up

stop-service:
	docker-compose -f presto-service.yml down

presto-shell:
	docker exec -it ${SERVICE_NAME} presto --catalog hive

hive-shell:
	docker exec -it hive-server bash

# ------------------------------------------------------------------------------------------------------------------
# SECTION: LOAD DATA

