#WorkBench modulo SQL 
#creazione del DB 

create database WorkBench_Epicode_MySQL;


use workbench_epicode_mysql;

create table Product(
	ProductID int auto_increment primary key,
    ProductName varchar(50),
    CategoryName varchar(50)
);

create table Region(
	RegionID int auto_increment primary key,
    StateName varchar(50),
    RegionName varchar(50)
);

create table Sales(
	SalesID int auto_increment primary key,
    RegionID int,
    ProductID int,
    DateSale date,
    UnitePrice decimal(18,2),
foreign key (ProductID) references Product(ProductID),
foreign key (RegionID) references Region(RegionID)
);

#inserimento dei valori generati con la IA in riferimento alla traccia che diceva di popolare il database dopo averlo creato

INSERT INTO Product (ProductName, CategoryName) VALUES
('The Lost Kingdom', 'RPG'),
('Shadow Protocol', 'Sparatutto'),
('Turbo Racers 2025', 'Racing'),
('Dungeon Master X', 'RPG'),
('Football Champions', 'Sport'),
('Zombie Outbreak', 'Survival Horror'),
('Space Invaders Neo', 'Sparatutto'),
('Mystery Island', 'Avventura'),
('Street Fighter Legacy', 'Picchiaduro'),
('NBA Legends 2025', 'Sport'),
('Minecraft Worlds Pro', 'Sandbox'),
('Dragon Quest XII', 'RPG'),
('Neon Drift', 'Racing'),
('Sniper Elite 6', 'Sparatutto'),
('SimCity Ultra', 'Simulazione'),
('Age of Empires VI', 'Strategia'),
('Cyberpunk Arena', 'Azione'),
('Puzzle Master 3D', 'Puzzle'),
('FIFA 2026', 'Sport'),
('Resident Evil 9', 'Survival Horror');

INSERT INTO Region (StateName, RegionName) VALUES
('Lombardia', 'Nord-Ovest'),
('Piemonte', 'Nord-Ovest'),
('Liguria', 'Nord-Ovest'),
('Valle d\'Aosta', 'Nord-Ovest'),
('Veneto', 'Nord-Est'),
('Trentino-Alto Adige', 'Nord-Est'),
('Friuli-Venezia Giulia', 'Nord-Est'),
('Emilia-Romagna', 'Nord-Est'),
('Toscana', 'Centro'),
('Umbria', 'Centro'),
('Marche', 'Centro'),
('Lazio', 'Centro'),
('Campania', 'Sud'),
('Puglia', 'Sud'),
('Basilicata', 'Sud'),
('Calabria', 'Sud'),
('Sicilia', 'Isole'),
('Sardegna', 'Isole'),
('Abruzzo', 'Sud'),
('Molise', 'Sud');

INSERT INTO Sales (RegionID, ProductID, DateSale, UnitePrice) VALUES
(1,  1,  '2024-01-08', 59.99),
(2,  5,  '2024-01-15', 49.99),
(3,  12, '2024-01-22', 69.99),
(4,  3,  '2024-02-03', 39.99),
(5,  19, '2024-02-10', 59.99),
(6,  7,  '2024-02-18', 29.99),
(7,  16, '2024-03-01', 49.99),
(8,  20, '2024-03-09', 69.99),
(9,  2,  '2024-03-17', 54.99),
(10, 11, '2024-04-04', 34.99),
(11, 6,  '2024-04-12', 44.99),
(12, 15, '2024-04-25', 39.99),
(13, 9,  '2024-05-06', 29.99),
(14, 17, '2024-05-14', 59.99),
(15, 4,  '2024-05-20', 49.99),
(16, 13, '2024-06-03', 39.99),
(17, 8,  '2024-06-11', 34.99),
(18, 18, '2024-06-24', 19.99),
(19, 10, '2024-07-02', 54.99),
(20, 14, '2024-07-16', 44.99);

#controllo che i valori siano stati caricati correttamente

select * from product;
select * from region;
select * from sales;

#1)	Verificare che i campi definiti come PK siano univoci. 
#In altre parole, scrivi una query per determinare l’univocità dei valori di ciascuna PK (una query per tabella implementata).

select count(*) ConteggioRighe,
	count(distinct ProductID) Conteggio from product;

#abbiamo fatto la stessa cosa ma in maniera differente da quella precedente
    
select SalesID, count(*) ConteggioRighe
from sales group by SalesID
having ConteggioRighe > 1;

