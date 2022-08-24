-- name: GetOutbound :one
SELECT * FROM outbounds WHERE id = $1;

-- name: GetOutbounds :many
SELECT * FROM outbounds limit 50;

-- name: CreateOutbound :exec
INSERT INTO outbounds (item_id, order_id, qty)
VALUES ($1, $2, $3);