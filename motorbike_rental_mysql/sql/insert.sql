-- Data for motorbike models
START TRANSACTION;
INSERT INTO `motorbike_rental`.`model` (id_model, brand, model_name, engine_capacity) VALUES ('1', 'Kawasaki', 'ZZR1400', '1441');
INSERT INTO `motorbike_rental`.`model` (id_model, brand, model_name, engine_capacity) VALUES ('2', 'BMW', 'F 650GS', '798');
COMMIT;

-- Data for physical motorbikes
START TRANSACTION;
INSERT INTO `motorbike_rental`.`motorbike` (id_motorbike, price, bike_condition, id_model) VALUES ('1', '4500', 'Lehce odřený', '2');
INSERT INTO `motorbike_rental`.`motorbike` (id_motorbike, price, bike_condition, id_model) VALUES ('2', '10000', 'Zbrusu nový', '1');
INSERT INTO `motorbike_rental`.`motorbike` (id_motorbike, price, bike_condition, id_model) VALUES ('3', '7500', 'Mírně používaný', '1');
INSERT INTO `motorbike_rental`.`motorbike` (id_motorbike, price, bike_condition, id_model) VALUES ('4', '6000', 'Sjeté brzdové kotouče', '2');
COMMIT;

-- Data for address
START TRANSACTION;
INSERT INTO `motorbike_rental`.`address` (id_address, zip_code, city, street, street_number) VALUES ('1', '32200', 'Brno', 'Sukova', '553');
INSERT INTO `motorbike_rental`.`address` (id_address, zip_code, city, street, street_number) VALUES ('2', '10800', 'Praha', 'Václavská', '316');
COMMIT;

-- Data for customers
START TRANSACTION;
INSERT INTO `motorbike_rental`.`customer` (id_customer, name, surname, personal_number, email, phone, id_address) VALUES ('1', 'Jan', 'Novák', '6856581252', 'jan.novak@gmail.com', '656626653', '1');
INSERT INTO `motorbike_rental`.`customer` (id_customer, name, surname, personal_number, email, phone, id_address) VALUES ('2', 'Pavlína', 'Nováková', '7056651251', 'p.novaka@seznam.cz', '796356589', '1');
INSERT INTO `motorbike_rental`.`customer` (id_customer, name, surname, personal_number, email, phone, id_address) VALUES ('3', 'Daniel', 'Novotný', '5855662589', 'd.novy@gmail.com', '756902258', '2');
INSERT INTO `motorbike_rental`.`customer` (id_customer, name, surname, personal_number, email, phone, id_address) VALUES ('4', 'Petr', 'Novotný', '2596695874', 'petr.novotny@seznam.cz', '643567946', '2');
COMMIT;

-- Data for renting 	
START TRANSACTION;
INSERT INTO `motorbike_rental`.`rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('1', TO_DATE('2021-01-04 20:00:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-01-17 20:00:48', 'YYYY-MM-DD HH24:MI:SS'), '1', '2');
INSERT INTO `motorbike_rental`.`rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('1', TO_DATE('2021-01-04 20:00:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-01-17 20:00:48', 'YYYY-MM-DD HH24:MI:SS'), '1', '2');
INSERT INTO `motorbike_rental`.`rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('1', TO_DATE('2021-01-04 20:00:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-01-17 20:00:48', 'YYYY-MM-DD HH24:MI:SS'), '1', '2');
INSERT INTO `motorbike_rental`.`rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('1', TO_DATE('2021-01-04 20:00:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-01-17 20:00:48', 'YYYY-MM-DD HH24:MI:SS'), '1', '2');
INSERT INTO `motorbike_rental`.`rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('1', TO_DATE('2021-01-04 20:00:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-01-17 20:00:48', 'YYYY-MM-DD HH24:MI:SS'), '1', '2');
INSERT INTO `motorbike_rental`.`rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('1', TO_DATE('2021-01-04 20:00:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-01-17 20:00:48', 'YYYY-MM-DD HH24:MI:SS'), '1', '2');
INSERT INTO `motorbike_rental`.`rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('1', TO_DATE('2021-01-04 20:00:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-01-17 20:00:48', 'YYYY-MM-DD HH24:MI:SS'), '1', '2');
INSERT INTO `motorbike_rental`.`rent` (id_rent, rent_date, return_date, id_motorbike, id_customer) VALUES ('1', TO_DATE('2021-01-04 20:00:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-01-17 20:00:48', 'YYYY-MM-DD HH24:MI:SS'), '1', '2');
COMMIT;
