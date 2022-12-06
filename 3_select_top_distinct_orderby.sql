
use Northwind -- çalýþýlacak veritabanýný seçer



-- column as => 
select 
	CategoryID as ID,
	CategoryName as Name,
	Description as Aciklama
from Categories


select 
	ProductName as 'Ürun Adý',
	ProductName as [Ürun Adý],
	ProductName Adi -- alan isminden sonra as zorunluðu yoktur. as yazamadanda takma isimi bu satýrda olduðu gibi verilebilir
from Products

-- table as => özellikle birden fazla tablo ile çalýþýrken sýk kullanýlýr...
-- tablonun bütün alanlarý...
select	
	m.* 
from Customers as m

select 
	sp.CompanyName,
	sp.ContactName,
	sp.City
from Suppliers as sp

select 
	City
from Customers

-- alanlardaki benzersiz kayýtlarý bulma..
--distinct ifadesi alanlardaki tekrar eden kayýtlarý elimine eder
select
	distinct City
from Customers

select
	City
from Employees

select 
	distinct City
from Employees

-- kayýt sýralama
--order by => sýralama ifadesi resultta tablodaki kayýtlarý belirli alan veya alanlara göre sýralar..
select * from Products
order by UnitPrice asc  -- artan sýrala

-- order by  kullanýmýnda asc belirtilmezse default sýrala yine asc'dir.
select  * from Products
order by UnitPrice

select * from Products
order by UnitPrice desc

-- top n => resultta n adet kaydý (satýr) seçmek için kullanýlýr
select * from Products

select top 10 * from Products

-- en pahalý 5 ürün
select top 5 * from Products
order by UnitPrice desc

-- en son eklenen 10 ürün
select top 10 * from Products
order by ProductID desc