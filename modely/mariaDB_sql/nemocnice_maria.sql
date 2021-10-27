CREATE TABdb1_vyukaLE lvarga_mesto(
	c_mesta BIGINT NOT NULL,
	nazev VARCHAR(50) NOT NULL,
	obyvatel INT NOT NULL
)	ENGINE = INNODB 
	CHARACTER SET = UTF8
	COLLATE = UTF8_CZECH_CI;
	
ALTER TABLE lvarga_mesto
	ADD PRIMARY KEY (c_mesta);
	
CREATE TABLE lvarga_pacient (
	c_pacienta INTEGER NOT NULL,
	jmeno VARCHAR (50) NOT NULL,
	prijmeni VARCHAR (50) NOT NULL,
	rc VARCHAR (10) NOT NULL,
	c_mesta BIGINT NOT NULL,
	PRIMARY KEY (c_pacienta),
	FOREIGN KEY (c_mesta) REFERENCES lvarga_mesto (c_mesta)
)	ENGINE = INNODB 
	CHARACTER SET = UTF8
	COLLATE = UTF8_CZECH_CI;