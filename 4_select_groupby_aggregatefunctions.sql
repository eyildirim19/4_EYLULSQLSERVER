
select distinct CategoryID from Products

--group by => belirtilen alana(lara) göre kayýtlarý gruplar..
select 
  	CategoryID
from Products
group by CategoryID

select 
	Title
from Employees
group by Title

-- not group by kullanýmýnda select ile groplanan alanlar seçilebilir
select Title,City from Employees
group by Title,City


--Aggregate functions
-- Count tablodaki satýr sayýsýný döner...
select COUNT(*) from Employees
select COUNT(EmployeeId) from Employees


-- bütün titlelarý sayar..
select COUNT(Title) from Employees

-- benzersiz titlelarý sayar..
select COUNT(distinct Title),COUNT(Title) from Employees

-- Count içerisine eðer * yazýlýrsa bütün satýrlarý sayar...
--count içerisine * yerine alan yazýlýrsa null olmayan alanlarý yazar....
select  COUNT(*) from Customers -- 91
select COUNT(Fax) from Customers --69


select MAX(UnitPrice) FROM Products
select MIN(UnitPrice) FROM Products
select AVG(UnitPrice) FROM Products
SELECT SUM(UnitPrice) from Products


-- GETDATE=> geriye o anki tarihi döner
select GETDATE() from Products

select
	GETDATE(),
	CategoryID
from Products

--aggregate functionlar geriye tek satýr tek sütun dönerler. sorgudan dönen tablo sonucuna baþka bir alan eklenemez...

--select 
--	COUNT(*)
--	,CategoryID
--from Products
select CategoryID from Products
group by CategoryID

select 
	COUNT(*)
	,CategoryID
from Products
group by CategoryID

select 
	Max(UnitPrice)
	,CategoryID
from Products
group by CategoryID

select 
	CategoryID,
	SUM(UnitsInStock)
from Products
group by CategoryID

select ProductID from [Order Details]
group by ProductID

select
	ProductID,
	COUNT(*),
	SUM(UnitPrice),
	SUM(Quantity)
from [Order Details]
group by ProductID
ORDER BY ProductID