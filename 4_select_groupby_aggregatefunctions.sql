
select distinct CategoryID from Products

--group by => belirtilen alana(lara) g�re kay�tlar� gruplar..
select 
  	CategoryID
from Products
group by CategoryID

select 
	Title
from Employees
group by Title

-- not group by kullan�m�nda select ile groplanan alanlar se�ilebilir
select Title,City from Employees
group by Title,City


--Aggregate functions
-- Count tablodaki sat�r say�s�n� d�ner...
select COUNT(*) from Employees
select COUNT(EmployeeId) from Employees


-- b�t�n titlelar� sayar..
select COUNT(Title) from Employees

-- benzersiz titlelar� sayar..
select COUNT(distinct Title),COUNT(Title) from Employees

-- Count i�erisine e�er * yaz�l�rsa b�t�n sat�rlar� sayar...
--count i�erisine * yerine alan yaz�l�rsa null olmayan alanlar� yazar....
select  COUNT(*) from Customers -- 91
select COUNT(Fax) from Customers --69


select MAX(UnitPrice) FROM Products
select MIN(UnitPrice) FROM Products
select AVG(UnitPrice) FROM Products
SELECT SUM(UnitPrice) from Products


-- GETDATE=> geriye o anki tarihi d�ner
select GETDATE() from Products

select
	GETDATE(),
	CategoryID
from Products

--aggregate functionlar geriye tek sat�r tek s�tun d�nerler. sorgudan d�nen tablo sonucuna ba�ka bir alan eklenemez...

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