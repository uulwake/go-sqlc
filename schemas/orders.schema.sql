CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	recipient_name VARCHAR(50) NOT NULL,
	recipient_address VARCHAR(50) NOT NULL,
	shipper VARCHAR(50) NOT NULL
);