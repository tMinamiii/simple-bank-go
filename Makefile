.PHONY: createdb
createdb:
	docker exec -it simple-bank-go-postgres12-1 createdb --username=root --owner=root simple_bank

.PHONY: dropdb
dropdb:
	docker exec -it simple-bank-go-postgres12-1 dropdb simple_bank

.PHONY: migrate-up
migrate-up:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

.PHONY: migrate-up
migrate-down:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY:  sqlc
sqlc:
	sqlc generate

.PHONY: test
test:
	go test -v -cover ./...