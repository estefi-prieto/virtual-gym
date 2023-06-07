.PHONY: test

ENV_FILE ?= .env

# import and export env variables
ifneq (,$(wildcard ${ENV_FILE}))
	include ${ENV_FILE}
    export
endif

default: help

#❓ help: @ Displays this message
help:
	@grep -E '[a-zA-Z\.\-]+:.*?@ .*$$' $(firstword $(MAKEFILE_LIST))| tr -d '#'  | awk 'BEGIN {FS = ":.*?@ "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'

#🐳 start: @ Starts tilt services
start:
	@echo Starting Tilt...
	@tilt up

#📦 setup: @ Installs and compiles dependencies
setup: SHELL:=/bin/bash
setup:
	@mix setup

#💻 server: @ Starts a server with an interactive elixir shell.
server: SHELL:=/bin/bash
server:
	@iex -S mix phx.server

#🐳 stop: @ Stop tilt services
stop:
	@echo Stopping Tilt...
	@tilt down

#💣 reset: @ Drops dev+test DBs, cleans dependencies then re-installs and compiles them
reset: SHELL:=/bin/bash
reset: drop.db
	@echo "🧹 Cleaning dependencies..."
	@mix deps.clean --all
	@${MAKE} setup

#🚀 migrate: @ Runs the repository migrations
migrate:
	mix ecto.migrate

#📖 docs: @ Generates HTML documentation
docs:
	@mix docs


#🔍 check: @ Runs all code verifications
check: lint.ci test #test.cover test.integration

#🔍 lint: @ Runs a code formatter
lint:
	@mix format
	@mix credo --strict

#🔍 lint.ci: @ Strictly runs a code formatter
lint.ci:
	@mix format --check-formatted
	@mix credo --strict

#🧪 test: @ Runs all test suites
test: MIX_ENV=test
test: SHELL:=/bin/bash
test:
	mix test --trace


