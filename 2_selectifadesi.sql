
select 'A'
select 1

-- as  => alias => takma isim tablo veya select ifadelerindeki kolon adlarýna isim verme yöntemidir. bu yöntem ile alan isimleri veya tablo isimleri query alanýnda deðiþtirilir. ve resultta as ifadeleri görünür. buda gerçek tablosu isimlerimizi gizlemede veya anlaþýlýr þekilde adlandýrmada veya çoklu tablolara çalýþýrken alan seçmede iþimi kolaylaþtýrýr...

select  'Ekrem','Yýldýrým'
select 'Ekrem' as Adi,'YILDIRIM' as SoyAdi

select CategoryName from Categories
select Description from Categories

select CategoryName,Description from Categories

-- sql'de queryler tek satýr olarak yorumlanýr....
select
	CategoryName,
	Description
from Categories

--eðer tablodaki alanlarýn tamamýný seçmek istiyorsak..
-- * tablodaki alanlarýn tamaanýný ifade eder..

-- * çok sýk tercih edilen bir ifade olmamalý.çünkü tablodaki bütün alanlarý çekmek sorgu performansýný düþürecektir. bu yüzden sadece çalýþýlacak alanlar seçilmelidir..

select *
from Categories -- categoriler

select * from Products -- ürünler

select * from Suppliers -- tedarikçiler

select * from Employees -- çalýþanlar

select * from Orders -- sipariþler

select * from [Order Details] -- sipariþ detaylar

select * from Customers -- müþteri

select * from Shippers -- nakliyeci

select * from Territories -- eyalet

select * from Region -- Bölgeler


