DROP TABLE rozvrh;
DROP TABLE predmety;
DROP TABLE mistnosti;

CREATE TABLE predmety  AS SELECT * FROM predmety;
CREATE TABLE rozvrh    AS SELECT * FROM rozvrh;
CREATE TABLE mistnosti AS SELECT * FROM mistnosti; 

ALTER TABLE predmety ADD CONSTRAINT pk_predmety PRIMARY KEY (id);

-- vkladani celeho zaznamu vcetne nevyplnenych polozek (NULL)
-- vyzaduje znalost poradi atributu v definici tabulky
INSERT  INTO predmety 
VALUES ( 99, 'DS', 'KIV', 'Distribuovane systemy', NULL, NULL, NULL );
-- skonci chybou - porusena integrita primarniho klice
INSERT  INTO predmety 
VALUES ( 99, 'PP', 'KIV', 'Pocitace a programovani', NULL, NULL, NULL );
-- vkladani jen vybranych polozek noveho zaznamu
-- jejich poradi lze definovat dle uvazeni
INSERT  INTO predmety ( nazev, katedra, zkratka, kredity, id )
VALUES ( 'Pocitace a programovani', 'KIV', 'PP', 5, 98 ); 

-- Výsledek dotazu (obvykle více záznamù) lze uložit do tabulky jedním pøíkazem INSERT:
INSERT INTO rozvrh (id_predm, semestr, poznamka)
SELECT id, 'LS', 'Garant: '||garant
  FROM predmety
 WHERE katedra = 'KIV';
 
 
-- aktualizace vsech zaznamu v tabulce
UPDATE predmety
   SET kredity = 20; 
-- aktualizace jen vybranych zaznamu
UPDATE predmety
   SET kredity = 20
 WHERE katedra = 'KIV'
   AND zkratka = 'KP'; 
-- vymazani hodnoty polozky ve vybranem zaznamu
UPDATE predmety
   SET pocet_studentu = NULL
 WHERE katedra = 'KIV'
   AND zkratka = 'PC';
-- aktualizace nekolika polozek v zaznamu najednou
-- tak, kde neni nastaven pocet studentu, zustava hodnota NULL
UPDATE predmety
   SET kredity = 3, 
       pocet_studentu = pocet_studentu + 10;  
       
       
-- vymazani celeho obsahu tabulky
-- to same vykona (jinak) prikaz TRUNCATE
DELETE 
  FROM rozvrh;
-- smazani jen vybranych zaznamu
DELETE
  FROM rozvrh
 WHERE poznamka LIKE 'Seminar%';      
 
 
-- DCL
ROLLBACK;
COMMIT;

-- zahajeni transakce
DELETE FROM predmety WHERE zkratka = 'HB';
SELECT zkratka FROM predmety;

-- nastaveni bodu lozeni
SAVEPOINT prvni;

-- dalsi prikaz DELETE v transakci
DELETE FROM predmety WHERE zkratka LIKE 'P%';
SELECT zkratka FROM predmety;

-- odvolani vsech operaci k danemu bodu ulozeni
ROLLBACK TO SAVEPOINT prvni;
SELECT zkratka FROM predmety; 


-- prideleni prava SELECT nad tabulkou PREDMETY uzivateli soused
GRANT SELECT ON predmety TO soused;
-- prideleni vice prav najednou
GRANT INSERT, UPDATE, DELETE ON predmety TO soused;
-- prideleni opravneni vsem uzivatelum (PUBLIC)
GRANT SELECT ON predmety TO PUBLIC;
-- prideleni prava SELECT nad tabulkou PREDMETY uzivateli soused
-- navic uzivatel soused ziskal moznost toto opravnini sirit dale
GRANT SELECT ON predmety TO soused WITH ADMIN OPTION;

SELECT * FROM zima.predmety;

-- odebrani prava SELECT nad tabulkou PREDMETY uzivateli soused
-- odebira tez moznost pridelene pravo sirit dale, pokud bylo prideleno
REVOKE SELECT ON rozvrh FROM soused;
-- odebrani vice pridelenych prav najednou
REVOKE INSERT, UPDATE, DELETE ON rozvrh FROM soused;
-- odebrani opravneni vsem uzivatelum
REVOKE SELECT ON predmety FROM PUBLIC;


-- role pro cteni dat z tabulek
CREATE ROLE role_cteni;

-- prideleni dilcich opravneni roli
GRANT SELECT ON predmety TO role_cteni;
GRANT SELECT ON rozvrh TO role_cteni;
GRANT SELECT ON mistnosti TO role_cteni;

-- role pr zapis dat do tabulek
CREATE ROLE role_zapis;

-- prideleni dilcich opravneni roli
GRANT INSERT, UPDATE, DELETE ON predmety TO role_zapis;
GRANT INSERT, UPDATE, DELETE ON rozvrh TO role_zapis;
GRANT INSERT, UPDATE, DELETE ON mistnosti TO role_zapis;

-- prideleni role uzivateli
GRANT role_zapis TO soused;

-- prideleni role vsem uzivatelum
-- uzivatele mohou tuto roli sirit dal i ji modifikovat (pripadne smazat)
GRANT role_cteni TO PUBLIC WITH ADMIN OPTION;

-- odebrani role uzivateli
REVOKE role_zapis FROM soused;

-- odebrani role vsem uzivatelum
-- odebrani moznosti sirit, menit pridelenou roli, pokud to bylo prideleno
REVOKE role_cteni FROM PUBLIC;

commit;
