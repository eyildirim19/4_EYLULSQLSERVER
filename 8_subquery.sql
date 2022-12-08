
--
declare @count int
-- de�i�kene de�er atama
set @count = (select COUNT(*) from Categories)
select @count

declare @catId int =(select CategoryId from Categories
						where CategoryName = 'Beverages')

declare @count2 int
select @count2 = COUNT(*) from Products where CategoryID =@catId
select @count2

--subquery (alt sorgular)
-- sorgu i�erisinde her bir sat�r i�in �al��t�r�l�rlar. �nce d��taki sorgu �al���r, sonra i�teki sorgu �al���r.. 
select 
	CategoryID,
	CategoryName,
	Description,
	(select COUNT(*) from Products where CategoryID = p.CategoryID) as UrunSayisi
	--(select COUNT(*) from Products)
from Categories p -- 2 y�ntem
--from Categories as p--1. y�ntem

select 
	ProductName,
	UnitPrice,
	UnitsInStock,
--	(select * from Categories where CategoryId  = u.CategoryId) --NOT :SUBQUERY GER�YE TEK B�R ALAN D�NEB�L�R
	(select CategoryName from Categories where CategoryId  = u.CategoryId) AS KatAdi,
	CategoryID
from Products u



-- �r�n� olan kategoriler..

--ortalama fiyat� alal�m....
declare @ortalamaFiyat int =(select AVG(UnitPrice) from Products)
--select @ortalamaFiyat

--fiyat� ortalama fiyat�n �st�ndeki productlar...
select * from Products
where UnitPrice > @ortalamaFiyat

--subquery
select * from Products
where UnitPrice > (select AVG(UnitPrice) from Products)
order by UnitPrice 

-- �r�n� olan kategorileri se�elim...
select * from Categories 
where CategoryId in (select CategoryID from Products)

-- �r�n� olmayan kategoriler...
select * from Categories
where CategoryID not in (select CategoryID from Products)

