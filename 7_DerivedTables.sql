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

--derived tables => türetilmiþ tablolar... baþka bir tablodan türetilen tablolardýr
/*
	select * from ( --- dýþ sorgu
		select * from -- iç sorgudur
	) as result
*/
select * from (
	select * from Categories
) as r

select * from (
	select ProductName,UnitPrice,UnitsInStock from Products
) as result
--derived table'larda kural iç sorgudan çýkacak alanlarýn ismi olmalýdýr. 
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
-- derived table sadece bulunduðu satýrda geçerlidir. alt satýrlardan eriþilemez..
-- eðer türetilen tablo baþka satýrlarda da kullanýlacaksa diðer bir alternatif olan deðiþken tablolar kullanýlabilir..
-- deðiþken tablolar...
declare @calisanlar table ( adsoyad nvarchar(50),unvan nvarchar(50), dogumtarih date)
--select * from @calisanlar
insert @calisanlar -- calisanlar tablolana kayýt ekle
select  -- select ile çýkan sonuç @calisanlar tablolosuna eklenecektir...
	FirstName + ' ' + LastName ,
	Title,
	BirthDate
from
Employees
-- temp table (geçici tablolar...) o oturumda silinmediði sürece kullanýlan tablolardýr...
-- temp table Databases sekmesinde System Databases altýnda tempdb altýnda fiziki görülebilir....
-- tablo oluþturulur
select  
	*
	into #koleler
from Employees
-- tablo burada kullanýlýr...
select * from #koleler

drop table #koleler -- tabloyu sil...
-- drop ifadesi sql objelerini silmek için kullanýlýr..
select  
	*
	into ##koleler
from Employees


drop table ##koleler -- tabloyu sil....



select *
	into Calisanlar
from Employees