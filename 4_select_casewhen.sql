select 
	--FirstName,
	--LastName
	FirstName + ' ' + LastName as FullName
from Employees

-- case => SELECT �FADELER�NDE ALANLAR �ZER�NDEN KARAR MEKAN�ZMASI KURMAK ���N KULLANILIR
select 
	ProductName,
	CategoryID,
	UnitsInStock,
	UnitPrice,
	case 
		when UnitsInStock < 10 then 'STOK B�TMEK �ZERE'
		when UnitsInStock > 10 and UnitsInStock < 30 then 'STOK �Y�'
		else 'STOK NORMAL'
	end,
	case 
		when UnitPrice <= 10 then 'Ucuz'
		when UnitPrice > 10 and UnitPrice < 30 then 'Normal'
		else 'Pahal�'
	end as FiyatDurum
from Products

-- sql dili case sensetive dil de�ildir. 
SELECT 'AA'
select 'aa'