#2)	Esporre l’elenco delle transazioni indicando nel result set il codice documento, la data, il nome del prodotto, la categoria del prodotto,
#il nome dello stato, il nome della regione di vendita 
#e un campo booleano valorizzato in base alla condizione che siano passati più di 180 giorni dalla data vendita o meno (>180 -> True, <= 180 -> False)

select 
	s.SalesID, 
	s.DateSale			DataVendita, 
    p.ProductName		NomeProdotto, 
    p.CategoryName		NomeCategoria, 
    r.StateName			NomeStato, 
    r.RegionName		NomeRegione,
case 
when datediff(curdate(), DateSale) > 180 then 1 
else 0 
end "180_gg_flg"
from sales s
join product p on s.ProductID = p.ProductID
join region r on r.RegionID = s.RegionID;

#3)	Esporre l’elenco dei prodotti che hanno venduto, in totale, una quantità maggiore della media delle vendite realizzate nell’ultimo anno censito. 
#(ogni valore della condizione deve risultare da una query e non deve essere inserito a mano). 
#Nel result set devono comparire solo il codice prodotto e il totale venduto.

SELECT 
    ProductID,
    COUNT(*) AS TotaleVenduto
FROM Sales
WHERE YEAR(DateSale) = (
        SELECT MAX(YEAR(DateSale)) FROM Sales
    )
GROUP BY ProductID
HAVING COUNT(*) > (
    SELECT AVG(VenditePerProdotto)
    FROM (
        SELECT COUNT(*) AS VenditePerProdotto
        FROM Sales
        WHERE YEAR(DateSale) = (
                SELECT MAX(YEAR(DateSale)) FROM Sales
            )
        GROUP BY ProductID
    ) AS SubMedia
);

#ci darà dei valori non visibili in tabella per colpa dei valori che abbiamo inserito in precedenza con l'aiuto della IA,
#quindi di seguito faremo una query che ci farà visualizzare  tutti i prodotti con valore 1

SELECT 
    ProductID,
    COUNT(*) AS TotaleVenduto
FROM Sales
WHERE YEAR(DateSale) = (SELECT MAX(YEAR(DateSale)) FROM Sales)
GROUP BY ProductID;

#4)	Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno. 

select
	p.ProductID		CodiceProdotto,
    p.ProductName 	NomeProdotto,
    year(s.DateSale)	Anno,
    sum(s.UnitePrice)	FatturatoTotale
	from sales s
join product p on s.ProductID = p.ProductID
group by p.ProductID, p.ProductName, year(s.DateSale)
order by p.ProductID, Anno;

#5)	Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.

select 
	r.StateName 	NomeStato,
    year(s.DateSale) 	Anno,
    sum(s.UnitePrice) 	FatturatoTotale
from sales s
join region r on s.RegionID = r.RegionID
group by r.StateName, year(s.DateSale)
order by Anno asc, FatturatoTotale desc;

#6)	Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?

select
	p.CategoryName 		NomeCategoria,
    count(*)	TotaleVendite
from sales s
join product p on s.ProductID = p.ProductID
group by p.CategoryName
order by TotaleVendite desc
limit 1;

#7)	Rispondere alla seguente domanda: quali sono i prodotti invenduti? Proponi due approcci risolutivi differenti.
#primo approccio
select
	p.ProductID 	CodiceProdotto,
    p.ProductName 	NomeProdotto,
    p.CategoryName 	NomeCategoria
from product p
join sales s on p.ProductID = s.ProductID
where s.ProductID is null;

#secondo approccio

select
	p.ProductID 	CodiceProdotto,
    p.ProductName 	NomeProdotto,
    p.CategoryName 	NomeCategoria
from product p
where not exists (
	select 1
    from sales s 
    where s.ProductID = p.ProductID
    );
    
#8)	Creare una vista sui prodotti in modo tale da esporre una “versione denormalizzata” delle informazioni utili 
#codice prodotto, nome prodotto, nome categoria

create view vw_Prodotti as
select
	p.ProductID 	CodiceProdotto,
    p.ProductName	NomeProdotto,
    p.CategoryName	NomeCategoria
from product p;

select * from vw_Prodotti;
    
#9)	Creare una vista per le informazioni geografiche

create view vw_Geografia as
select
	r.RegionID		CodiceRegione,
    r.StateName 	NomeStato,
    r.RegionName 	NomeRegione
from region r;

select * from vw_Geografia;

    
    
    
    
    
    
    
    