CREATE TABLE mesto (
	c_mesta INTEGER NOT NULL,
    nazev VARCHAR2(50 CHAR) NOT NULL,
    obyvatel INTEGER NOT NULL
);

ALTER TABLE mesto
    ADD CONSTRAINT mesto_pk PRIMARY KEY (c_mesta);
    
CREATE TABLE pacient (
    c_pacienta INTEGER NOT NULL,
    jmeno VARCHAR2 (50 CHAR) NOT NULL,
    prijmeni VARCHAR2 (50 CHAR) NOT NULL,
    rc VARCHAR2 (10 CHAR) NOT NULL,
    CONSTRAINT pacient_pk PRIMARY KEY (c_pacienta)
);

ALTER TABLE pacient ADD (
    c_mesta INTEGER NOT NULL
);

ALTER TABLE pacient
    ADD CONSTRAINT  pacient_mesto_fk FOREIGN KEY (c_mesta)
        REFERENCES mesto (c_mesta);

CREATE TABLE nemocnice (
    c_nemocnice INTEGER NOT NULL PRIMARY KEY,
    nazev VARCHAR2 (50 CHAR) NOT NULL,
    kapacita SMALLINT NOT NULL,
    c_mesta INTEGER NOT NULL,
    d_otevreni DATE NOT NULL
);

ALTER TABLE nemocnice 
    ADD CONSTRAINT nemocnice_mesto_fk FOREIGN KEY (c_mesta)
        REFERENCES mesto (c_mesta);


CREATE TABLE lezi (
    c_pacienta INTEGER NOT NULL,
    c_nemocnice INTEGER NOT NULL,
    diagnoza CLOB,
    d_nastupu DATE NOT NULL
);

ALTER TABLE lezi
    ADD CONSTRAINT lezi_pk PRIMARY KEY (c_pacienta, c_nemocnice, d_nastupu);
    
ALTER TABLE lezi
    ADD CONSTRAINT lezi_pacient_fk FOREIGN KEY (c_pacienta)
        REFERENCES pacient (c_pacienta);
        
ALTER TABLE lezi
    ADD CONSTRAINT lezi_nemocnice_fk FOREIGN KEY (c_nemocnice)
        REFERENCES nemocnice (c_nemocnice);  
