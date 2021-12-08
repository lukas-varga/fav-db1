-- bez aliasù, plnì kvalifikované názvy atributù
SELECT tituly.id, tituly.titul, pisne.pisen, pisne.d_min, pisne.d_sec
  FROM tituly, pisne
 WHERE tituly.id = pisne.id; 
-- podmínka pøirozeného spojení
SELECT t.id, t.interpret, t.titul, 
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t, pisne p
 WHERE t.id = p.id;
-- operátor INNER JOIN s podmínkou ON
SELECT t.id, t.interpret, t.titul,
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t INNER JOIN pisne p ON t.id = p.id;
-- operátor JOIN s podmínkou ON
SELECT t.id, t.interpret, t.titul,
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t JOIN pisne p ON t.id = p.id;
-- operátor INNER JOIN s konstrukcí USING
SELECT id, t.interpret, t.titul,
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t INNER JOIN pisne p USING (id);
-- operátor JOIN s konstrukcí USING
SELECT id, t.interpret, t.titul,
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t JOIN pisne p USING (id);
-- operátor NATURAL JOIN
SELECT id, t.interpret, t.titul,
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t NATURAL JOIN pisne p;
-- operátor NATURAL INNER JOIN
SELECT id, t.interpret, t.titul,
       p.stopa, p.pisen, p.d_min, p.d_sec, p.poznamka
  FROM tituly t NATURAL INNER JOIN pisne p;
  
-- operátor LEFT OUTER JOIN
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p LEFT OUTER JOIN rozvrh r
    ON p.id = r.id_predm;
-- specifická syntaxe Oracle
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p, rozvrh r
 WHERE p.id = r.id_predm(+);
 
-- operátor RIGHT OUTER JOIN
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p RIGHT OUTER JOIN rozvrh r
    ON p.id = r.id_predm;
-- specifická syntaxe Oracle
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p, rozvrh r
 WHERE r.id_predm = p.id(+);

-- levé a pravé spojení provedeno souèasnì
-- operátor FULL OUTER JOIN
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p FULL OUTER JOIN rozvrh r 
    ON p.id = r.id_predm;
    
-- operátor EXISTS s poddotazem
SELECT p.zkratka, p.nazev
  FROM predmety p
 WHERE EXISTS ( SELECT *
                  FROM rozvrh r
                 WHERE p.id = r.id_predm);
-- operátor IN s poddotazem
SELECT p.zkratka, p.nazev
  FROM predmety p
 WHERE p.id IN ( SELECT r.id_predm
                   FROM rozvrh r
                  WHERE r.id_predm IS NOT NULL);
-- lze realizovat pøirozeným spojením s DISTINCT
SELECT DISTINCT p.zkratka, p.nazev
  FROM predmety p, rozvrh r
 WHERE p.id = r.id_predm;
 
 
-- operátor NOT EXISTS s poddotazem
SELECT p.zkratka, p.nazev
  FROM predmety p
 WHERE NOT EXISTS ( SELECT *
                      FROM rozvrh r
                     WHERE p.id = r.id_predm);
-- operátor NOT IN s poddotazem
SELECT p.zkratka, p.nazev
  FROM predmety p
 WHERE p.id NOT IN ( SELECT r.id_predm
                       FROM rozvrh r
                      WHERE r.id_predm IS NOT NULL);
                      
-- podmínka pøirozeného spojení
SELECT zamestnanec.prijmeni, zamestnanec.jmeno,
       vedouci.prijmeni, vedouci.jmeno
  FROM osoby zamestnanec, osoby vedouci
 WHERE zamestnanec.id_nad = vedouci.id_osoby;
-- operátor INNER JOIN s podmínkou ON
SELECT zamestnanec.prijmeni, zamestnanec.jmeno,
       vedouci.prijmeni, vedouci.jmeno
  FROM osoby zamestnanec INNER JOIN osoby vedouci
    ON zamestnanec.id_nad = vedouci.id_osoby;
    
    
-- operátor CROSS JOIN – vyžaduje disjunktní množiny atribut?
SELECT p.katedra, p.zkratka, p.nazev,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p CROSS JOIN rozvrh r;
-- bez operátoru èi podmínky
SELECT p.katedra, p.zkratka, p.nazev,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p, rozvrh r;
    
    
-- nad kompatibilními dotazy lze použít množinové operátory
-- operátor UNION – sjednocení, odstraòuje duplicitní data
-- komutativní operace, lze použít nad vìtším poètem dotazù
-- výsledkem je FULL OUTER JOIN
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p LEFT OUTER JOIN rozvrh r
    ON p.id = r.id_predm
UNION
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p RIGHT OUTER JOIN rozvrh r
    ON p.id = r.id_predm;
-- operátor UNION ALL – sjednocení, ponechá duplicitní data
-- komutativní operace, lze použít nad vìtším poètem dotazù
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p LEFT OUTER JOIN rozvrh r
    ON p.id = r.id_predm
UNION ALL
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p RIGHT OUTER JOIN rozvrh r
    ON p.id = r.id_predm;
-- operátor INTERSECT – prùnik, odstraòuje duplicitní data
-- komutativní operace, lze použít nad vìtším poètem dotazù
-- výsledkem je INNER JOIN, tj. pøirozené spojení
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p LEFT OUTER JOIN rozvrh r
    ON p.id = r.id_predm
INTERSECT
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p RIGHT OUTER JOIN rozvrh r
    ON p.id = r.id_predm;
-- operátor MINUS – rozdíl
-- záleží na poøadí dotazù, lze aplikovat jen nad dvìma dotazy
-- výsledek je srovnatelný s ANTIJOINem
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p LEFT OUTER JOIN rozvrh r
    ON p.id = r.id_predm
MINUS
SELECT p.katedra, p.zkratka,
       r.semestr, r.den, r.h_od, r.h_do, r.poznamka
  FROM predmety p RIGHT OUTER JOIN rozvrh r
    ON p.id = r.id_predm;       
    

-- pojmenování sloupcù pohledu využívá názvy tabulky
CREATE VIEW cd_beatles AS
SELECT *
  FROM db2.cd
 WHERE interpret LIKE '%Beatles%'; 
-- vlastní pojmenování sloupcù pohledu
CREATE VIEW cd_prehled ( skladatel, dilo ) AS
SELECT DISTINCT interpret, titul
  FROM db2.cd; 
-- pohledy bývají zpravidla spojovány se složitìjšímy dotazy
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