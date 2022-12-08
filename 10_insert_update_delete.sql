/*
	DML (DATA MANIPULATION LANGUAGE)

	insert => kay�t eklemek 
	update => kay�t g�ncellemek
	delete => kay�t silmek 
*/

--insert into Categories
--identity alanlara insert ile kay�t eklenemez...

select * from Categories

insert Categories
(CategoryName,Description)
values
('Deneme Kat','Denemee a��klama')

insert Shippers
(CompanyName,Phone)
values
('BT Ta��mac�l�k','y1283217938')

-- kay�t g�ncelleme
-- Not : update ve delete ifadeleri t�m sat�r� etkiler bu y�zden where ile kullan�lmal�d�r..

-- CompanyName BT Ta��mac�l� olan(lar) kayd�n companyname de�i�tirelim..
update Shippers
	set CompanyName = 'BT H�zl� Ta��mac�l�k'
where CompanyName = 'BT Ta��mac�l�k'

-- ShipperID'si 4 olan kayd�n Phone ve CompanyName'ini de�i�tirelim...
update Shippers
	set Phone = '12345',
		CompanyName = 'BT Express'
where ShipperID = 4

-- SupplierID 1 olan �r�nlerin fiyatlar�n 10 birim artt�ral�m....
update Products
	set UnitPrice = UnitPrice + 10
where SupplierID = 1

--kay�t silme
-- NOT : delete tablonun tamaman� etkiler bu y�zden where ile kullan�lmal�d�r..

--ge�ici tabloaya kategorileri aktaral�m...
select * 
	into #gecicikat
from Categories

select * from #gecicikat

delete from #gecicikat -- tablodaki kay�tlar� silelim..
where CategoryID in (1,2,3)-- CategoryID'si 1,2,3 olanlar� silelim....
select * from #gecicikat

drop table #gecicikat