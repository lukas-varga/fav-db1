CREATE TABLE lide (
  os_cislo   NUMBER(5)    NOT NULL,
  rc         VARCHAR2(30) NOT NULL, 
  jmeno      VARCHAR2(30) NOT NULL,
  prijmeni   VARCHAR2(30) NOT NULL,
  dat_naroz  DATE,
  pohlavi    CHAR(1)      NOT NULL,
  telefon    VARCHAR2(50),
  plat       NUMBER(5),
  cislo_prac NUMBER(5)    NOT NULL
); 
CREATE TABLE pracoviste (
  cislo_prac NUMBER(5)    NOT NULL,
  nazev      VARCHAR2(30) NOT NULL
); 
CREATE TABLE predmety (
  zkratka   VARCHAR2(5),
  katedra   VARCHAR2(3),
  nazev     VARCHAR2(30) NOT NULL,
  kredity   NUMBER(2)    NOT NULL
); 

-- unik�tn� index pro prim�rn� kl��
-- obvykle m� shodn� n�zev s integritn�m omezen�m
CREATE UNIQUE INDEX pk_lide ON lide (os_cislo);
-- b�n� index (pro ciz� kl��)
-- n�zev se m��e shodovat s integritn�m omezen�m
CREATE INDEX fk_prac ON lide (cislo_prac);

-- zru�en� unik�tn�ho indexu
DROP INDEX pk_lide;
-- zru�en� b�n�ho indexu
DROP INDEX fk_prac;


ALTER TABLE pracoviste ADD ( adresa VARCHAR2(80) );
ALTER TABLE pracoviste DROP ( adresa );

-- prim�rn� kl�� pro tabulku LIDE
ALTER TABLE lide ADD CONSTRAINT pk_lide PRIMARY KEY (os_cislo);
-- prim�rn� kl�� pro tabulku PRACOVISTE
ALTER TABLE pracoviste ADD CONSTRAINT pk_pracoviste PRIMARY KEY (cislo_prac);
-- prim�rn� kl�� pro tabulku PREDMETY
ALTER TABLE predmety ADD CONSTRAINT pk_predmety PRIMARY KEY (zkratka, katedra);
-- nastaven� unik�tnosti hodnot atributu RC v tabulce LIDE
ALTER TABLE lide ADD CONSTRAINT unikatni_rc UNIQUE (rc);
-- nastaveni unikatnosti hodnot atributu NAZEV v tabulce PRACOVISTE
ALTER TABLE pracoviste ADD CONSTRAINT unikatni_nazev UNIQUE (nazev);

-- hl�d�n� velikosti platu �lov�ka
ALTER TABLE lide ADD CONSTRAINT kontrola_platu CHECK ( plat > 5000 AND plat < 20000 );

-- restriktivn� omezen�, plat� jako v�choz�
ALTER TABLE lide 
ADD CONSTRAINT fk_prac FOREIGN KEY ( cislo_prac ) 
REFERENCES pracoviste ( cislo_prac );
-- pracovn�ci ru�en�ho pracovi�t� budou m�t ��slo pracovi�t� NULL
ALTER TABLE lide 
ADD CONSTRAINT fk_prac FOREIGN KEY ( cislo_prac ) 
REFERENCES pracoviste ( cislo_prac ) ON DELETE SET NULL;
-- kask�dn� maz�n�
-- krom� ru�en�ho pracovi�t� budou smaz�ni i v�ichni jeho pracovn�ci
ALTER TABLE lide 
ADD CONSTRAINT fk_prac FOREIGN KEY ( cislo_prac ) 
REFERENCES pracoviste ( cislo_prac ) ON DELETE CASCADE;


-- zru�en� prim�rn�ho kl��e
ALTER TABLE lide DROP CONSTRAINT pk_lide;
-- zru�en� dom�nov�ho integritn�ho omezen�
ALTER TABLE lide DROP CONSTRAINT kontrola_platu;
-- zru�en� ciz�ho kl��e
ALTER TABLE lide DROP CONSTRAINT fk_prac;


-- smaz�n� obsahu tabulky i jej� definice
DROP TABLE predmety;
-- ke smaz�n� nedojde, br�n� tomu referen�n� integrita (krome CASCADE)
DROP TABLE pracoviste;
-- smaz�n� tabulky v�etn� v�ech referen�n�ch integritn�ch omezen�, kter� by tomu br�nily
DROP TABLE pracoviste CASCADE CONSTRAINTS;
-- plat� pouze v S�BD Oracle

-- tabulka v�etn� obsahu bude skute�n� smaz�na, jinak je p�esunuta do odpadkov�ho ko�e
DROP TABLE lide PURGE;