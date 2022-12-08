--birden fazla tablo ile �al��ma y�ntem 1.
select 
	--* -- her ikisinin b�t�n alanlar
	--p.* -- product'in b�t�n alanlar�
	--s.* -- suppliersin b�t�n alanlar�
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock,
	s.CompanyName,
	s.ContactName,
	s.ContactTitle
from Products p, Suppliers s
where p.SupplierID = s.SupplierID

/*
	JOINS => sorgu birle�tirme y�ntemidir. ili�kisel verileri (farkl� veya ayn� topladaki) bir arada g�stermek i�in kullan�l�r...

	i� birle�tirme 	
		INNER JOIN VEYA JOIN => sorguya dahil edilen tablolar�n e�le�e�en kay�tlar�n� getirmek i�in kullan�l�r

	d�� birle�tirme
	left outer join veya left join   => sorguya dahil edilen tablolardan sol taraf�n tamam�n� sa� taraf�n sadece e�le�en kay�tlar�n� getir
	right outer join veya rigth join => left join'in tam tersi
	full outer join				  =>  sorguya dahil edilen tablolar�n e�le�en ve e�le�meyen b�y�n kay�tlar�n� getirir..

	cross join => tablolar�n elemanlar�n�n her birieyle e�le�tirilmesidir...


	select 
		*
	from tablo1
	join tablo2 // inner join
	on tablo1.alan = tablo2.alan
*/

-- not : join veya inner join ayn� ifalerdir. join k�saltmas�d�r..
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
having COUNT(*) > 10 -- group by ifaderinde kriter belirlemek i�in kullan�l�r. ��nk� group by ifadesinden sonra where yaz�lamaz...

select CategoryID from Products
--where CategoryID = 1
group by CategoryID
having CategoryID = 1

-- stok miktar� 10dan b�y�k olan �r�nler ve kategorileri joinleyelim...

-- joinlerde kritere ba�l� kay�tlar joinlenecekse e�er where yerine on ifadesinden sonra and ile devam etmek daha performansl�d�r.
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
-- sol tablonun tamam�n�, sa� tablonun sadece e�le�enlerini getirir. sol tarafta e�le�ene ve e�le�meyenler, sa� tarafta e�le�enler listelenir
select * from Categories c
left join Products p on c.CategoryID = p.CategoryID
--left outer join Products p on c.CategoryID = p.CategoryID
-- �r�n eklenmeyen kategorileri verir...
select c.* from Categories c
left join Products p on c.CategoryID = p.CategoryID
where p.ProductID is null

select * from Categories c
right join Products p on c.CategoryID = p.CategoryID
--right outer join Products p on c.CategoryID = p.CategoryID

-- full outer join => her iki tablonun e�le�en ve e�le�meyen b�t�n kay�tlar�n� getirir
select * from Categories c
full outer join Products p  on c.CategoryID = p.CategoryID
--where c.CategoryID is null
--where p.CategoryID is null

select * from Products p 
cross join Categories c
order by p.ProductID
