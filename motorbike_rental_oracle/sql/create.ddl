-- Generated by Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   at:        2021-12-20 17:22:24 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE address (
    id_address    INTEGER NOT NULL,
    zip_code      INTEGER NOT NULL,
    city          VARCHAR2(30 CHAR) NOT NULL,
    street        VARCHAR2(50 CHAR) NOT NULL,
    street_number INTEGER NOT NULL
);

ALTER TABLE address ADD CONSTRAINT address_pk PRIMARY KEY ( id_address );

CREATE TABLE customer (
    id_customer     INTEGER NOT NULL,
    name            VARCHAR2(30 CHAR) NOT NULL,
    surname         VARCHAR2(30 CHAR) NOT NULL,
    personal_number VARCHAR2(15 CHAR) NOT NULL,
    email           VARCHAR2(50 CHAR),
    phone           INTEGER,
    id_address      INTEGER NOT NULL
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( id_customer );

CREATE TABLE model (
    id_model        INTEGER NOT NULL,
    brand           VARCHAR2(30 CHAR) NOT NULL,
    model_name      VARCHAR2(50 CHAR) NOT NULL,
    engine_capacity INTEGER NOT NULL
);

ALTER TABLE model ADD CONSTRAINT model_pk PRIMARY KEY ( id_model );

CREATE TABLE motorbike (
    id_motorbike INTEGER NOT NULL,
    price        INTEGER NOT NULL,
    condition    VARCHAR2(100 CHAR),
    id_model     INTEGER NOT NULL
);

ALTER TABLE motorbike ADD CONSTRAINT motorbike_pk PRIMARY KEY ( id_motorbike );

CREATE TABLE rent (
    id_rent      INTEGER NOT NULL,
    rent_date    DATE NOT NULL,
    return_date  DATE,
    id_motorbike INTEGER NOT NULL,
    id_customer  INTEGER NOT NULL
);

ALTER TABLE rent ADD CONSTRAINT rent_pk PRIMARY KEY ( id_rent );

ALTER TABLE customer
    ADD CONSTRAINT customer_address_fk FOREIGN KEY ( id_address )
        REFERENCES address ( id_address );

ALTER TABLE motorbike
    ADD CONSTRAINT motorbike_model_fk FOREIGN KEY ( id_model )
        REFERENCES model ( id_model );

ALTER TABLE rent
    ADD CONSTRAINT rent_customer_fk FOREIGN KEY ( id_customer )
        REFERENCES customer ( id_customer );

ALTER TABLE rent
    ADD CONSTRAINT rent_motorbike_fk FOREIGN KEY ( id_motorbike )
        REFERENCES motorbike ( id_motorbike );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
