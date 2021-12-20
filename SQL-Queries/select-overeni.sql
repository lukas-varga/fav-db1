select count(*)
    from osoby;

select count(*)
    from osoby
    where id_karty IS NOT NULL;
    
select count(*) 
    from karty
    where not exists (select * from 
                        osoby where id_karty = karty.id_karty);
    
select o.id_osoby, k.pin
    from osoby o inner join karty k on o.id_karty = k.id_karty;
    
select o.id_osoby, k.pin
    from osoby o left outer join karty k on o.id_karty = k.id_karty;
    
    
select o.jmeno, o.prijmeni
    from osoby o,
        clenove_skupin c,
        skupiny s
    where s.jmeno = 'Udrzbari'
        and s.id_skupiny = c.id_skupiny
        and c.id_osoby = o.id_osoby;
        
select s.jmeno, count(c.id_osoby)
    from clenove_skupin c,
        skupiny s
    where s.id_skupiny = c.id_skupiny
    group by s.jmeno;
        
    
        
select s.jmeno, count(c.id_osoby)
    from skupiny.s,
        clenove_skupin c
    where s.id_skupiny = c.id_skupiny;    
    