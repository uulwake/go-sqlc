# Learn Go SQLC

To run locally, please install

1. Docker
2. Docker Compose
3. Go
4. pgAdmin (optional)

Steps:

1. Run `docker-compose up -d` to spin up DB
2. Execute script in `init.sql`. You can use pgAdmin or terminal.
3. Run `go run .` or `go run *.go` to verify that the connection is success.
