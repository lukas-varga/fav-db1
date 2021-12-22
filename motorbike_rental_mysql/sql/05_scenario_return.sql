START TRANSACTION;
-- Customer extend renting
SELECT id_rent, return_date, id_customer FROM rent WHERE id_customer = '5'; 
UPDATE rent SET return_date = '2021-05-20' WHERE id_rent = '9';

-- Cannot delete customer with rented bike - RULE VIOLATION
DELETE FROM customer WHERE id_customer = '5'; 

-- Customer return motorbike
SELECT COUNT(*) AS rents_of_cust_5 FROM rent WHERE id_customer = '5';
SELECT id_rent, id_customer FROM rent WHERE id_customer = '5';
DELETE FROM rent WHERE id_rent = '9';

-- Now customer can be deleted because he doesnt have any remaining rents
SELECT * FROM rent WHERE id_customer = '5';
DELETE FROM customer WHERE id_customer = '5'; 
COMMIT;