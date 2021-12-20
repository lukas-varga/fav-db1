-- Data for motorbike models
START TRANSACTION;
INSERT INTO `model` (id_model, brand, model_name, engine_capacity) VALUES ('1', 'Kawasaki', 'ZZR1400', '1441');
INSERT INTO `model` (id_model, brand, model_name, engine_capacity) VALUES ('2', 'BMW', 'F 650GS', '798');
COMMIT;

-- Data for physical motorbikes
START TRANSACTION;
INSERT INTO `motorbike` (id_motorbike, price, bike_condition, id_model) VALUES ('1', '4500', 'Lehce odřený', '2');
INSERT INTO `motorbike` (id_motorbike, price, bike_condition, id_model) VALUES ('2', '10000', 'Zbrusu nový', '1');
INSERT INTO `motorbike` (id_motorbike, price, bike_condition, id_model) VALUES ('3', '7500', 'Mírně používaný', '1');
INSERT INTO `motorbike` (id_motorbike, price, bike_condition, id_model) VALUES ('4', '6000', 'Sjeté brzdové kotouče', '2');
COMMIT;

-- Data for address
START TRANSACTION;
INSERT INTO `address` (id_address, zip_code, city, street, street_number) VALUES ('1', '32200', 'Brno', 'Sukova', '553');
INSERT INTO `address` (id_address, zip_code, city, street, street_number) VALUES ('2', '10800', 'Praha', 'Václavská', '316');
COMMIT;

-- Data for customers
START TRANSACTION;
INSERT INTO `customer` (id_customer, name, surname, personal_number, email, phone, id_address) VALUES ('1', 'Jan', 'Novák', '6856581252', 'jan.novak@gmail.com', '656626653', '1');
INSERT INTO `customer` (id_customer, name, surname, personal_number, email, phone, id_address) VALUES ('2', 'Pavlína', 'Nováková', '7056651251', 'p.novaka@seznam.cz', '796356589', '1');
INSERT INTO `customer` (id_customer, name, surname, personal_number, email, phone, id_address) VALUES ('3', 'Daniel', 'Novotný', '5855662589', 'd.novy@gmail.com', '756902258', '2');
INSERT INTO `customer` (id_customer, name, surname, personal_number, email, phone, id_address) VALUES ('4', 'Petr', 'Novotný', '2596695874', 'petr.novotny@seznam.cz', '643567946', '2');
COMMIT;

-- Data for renting 	
START TRANSACTION;
INSERT INTO `rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('1', '2021-01-01', '2021-01-30', '1', '1');
INSERT INTO `rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('2', '2021-01-05', '2021-03-15', '2', '1');
INSERT INTO `rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('3', '2021-01-25', '2021-02-25', '3', '2');
INSERT INTO `rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('4', '2021-02-06', '2021-05-30', '4', '2');
INSERT INTO `rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('5', '2021-03-08', '2021-03-15', '1', '3');
INSERT INTO `rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('6', '2021-07-23', '2021-08-30', '2', '3');
INSERT INTO `rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('7', '2021-06-06', '2021-10-30', '3', '4');
INSERT INTO `rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('8', '2021-05-31', '2021-06-30', '4', '4');
COMMIT;