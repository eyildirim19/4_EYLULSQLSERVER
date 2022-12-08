--birden fazla tablo ile çalýþma yöntem 1.
select 
	--* -- her ikisinin bütün alanlar
	--p.* -- product'in bütün alanlarý
	--s.* -- suppliersin bütün alanlarý
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock,
	s.CompanyName,
	s.ContactName,
	s.ContactTitle
from Products p, Suppliers s
where p.SupplierID = s.SupplierID

/*
	JOINS => sorgu birleþtirme yöntemidir. iliþkisel verileri (farklý veya ayný topladaki) bir arada göstermek için kullanýlýr...

	iç birleþtirme 	
		INNER JOIN VEYA JOIN => sorguya dahil edilen tablolarýn eþleþeþen kayýtlarýný getirmek için kullanýlýr

	dýþ birleþtirme
	left outer join veya left join   => sorguya dahil edilen tablolardan sol tarafýn tamamýný sað tarafýn sadece eþleþen kayýtlarýný getir
	right outer join veya rigth join => left join'in tam tersi
	full outer join				  =>  sorguya dahil edilen tablolarýn eþleþen ve eþleþmeyen büyün kayýtlarýný getirir..

	cross join => tablolarýn elemanlarýnýn her birieyle eþleþtirilmesidir...


	select 
		*
	from tablo1
	join tablo2 // inner join
	on tablo1.alan = tablo2.alan
*/

-- not : join veya inner join ayný ifalerdir. join kýsaltmasýdýr..
select  *
from Products as p
join Suppliers as s
on p.SupplierID = s.SupplierID

select * from Products p
inner join Suppliers s
on p.SupplierID = s.SupplierID

select 
	c.CategoryName,
	COUNT(*) as UrunSayisi
from Products p
join Categories c
on p.CategoryID = c.CategoryID
group by c.CategoryName
having COUNT(*) > 10 -- group by ifaderinde kriter belirlemek için kullanýlýr. çünkü group by ifadesinden sonra where yazýlamaz...

select CategoryID from Products
--where CategoryID = 1
group by CategoryID
having CategoryID = 1

-- stok miktarý 10dan büyük olan ürünler ve kategorileri joinleyelim...

-- joinlerde kritere baðlý kayýtlar joinlenecekse eðer where yerine on ifadesinden sonra and ile devam etmek daha performanslýdýr.
select * from Products p
inner join Categories c
on p.CategoryID = c.CategoryID and p.UnitsInStock > 10
--where p.UnitsInStock > 10

select * from Suppliers


select * from Products p
inner join Categories c on c.CategoryID = p.CategoryID
inner join Suppliers s on s.SupplierID = p.SupplierID

select * from Categories c
join Products p  on c.CategoryID = p.CategoryID
-- sol tablonun tamamýný, sað tablonun sadece eþleþenlerini getirir. sol tarafta eþleþene ve eþleþmeyenler, sað tarafta eþleþenler listelenir
select * from Categories c
left join Products p on c.CategoryID = p.CategoryID
--left outer join Products p on c.CategoryID = p.CategoryID
-- ürün eklenmeyen kategorileri verir...
select c.* from Categories c
left join Products p on c.CategoryID = p.CategoryID
where p.ProductID is null

select * from Categories c
right join Products p on c.CategoryID = p.CategoryID
--right outer join Products p on c.CategoryID = p.CategoryID

-- full outer join => her iki tablonun eþleþen ve eþleþmeyen bütün kayýtlarýný getirir
select * from Categories c
full outer join Products p  on c.CategoryID = p.CategoryID
--where c.CategoryID is null
--where p.CategoryID is null

select * from Products p 
cross join Categories c
order by p.ProductID
