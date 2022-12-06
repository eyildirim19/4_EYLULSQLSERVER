
select 'A'
select 1

-- as  => alias => takma isim tablo veya select ifadelerindeki kolon adlar�na isim verme y�ntemidir. bu y�ntem ile alan isimleri veya tablo isimleri query alan�nda de�i�tirilir. ve resultta as ifadeleri g�r�n�r. buda ger�ek tablosu isimlerimizi gizlemede veya anla��l�r �ekilde adland�rmada veya �oklu tablolara �al���rken alan se�mede i�imi kolayla�t�r�r...

select  'Ekrem','Y�ld�r�m'
select 'Ekrem' as Adi,'YILDIRIM' as SoyAdi

select CategoryName from Categories
select Description from Categories

select CategoryName,Description from Categories

-- sql'de queryler tek sat�r olarak yorumlan�r....
select
	CategoryName,
	Description
from Categories

--e�er tablodaki alanlar�n tamam�n� se�mek istiyorsak..
-- * tablodaki alanlar�n tamaan�n� ifade eder..

-- * �ok s�k tercih edilen bir ifade olmamal�.��nk� tablodaki b�t�n alanlar� �ekmek sorgu performans�n� d���recektir. bu y�zden sadece �al���lacak alanlar se�ilmelidir..

select *
from Categories -- categoriler

select * from Products -- �r�nler

select * from Suppliers -- tedarik�iler

select * from Employees -- �al��anlar

select * from Orders -- sipari�ler

select * from [Order Details] -- sipari� detaylar

select * from Customers -- m��teri

select * from Shippers -- nakliyeci

select * from Territories -- eyalet

select * from Region -- B�lgeler


