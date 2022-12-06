
use Northwind -- �al���lacak veritaban�n� se�er



-- column as => 
select 
	CategoryID as ID,
	CategoryName as Name,
	Description as Aciklama
from Categories


select 
	ProductName as '�run Ad�',
	ProductName as [�run Ad�],
	ProductName Adi -- alan isminden sonra as zorunlu�u yoktur. as yazamadanda takma isimi bu sat�rda oldu�u gibi verilebilir
from Products

-- table as => �zellikle birden fazla tablo ile �al���rken s�k kullan�l�r...
-- tablonun b�t�n alanlar�...
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

-- alanlardaki benzersiz kay�tlar� bulma..
--distinct ifadesi alanlardaki tekrar eden kay�tlar� elimine eder
select
	distinct City
from Customers

select
	City
from Employees

select 
	distinct City
from Employees

-- kay�t s�ralama
--order by => s�ralama ifadesi resultta tablodaki kay�tlar� belirli alan veya alanlara g�re s�ralar..
select * from Products
order by UnitPrice asc  -- artan s�rala

-- order by  kullan�m�nda asc belirtilmezse default s�rala yine asc'dir.
select  * from Products
order by UnitPrice

select * from Products
order by UnitPrice desc

-- top n => resultta n adet kayd� (sat�r) se�mek i�in kullan�l�r
select * from Products

select top 10 * from Products

-- en pahal� 5 �r�n
select top 5 * from Products
order by UnitPrice desc

-- en son eklenen 10 �r�n
select top 10 * from Products
order by ProductID desc