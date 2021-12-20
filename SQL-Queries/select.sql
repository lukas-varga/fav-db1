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
 
-- se�azen� interpret� proti abeced�,
-- abecedn� se�azeny p�sn� ka�d�mu interpretovi
SELECT interpret, pisen
  FROM cd
 ORDER BY interpret DESC, pisen ASC;
 
-- �azen� podle v�razu vyu��v� jeho alias
SELECT pisen, d_min * 60 + d_sec AS stopaz
  FROM cd
 ORDER BY stopaz DESC; 
    
-- to sam�, pou�ito ��seln� ozna�en� sloupce
SELECT pisen, d_min * 60 + d_sec
  FROM cd
 ORDER BY 2 DESC;
 
 -- funkce COUNT spo��t� v�echny (i ne�pln�) z�znamy tabulky
SELECT COUNT(*) FROM cd;
-- po�et z�znam�, kde je vypln�na polo�ka pisen
SELECT COUNT(pisen) FROM cd;
-- po�et z�znam�, kde je vypln�na polo�ka interpret
SELECT COUNT(interpret) FROM cd;
-- po�et z�znam�, kde je vypln�na polo�ka poznamka � bude jin�
SELECT COUNT(poznamka) FROM cd;
-- po�et r�zn�ch interpret� v tabulce
SELECT COUNT(DISTINCT interpret) FROM cd;
-- ostatn� agrega�n� funkce
SELECT MIN(d_min), MAX(d_min), SUM(d_min), AVG(d_min) FROM cd;

-- ka�d�mu interpretovi (tvo�� skupinu atribut�) spo��t�m,
-- kolik p�sn� m�m a jak dlouho budou v�echny hr�t,
-- cel� to abecedn� se�ad�m
SELECT interpret,
       COUNT(stopa) AS pocet_stop,
       SUM(d_min * 60 + d_sec) AS delka
  FROM cd
 GROUP BY interpret
 ORDER BY interpret;
    
    
-- ten sam� dotaz s podm�nkou (HAVING), �e chci jen ty
-- interprety, kte�� nab�z� max. 12 p�sn� a budou hr�t
-- alespo� 5 minut (300 sekund)
-- v podm�nce HAVING nelze pou��vat aliasy a v�razy zde mus�
-- b�t jen agregovan�
SELECT interpret,
       COUNT(stopa) AS pocet_stop,
       SUM(d_min * 60 + d_sec) AS delka
  FROM cd
 GROUP BY interpret
HAVING SUM(d_min * 60 + d_sec) > 300 AND COUNT(stopa) < 12
 ORDER BY interpret;    
 
 
 
-- hled�m nejd�le hraj�c� p�sn�
-- vno�en� dotaz vrac� pr�v� jednu hodnotu
SELECT pisen, d_min, d_sec
  FROM cd
 WHERE d_min * 60 + d_sec = (SELECT MAX(d_min * 60 + d_sec) FROM cd);
-- to sam�, pou�it mno�inov� oper�tor ALL
-- vno�en� dotaz vrac� mno�inu hodnot
SELECT pisen, d_min, d_sec
  FROM cd
 WHERE d_min * 60 + d_sec >= ALL(SELECT d_min * 60 + d_sec FROM cd);
-- hled�m v�echny p�sn�, kter� nejsou nejd�le hraj�c�
-- pou�it mno�inov� oper�tor ANY/SOME
-- vno�en� dotaz vrac� mno�inu hodnot
SELECT pisen, d_min, d_sec
  FROM cd
 WHERE d_min * 60 + d_sec < ANY(SELECT d_min * 60 + d_sec FROM cd); 