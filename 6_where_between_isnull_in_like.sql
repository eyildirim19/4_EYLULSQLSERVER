
use Northwind

select * from Products
where UnitsInStock > 20 and UnitsInStock < 40
order by UnitsInStock

select * from Products
where UnitsInStock >= 20 and UnitsInStock <= 40
order by UnitsInStock

--between and => aral�k belirlemek i�in kullan�l�r
select * from Products
where UnitsInStock between 20 and 40
order by UnitsInStock

select * from Customers
where ContactTitle = 'Owner' or ContactTitle = 'Marketing Manager' or ContactTitle = 'Sales Manager'

-- in => birden fazla e�itlik durumubnu sorgulamak i�in kullan�l�r
-- ContactTitle Owner,Marketing Manager ve Sales Manager olan customerlari...
select * from Customers
where ContactTitle in ('Owner','Marketing Manager','Sales Manager')

select * from Products
where CategoryID in (1,2)

-- not in
select * from Customers
where ContactTitle not in ('Owner','Marketing Manager','Sales Manager')

-- null filtreleme
select * from Customers
where Fax is null

--null olmayan filteleme
select * from Customers
where Fax is not null

-- like => arama operat�r�
select * from Customers
where ContactTitle like '%Manager%'

select * from Customers
where ContactTitle not like '%Manager%'
