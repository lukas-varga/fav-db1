START TRANSACTION;
-- Customer rent a new bike
INSERT INTO address (zip_code, city, street, street_number) 
	VALUES ('10800', 'Praha', '17. listopadu', '28');

INSERT INTO customer (id_customer, name, surname, personal_number, email, phone, id_address)
	VALUES ('5', 'Lukáš', 'Varga', '5856581254', 'lukas.varga128@gmail.com', '604543693', 
		(SELECT id_address FROM address
			WHERE street = '17. listopadu' AND street_number = '28' LIMIT 1)
    );
SELECT * FROM customer;

SELECT * FROM motorbike WHERE price < '5000';    
INSERT INTO rent (rent_date, return_date, id_motorbike, id_customer)  VALUES ('2021-01-03', '2021-03-25', 1, 5);

-- Active rents on '2021-03-10'
SELECT r.id_rent, c.name, c.surname, c.phone, r.rent_date, r.return_date
  FROM customer c INNER JOIN rent r
  ON c.id_customer = r.id_customer
  AND '2021-03-10' BETWEEN r.rent_date AND r.return_date;
COMMIT;