
-- EXECUTE => KISA YOLU F5. SQL KOMUTUNU ÇALIÞTIRIR. NOT : SQL'DE EXECUTE EDÝLDÝÐÝNDE EÐER BELÝRTÝLMEZSE QUERY PENCERESÝNDEKÝ BÜTÜN KOMUTLAR ÇALIÞTIRILIR. BU TEHLÝKELÝ BÝR DURUMDUR. BU YÜZDEN SADECE ÇALIÞTIRMAK ÝSTEDÝÐÝMÝZ KODU SEÇÝP EXECUTE EDÝYORUZ...

-- YAZDIRMAK ÝÇÝN
print 'MERHABA SQL'

-- VERÝ SEÇMEK ÝÇÝN
--SQL'DE ' TIRNAK STRÝNG ÝFADESÝDÝR... SQL " YOKTUR
--SELECT "MERHABA"
SELECT 'MERHABA SQL'
SELECT 1

--sql (struct query language) yapýsal sorgulama dili. iliþkisel veritabanlarýnda sorgu dilir. 
--t-sql (transact-sql ) => microsoft tarafýndan geliþtirilmiþ sql server ortamýnda yazýlan ve yürütülen sql dilir...


-- DEÐÝÞKEN TANIMLAMA... VE ÝLK DEÐER ATAMA
DECLARE @NAME NVARCHAR(50) = 'EKREM'
DECLARE @SURNAME NVARCHAR(50)-- DEÐÝÞKEN TANIMLAMA
DECLARE @AGE INT,@GENDER BIT -- TEK SATIRDA BÝRDEN FAZLA DEÐÝÞKEN TANIMLAMA
-- DEÐÝÞKENE DEÐER ATAMA
-- DEÐÝÞKENLERE DEÐER ATANIRKEN SET ÝFADESÝ KULLANILIR...
SET @SURNAME = 'YILDIRIM'

-- DEÐÝÞKENLERE DEÐER ATAMA YÖNTEM 2
SELECT @AGE = 35,@GENDER =0;
-- as (alias)  => takma ad, deðikenlere veya alanlara veya tablolara takma isim vermek için kullanýlýr..
-- [] parantezler aradaki boþluðu gidermekiçin kullanýlýr..
SELECT @NAME as adi,@SURNAME as [soy adý],@AGE as yas,@GENDER as cinsiyet

declare @num1 int=49,@num2 int=10,@sonuc int;
set @sonuc = @num1+ @num2
select @sonuc
-- karar yapýsý
if @num1>@num2
begin
	select '1. Sayý büyük'
end
else
begin
	select '2. Sayý büyük'
end
-- döngü...
declare @i int=0
select @i
while @i < 10
begin
	select @i
	set @i= @i+1
end










