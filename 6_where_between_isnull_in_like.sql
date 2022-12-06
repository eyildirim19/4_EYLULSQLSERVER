
use Northwind

select * from Products
where UnitsInStock > 20 and UnitsInStock < 40
order by UnitsInStock

select * from Products
where UnitsInStock >= 20 and UnitsInStock <= 40
order by UnitsInStock

--between and => aralýk belirlemek için kullanýlýr
select * from Products
where UnitsInStock between 20 and 40
order by UnitsInStock

select * from Customers
where ContactTitle = 'Owner' or ContactTitle = 'Marketing Manager' or ContactTitle = 'Sales Manager'

-- in => birden fazla eþitlik durumubnu sorgulamak için kullanýlýr
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

-- like => arama operatörü
select * from Customers
where ContactTitle like '%Manager%'

select * from Customers
where ContactTitle not like '%Manager%'
