START TRANSACTION;
DROP VIEW IF EXISTS prague_customers;
DROP VIEW IF EXISTS avg_price_by_brand;

CREATE VIEW prague_customers AS
SELECT name, surname, street, street_number
	FROM customer c LEFT JOIN address a
	ON c.id_address = a.id_address
	WHERE a.city LIKE '%Praha%'
		OR a.city LIKE '%Prague%'; 

CREATE VIEW avg_price_by_brand (brand, avg_price) AS
SELECT mo.brand, AVG(mtr.price)
	FROM model mo LEFT JOIN motorbike mtr
	ON mo.id_model = mtr.id_model
	GROUP BY mo.brand;
    
-- Views
SELECT * FROM prague_customers;
SELECT * FROM  avg_price_by_brand;
COMMIT;