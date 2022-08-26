CREATE TABLE items (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	qty INT NOT NULL,
	weight FLOAT NOT NULL
);

INSERT INTO items(name, qty, weight)
VALUES 
	('itemA', 1, 10.1),
	('itemB', 2, 10.2),
	('itemC', 3, 10.3)

CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	recipient_name VARCHAR(50) NOT NULL,
	recipient_address VARCHAR(50) NOT NULL,
	shipper VARCHAR(50) NOT NULL
);

INSERT INTO orders(recipient_name, recipient_address, shipper)
VALUES 
	('personA', 'Jalan A', 'JNE'),
	('personB', 'Jalan B', 'JNE'),
	('personC', 'Jalan C', 'JNE'),
	('personD', 'Jalan D', 'JNT')


CREATE TABLE outbounds (
	id SERIAL PRIMARY KEY,
	item_id INT NOT NULL,
	order_id INT NOT NULL,
	qty INT NOT NULL,
	CONSTRAINT fk_items FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE,
	CONSTRAINT fk_orders FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE	
)

INSERT INTO outbounds(item_id, order_id, qty)
VALUES 
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(1, 4, 1),
	(2, 4, 1),
	(3, 4, 1)
	
SELECT * from items t1
JOIN outbounds t2 ON t1.id = t2.item_id
JOIN orders t3 ON t2.order_id = t3.id
