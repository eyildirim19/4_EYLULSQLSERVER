select 
	--FirstName,
	--LastName
	FirstName + ' ' + LastName as FullName
from Employees

-- case => SELECT ÝFADELERÝNDE ALANLAR ÜZERÝNDEN KARAR MEKANÝZMASI KURMAK ÝÇÝN KULLANILIR
select 
	ProductName,
	CategoryID,
	UnitsInStock,
	UnitPrice,
	case 
		when UnitsInStock < 10 then 'STOK BÝTMEK ÜZERE'
		when UnitsInStock > 10 and UnitsInStock < 30 then 'STOK ÝYÝ'
		else 'STOK NORMAL'
	end,
	case 
		when UnitPrice <= 10 then 'Ucuz'
		when UnitPrice > 10 and UnitPrice < 30 then 'Normal'
		else 'Pahalý'
	end as FiyatDurum
from Products

-- sql dili case sensetive dil deðildir. 
SELECT 'AA'
select 'aa'