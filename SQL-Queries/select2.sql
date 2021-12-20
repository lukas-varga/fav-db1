-- bez alias�, pln� kvalifikovan� n�zvy atribut�
SELECT tituly.id, tituly.titul, pisne.pisen, pisne.d_min, pisne.d_sec
  FROM tituly, pisne
 WHERE tituly.id = pisne.id; 
-- podm�nka p�irozen�ho spojen�
SELECT t.id, t.interpret, t.titul, 
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t, pisne p
 WHERE t.id = p.id;
-- oper�tor INNER JOIN s podm�nkou ON
SELECT t.id, t.interpret, t.titul,
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t INNER JOIN pisne p ON t.id = p.id;
-- oper�tor JOIN s podm�nkou ON
SELECT t.id, t.interpret, t.titul,
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t JOIN pisne p ON t.id = p.id;
-- oper�tor INNER JOIN s konstrukc� USING
SELECT id, t.interpret, t.titul,
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t INNER JOIN pisne p USING (id);
-- oper�tor JOIN s konstrukc� USING
SELECT id, t.interpret, t.titul,
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t JOIN pisne p USING (id);
-- oper�tor NATURAL JOIN
SELECT id, t.interpret, t.titul,
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t NATURAL JOIN pisne p;
-- oper�tor NATURAL INNER JOIN
SELECT id, t.interpret, t.titul,
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t NATURAL INNER JOIN pisne p;
  
-- oper�tor LEFT OUTER JOIN
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p LEFT OUTER JOIN rozvrh r
    ON p.id = r.id_predm;
-- specifick� syntaxe Oracle
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p, rozvrh r
 WHERE p.id = r.id_predm(+);
 
-- oper�tor RIGHT OUTER JOIN
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p RIGHT OUTER JOIN rozvrh r
    ON p.id = r.id_predm;
-- specifick� syntaxe Oracle
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p, rozvrh r
 WHERE r.id_predm = p.id(+);

-- lev� a prav� spojen� provedeno sou�asn�
-- oper�tor FULL OUTER JOIN
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p FULL OUTER JOIN rozvrh r 
    ON p.id = r.id_predm;
    
-- oper�tor EXISTS s poddotazem
SELECT p.zkratka, p.nazev
  FROM predmety p
 WHERE EXISTS ( SELECT *
                  FROM rozvrh r
                 WHERE p.id = r.id_predm);
-- oper�tor IN s poddotazem
SELECT p.zkratka, p.nazev
  FROM predmety p
 WHERE p.id IN ( SELECT r.id_predm
                   FROM rozvrh r
                  WHERE r.id_predm IS NOT NULL);
-- lze realizovat p�irozen�m spojen�m s DISTINCT
SELECT DISTINCT p.zkratka, p.nazev
  FROM predmety p, rozvrh r
 WHERE p.id = r.id_predm;
 
 
-- oper�tor NOT EXISTS s poddotazem
SELECT p.zkratka, p.nazev
  FROM predmety p
 WHERE NOT EXISTS ( SELECT *
                      FROM rozvrh r
                     WHERE p.id = r.id_predm);
-- oper�tor NOT IN s poddotazem
SELECT p.zkratka, p.nazev
  FROM predmety p
 WHERE p.id NOT IN ( SELECT r.id_predm
                       FROM rozvrh r
                      WHERE r.id_predm IS NOT NULL);
                      
-- podm�nka p�irozen�ho spojen�
SELECT zamestnanec.prijmeni, zamestnanec.jmeno,
       vedouci.prijmeni, vedouci.jmeno
  FROM osoby zamestnanec, osoby vedouci
 WHERE zamestnanec.id_nad = vedouci.id_osoby;
-- oper�tor INNER JOIN s podm�nkou ON
SELECT zamestnanec.prijmeni, zamestnanec.jmeno,
       vedouci.prijmeni, vedouci.jmeno
  FROM osoby zamestnanec INNER JOIN osoby vedouci
    ON zamestnanec.id_nad = vedouci.id_osoby;
    
    
-- oper�tor CROSS JOIN � vy�aduje disjunktn� mno�iny atribut?
SELECT p.katedra, p.zkratka, p.nazev,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p CROSS JOIN rozvrh r;
-- bez oper�toru �i podm�nky
SELECT p.katedra, p.zkratka, p.nazev,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p, rozvrh r;
    
    
-- nad kompatibiln�mi dotazy lze pou��t mno�inov� oper�tory
-- oper�tor UNION � sjednocen�, odstra�uje duplicitn� data
-- komutativn� operace, lze pou��t nad v�t��m po�tem dotaz�
-- v�sledkem je FULL OUTER JOIN
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p LEFT OUTER JOIN rozvrh r
    ON p.id = r.id_predm
UNION
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p RIGHT OUTER JOIN rozvrh r
    ON p.id = r.id_predm;
-- oper�tor UNION ALL � sjednocen�, ponech� duplicitn� data
-- komutativn� operace, lze pou��t nad v�t��m po�tem dotaz�
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p LEFT OUTER JOIN rozvrh r
    ON p.id = r.id_predm
UNION ALL
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p RIGHT OUTER JOIN rozvrh r
    ON p.id = r.id_predm;
-- oper�tor INTERSECT � pr�nik, odstra�uje duplicitn� data
-- komutativn� operace, lze pou��t nad v�t��m po�tem dotaz�
-- v�sledkem je INNER JOIN, tj. p�irozen� spojen�
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p LEFT OUTER JOIN rozvrh r
    ON p.id = r.id_predm
INTERSECT
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p RIGHT OUTER JOIN rozvrh r
    ON p.id = r.id_predm;
-- oper�tor MINUS � rozd�l
-- z�le�� na po�ad� dotaz�, lze aplikovat jen nad dv�ma dotazy
-- v�sledek je srovnateln� s ANTIJOINem
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p LEFT OUTER JOIN rozvrh r
    ON p.id = r.id_predm
MINUS
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p RIGHT OUTER JOIN rozvrh r
    ON p.id = r.id_predm;       
    

-- pojmenov�n� sloupc� pohledu vyu��v� n�zvy tabulky
CREATE VIEW cd_beatles AS
SELECT *
  FROM db2.cd
 WHERE interpret LIKE '%Beatles%'; 
-- vlastn� pojmenov�n� sloupc� pohledu
CREATE VIEW cd_prehled ( skladatel, dilo ) AS
SELECT DISTINCT interpret, titul
  FROM db2.cd; 
-- pohledy b�vaj� zpravidla spojov�ny se slo�it�j��my dotazy
CREATE VIEW cd_stat ( skladatel, dilo, pocet_stop, delka ) AS
SELECT a.interpret, 
       a.titul, 
       count(b.stopa), 
       sum(b.d_min)
  FROM db2.tituly a, db2.pisne b
 WHERE a.id = b.id
 GROUP BY  a.interpret, a.titul; 
    
DROP VIEW cd_beatles;
DROP VIEW cd_prehled;
DROP VIEW cd_stat;