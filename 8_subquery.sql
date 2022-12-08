
--
declare @count int
-- deðiþkene deðer atama
set @count = (select COUNT(*) from Categories)
select @count

declare @catId int =(select CategoryId from Categories
						where CategoryName = 'Beverages')

declare @count2 int
select @count2 = COUNT(*) from Products where CategoryID =@catId
select @count2

--subquery (alt sorgular)
-- sorgu içerisinde her bir satýr için çalýþtýrýlýrlar. önce dýþtaki sorgu çalýþýr, sonra içteki sorgu çalýþýr.. 
select 
	CategoryID,
	CategoryName,
	Description,
	(select COUNT(*) from Products where CategoryID = p.CategoryID) as UrunSayisi
	--(select COUNT(*) from Products)
from Categories p -- 2 yöntem
--from Categories as p--1. yöntem

select 
	ProductName,
	UnitPrice,
	UnitsInStock,
--	(select * from Categories where CategoryId  = u.CategoryId) --NOT :SUBQUERY GERÝYE TEK BÝR ALAN DÖNEBÝLÝR
	(select CategoryName from Categories where CategoryId  = u.CategoryId) AS KatAdi,
	CategoryID
from Products u



-- ürünü olan kategoriler..

--ortalama fiyatý alalým....
declare @ortalamaFiyat int =(select AVG(UnitPrice) from Products)
--select @ortalamaFiyat

--fiyatý ortalama fiyatýn üstündeki productlar...
select * from Products
where UnitPrice > @ortalamaFiyat

--subquery
select * from Products
where UnitPrice > (select AVG(UnitPrice) from Products)
order by UnitPrice 

-- ürünü olan kategorileri seçelim...
select * from Categories 
where CategoryId in (select CategoryID from Products)

-- ürünü olmayan kategoriler...
select * from Categories
where CategoryID not in (select CategoryID from Products)

