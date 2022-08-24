-- name: GetOrder :one
SELECT * FROM orders WHERE id = $1;

-- name: GetOrders :many
SELECT * FROM orders limit 50;

-- name: CreateOrder :one
INSERT INTO orders (recipient_name, recipient_address, shipper)
VALUES ($1, $2, $3) RETURNING *;