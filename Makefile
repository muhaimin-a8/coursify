# ===========================================================================================
# 						WELCOME TO COURSIFY
#					---------------------------
#						REST API written in Go
# ===========================================================================================


# -------------------------------------------------------------------------------------------
# Configuration Variables
# -------------------------------------------------------------------------------------------
# run `export POSTGRES_URI=postgres://username:password@host:port/dbname?options=value`
# or fill this variable with your postgres uri
#
# POSTGRES_URI = postgres://username:password@host:port/dbname?options=value

# -------------------------------------------------------------------------------------------
# Install Required Tools
# -------------------------------------------------------------------------------------------
#
# install-deps: install all required tools to run this app
install-deps:
	go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

# -------------------------------------------------------------------------------------------
# Database Migrations
# -------------------------------------------------------------------------------------------
#
# migrate-create: create new migration with `name` as parameter
migrate-create:
	migrate create -ext sql -dir migrations "$(name)"

# migrate-up: migrate up all databases migrations, required `POSTGRES_URI`
migrate-up:
	migrate -database $(POSTGRES_URI) -path migrations up

# migrate-up: migrate down all databases migrations, required `POSTGRES_URI`
migrate-down:
	migrate -database $(POSTGRES_URI) -path migrations down

# -------------------------------------------------------------------------------------------
# Run and Build
# -------------------------------------------------------------------------------------------
#
# run: run app immediately without build
run:
	cd cmd; go run main.go

# build: building app to ./bin/coursify
build:
	@ echo "building app to ./bin/coursify"
	cd cmd; go build -o ../bin/coursify

# -------------------------------------------------------------------------------------------
# Testing
# -------------------------------------------------------------------------------------------
#
# test-unit: run all unit tests
test-unit:
	go test ./tests/unit/...

# test-integration: run all integration test, required real databases
test-integration:
	go test ./tests/integration/...
