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

-- unikátní index pro primární klíè
-- obvykle má shodný název s integritním omezením
CREATE UNIQUE INDEX pk_lide ON lide (os_cislo);
-- bìžný index (pro cizí klíè)
-- název se mùže shodovat s integritním omezením
CREATE INDEX fk_prac ON lide (cislo_prac);

-- zrušení unikátního indexu
DROP INDEX pk_lide;
-- zrušení bìžného indexu
DROP INDEX fk_prac;


ALTER TABLE pracoviste ADD ( adresa VARCHAR2(80) );
ALTER TABLE pracoviste DROP ( adresa );

-- primární klíè pro tabulku LIDE
ALTER TABLE lide ADD CONSTRAINT pk_lide PRIMARY KEY (os_cislo);
-- primární klíè pro tabulku PRACOVISTE
ALTER TABLE pracoviste ADD CONSTRAINT pk_pracoviste PRIMARY KEY (cislo_prac);
-- primární klíè pro tabulku PREDMETY
ALTER TABLE predmety ADD CONSTRAINT pk_predmety PRIMARY KEY (zkratka, katedra);
-- nastavení unikátnosti hodnot atributu RC v tabulce LIDE
ALTER TABLE lide ADD CONSTRAINT unikatni_rc UNIQUE (rc);
-- nastaveni unikatnosti hodnot atributu NAZEV v tabulce PRACOVISTE
ALTER TABLE pracoviste ADD CONSTRAINT unikatni_nazev UNIQUE (nazev);

-- hlídání velikosti platu èlovìka
ALTER TABLE lide ADD CONSTRAINT kontrola_platu CHECK ( plat > 5000 AND plat < 20000 );

-- restriktivní omezení, platí jako výchozí
ALTER TABLE lide 
ADD CONSTRAINT fk_prac FOREIGN KEY ( cislo_prac ) 
REFERENCES pracoviste ( cislo_prac );
-- pracovníci rušeného pracovištì budou mít èíslo pracovištì NULL
ALTER TABLE lide 
ADD CONSTRAINT fk_prac FOREIGN KEY ( cislo_prac ) 
REFERENCES pracoviste ( cislo_prac ) ON DELETE SET NULL;
-- kaskádní mazání
-- kromì rušeného pracovištì budou smazáni i všichni jeho pracovníci
ALTER TABLE lide 
ADD CONSTRAINT fk_prac FOREIGN KEY ( cislo_prac ) 
REFERENCES pracoviste ( cislo_prac ) ON DELETE CASCADE;


-- zrušení primárního klíèe
ALTER TABLE lide DROP CONSTRAINT pk_lide;
-- zrušení doménového integritního omezení
ALTER TABLE lide DROP CONSTRAINT kontrola_platu;
-- zrušení cizího klíèe
ALTER TABLE lide DROP CONSTRAINT fk_prac;


-- smazání obsahu tabulky i její definice
DROP TABLE predmety;
-- ke smazání nedojde, brání tomu referenèní integrita (krome CASCADE)
DROP TABLE pracoviste;
-- smazání tabulky vèetnì všech referenèních integritních omezení, které by tomu bránily
DROP TABLE pracoviste CASCADE CONSTRAINTS;
-- platí pouze v SØBD Oracle

-- tabulka vèetnì obsahu bude skuteènì smazána, jinak je pøesunuta do odpadkového koše
DROP TABLE lide PURGE;