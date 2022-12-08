/*
	DML (DATA MANIPULATION LANGUAGE)

	insert => kayýt eklemek 
	update => kayýt güncellemek
	delete => kayýt silmek 
*/

--insert into Categories
--identity alanlara insert ile kayýt eklenemez...

select * from Categories

insert Categories
(CategoryName,Description)
values
('Deneme Kat','Denemee açýklama')

insert Shippers
(CompanyName,Phone)
values
('BT Taþýmacýlýk','y1283217938')

-- kayýt güncelleme
-- Not : update ve delete ifadeleri tüm satýrý etkiler bu yüzden where ile kullanýlmalýdýr..

-- CompanyName BT Taþýmacýlý olan(lar) kaydýn companyname deðiþtirelim..
update Shippers
	set CompanyName = 'BT Hýzlý Taþýmacýlýk'
where CompanyName = 'BT Taþýmacýlýk'

-- ShipperID'si 4 olan kaydýn Phone ve CompanyName'ini deðiþtirelim...
update Shippers
	set Phone = '12345',
		CompanyName = 'BT Express'
where ShipperID = 4

-- SupplierID 1 olan ürünlerin fiyatlarýn 10 birim arttýralým....
update Products
	set UnitPrice = UnitPrice + 10
where SupplierID = 1

--kayýt silme
-- NOT : delete tablonun tamamaný etkiler bu yüzden where ile kullanýlmalýdýr..

--geçici tabloaya kategorileri aktaralým...
select * 
	into #gecicikat
from Categories

select * from #gecicikat

delete from #gecicikat -- tablodaki kayýtlarý silelim..
where CategoryID in (1,2,3)-- CategoryID'si 1,2,3 olanlarý silelim....
select * from #gecicikat

drop table #gecicikat