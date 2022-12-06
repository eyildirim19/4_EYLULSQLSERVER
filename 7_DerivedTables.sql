select 
	ProductName,
	UnitsInStock as Stok
from Products
where Stok >10
order by Stok

select 
	FirstName + ' ' + LastName as FullName,
	Title
from Employees
order by FullName

select 
	CustomerID,
	COUNT(*) as SiparisSayisi
from Orders
group by CustomerID
--order by COUNT(*)
order by SiparisSayisi

--derived tables => t�retilmi� tablolar... ba�ka bir tablodan t�retilen tablolard�r
/*
	select * from ( --- d�� sorgu
		select * from -- i� sorgudur
	) as result
*/
select * from (
	select * from Categories
) as r

select * from (
	select ProductName,UnitPrice,UnitsInStock from Products
) as result
--derived table'larda kural i� sorgudan ��kacak alanlar�n ismi olmal�d�r. 
select * from 
(
	select 
		ProductName,
		 case when UnitsInStock between 0 and 20 then 'Stok Az'
		 else 'Stok Yeterli'
		 end as StokDurum
	from Products
) as urunStokDurumlari
where StokDurum = 'Stok Az'
-- derived table sadece bulundu�u sat�rda ge�erlidir. alt sat�rlardan eri�ilemez..
-- e�er t�retilen tablo ba�ka sat�rlarda da kullan�lacaksa di�er bir alternatif olan de�i�ken tablolar kullan�labilir..
-- de�i�ken tablolar...
declare @calisanlar table ( adsoyad nvarchar(50),unvan nvarchar(50), dogumtarih date)
--select * from @calisanlar
insert @calisanlar -- calisanlar tablolana kay�t ekle
select  -- select ile ��kan sonu� @calisanlar tablolosuna eklenecektir...
	FirstName + ' ' + LastName ,
	Title,
	BirthDate
from
Employees
-- temp table (ge�ici tablolar...) o oturumda silinmedi�i s�rece kullan�lan tablolard�r...
-- temp table Databases sekmesinde System Databases alt�nda tempdb alt�nda fiziki g�r�lebilir....
-- tablo olu�turulur
select  
	*
	into #koleler
from Employees
-- tablo burada kullan�l�r...
select * from #koleler

drop table #koleler -- tabloyu sil...
-- drop ifadesi sql objelerini silmek i�in kullan�l�r..
select  
	*
	into ##koleler
from Employees


drop table ##koleler -- tabloyu sil....



select *
	into Calisanlar
from Employees