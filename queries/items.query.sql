-- name: GetItemById :one
SELECT * FROM items WHERE id = $1;

-- name: GetItems :many
SELECT * FROM items limit 50;

-- name: CreateItem :one
INSERT INTO items(name, qty, weight)
VALUES ($1, $2, $3) RETURNING *;

-- name: UpdateItemById :one
UPDATE items 
SET
    name = $1,
    qty = $2,
    weight = $3
WHERE 
    id = $4
RETURNING *;

-- name: DeleteItemById :exec
DELETE FROM items WHERE id = $1;