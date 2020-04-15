MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -o errexit -o nounset -o pipefail -c
.SUFFIXES:

# SECTION: VARS
PROJ_NAME := apicurio-registry

SERVICE_IS_RUNNING := $(shell docker ps --format {{.Image}} | grep peg_etl)

# ------------------------------------------------------------------------------------------------------------------
# SECTION: MANAGE REGISTRY
start-presto:
	docker run -d -p 8083:8080 --name presto starburstdata/presto

stop-presto:
	docker stop presto

# ------------------------------------------------------------------------------------------------------------------
# SECTION: INSPECT REGISTRY

