select * from cd;

select  pisen, d_min, d_sec from cd;

select interpret from cd;

select distinct interpret from cd;

select pisen, d_min * 60 + d_sec as stopaz from cd;

select pisen, d_min, d_sec from cd where d_min >= 5;

select pisen, d_min, d_sec
    from cd
    where d_min >= 5 and d_min < 7; 
    
select pisen, d_min, d_sec
    from cd
    where d_min between 5 AND 7;   
    
select pisen, d_min, d_sec
    from cd
    where d_min not between 5 AND 7;       
    
select interpret, pisen
    from cd
    where interpret in ('The Beatles', 'The Cranberies');
    
select interpret, pisen
    from cd
    where interpret not in ('The Beatles', 'The Cranberies');
    
select interpret, pisen
    from cd
    where interpret like 'The%';
    
select interpret, pisen
    from cd
    where interpret not like 'The%';
    
select pisen, poznamka
    from cd
    where poznamka like '%50#%%' escape '#';
    
select pisen, poznamka
    from cd
    where poznamka = null;
    
select pisen, poznamka
    from cd
    where poznamka <> null;  
    
select pisen, poznamka
    from cd
    where poznamka is null;
    
select pisen, poznamka
    from cd
    where poznamka is not null;     
    
select pisen, poznamka
    from cd
    where poznamka not IN ('Prvni pisnicka', 'Druha pisnicka')    
        or poznamka is null;
        
select pisen, NVL(poznamka, 'Bez poznamky')
    from cd;
    
SELECT interpret, pisen 
  FROM cd
 ORDER BY interpret ASC; 
 
SELECT interpret, pisen 
  FROM cd
 ORDER BY interpret DESC;  
 
-- seøazení interpretù proti abecedì,
-- abecednì seøazeny písnì každému interpretovi
SELECT interpret, pisen
  FROM cd
 ORDER BY interpret DESC, pisen ASC;
 
-- øazení podle výrazu využívá jeho alias
SELECT pisen, d_min * 60 + d_sec AS stopaz
  FROM cd
 ORDER BY stopaz DESC; 
    
-- to samé, použito èíselné oznaèení sloupce
SELECT pisen, d_min * 60 + d_sec
  FROM cd
 ORDER BY 2 DESC;
 
 -- funkce COUNT spoèítá všechny (i neúplné) záznamy tabulky
SELECT COUNT(*) FROM cd;
-- poèet záznamù, kde je vyplnìna položka pisen
SELECT COUNT(pisen) FROM cd;
-- poèet záznamù, kde je vyplnìna položka interpret
SELECT COUNT(interpret) FROM cd;
-- poèet záznamù, kde je vyplnìna položka poznamka – bude jiný
SELECT COUNT(poznamka) FROM cd;
-- poèet rùzných interpretù v tabulce
SELECT COUNT(DISTINCT interpret) FROM cd;
-- ostatní agregaèní funkce
SELECT MIN(d_min), MAX(d_min), SUM(d_min), AVG(d_min) FROM cd;

-- každému interpretovi (tvoøí skupinu atributù) spoèítám,
-- kolik písní mám a jak dlouho budou všechny hrát,
-- celé to abecednì seøadím
SELECT interpret,
       COUNT(stopa) AS pocet_stop,
       SUM(d_min * 60 + d_sec) AS delka
  FROM cd
 GROUP BY interpret
 ORDER BY interpret;
    
    
-- ten samý dotaz s podmínkou (HAVING), že chci jen ty
-- interprety, kteøí nabízí max. 12 písní a budou hrát
-- alespoò 5 minut (300 sekund)
-- v podmínce HAVING nelze používat aliasy a výrazy zde musí
-- být jen agregované
SELECT interpret,
       COUNT(stopa) AS pocet_stop,
       SUM(d_min * 60 + d_sec) AS delka
  FROM cd
 GROUP BY interpret
HAVING SUM(d_min * 60 + d_sec) > 300 AND COUNT(stopa) < 12
 ORDER BY interpret;    
 
 
 
-- hledám nejdéle hrající písnì
-- vnoøený dotaz vrací právì jednu hodnotu
SELECT pisen, d_min, d_sec
  FROM cd
 WHERE d_min * 60 + d_sec = (SELECT MAX(d_min * 60 + d_sec) FROM cd);
-- to samé, použit množinový operátor ALL
-- vnoøený dotaz vrací množinu hodnot
SELECT pisen, d_min, d_sec
  FROM cd
 WHERE d_min * 60 + d_sec >= ALL(SELECT d_min * 60 + d_sec FROM cd);
-- hledám všechny písnì, které nejsou nejdéle hrající
-- použit množinový operátor ANY/SOME
-- vnoøený dotaz vrací množinu hodnot
SELECT pisen, d_min, d_sec
  FROM cd
 WHERE d_min * 60 + d_sec < ANY(SELECT d_min * 60 + d_sec FROM cd); 