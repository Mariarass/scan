postgres:
	docker run --name postgres16 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:16-alpine
createdb: 
	docker exec -it postgres16 createdb --username=root --owner=root beauty_check
dropdb:
	docker exec-it postgres16 dropdb beauty_check

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/beauty_check?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/beauty_check?sslmode=disable" -verbose down

sqlc:
	sqlc generate
.PHONY: postgres createdb dropdb migrateup migratedown sqlc