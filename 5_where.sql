--where => kriter belirleme sorguya kriter belirlenerek satýr filtreme yapar..
select * from Products
where Discontinued =1

select * from Suppliers
where Country = 'UK'

SELECT * FROM Employees
where Title = 'Sales Manager'

select * from Employees
where EmployeeID = 1

select * from Products
where CategoryID =1
order by UnitPrice

select  * from Products
where UnitsInStock>20

select * from Products
where UnitsInStock > 20 and UnitsInStock < 30

select * from Products
where UnitsInStock > 20 and CategoryID = 1

select * from Employees
where Title = 'Sales Representative' or Title ='Sales Manager'