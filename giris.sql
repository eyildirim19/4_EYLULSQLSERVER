
-- EXECUTE => KISA YOLU F5. SQL KOMUTUNU �ALI�TIRIR. NOT : SQL'DE EXECUTE ED�LD���NDE E�ER BEL�RT�LMEZSE QUERY PENCERES�NDEK� B�T�N KOMUTLAR �ALI�TIRILIR. BU TEHL�KEL� B�R DURUMDUR. BU Y�ZDEN SADECE �ALI�TIRMAK �STED���M�Z KODU SE��P EXECUTE ED�YORUZ...

-- YAZDIRMAK ���N
print 'MERHABA SQL'

-- VER� SE�MEK ���N
--SQL'DE ' TIRNAK STR�NG �FADES�D�R... SQL " YOKTUR
--SELECT "MERHABA"
SELECT 'MERHABA SQL'
SELECT 1

--sql (struct query language) yap�sal sorgulama dili. ili�kisel veritabanlar�nda sorgu dilir. 
--t-sql (transact-sql ) => microsoft taraf�ndan geli�tirilmi� sql server ortam�nda yaz�lan ve y�r�t�len sql dilir...


-- DE���KEN TANIMLAMA... VE �LK DE�ER ATAMA
DECLARE @NAME NVARCHAR(50) = 'EKREM'
DECLARE @SURNAME NVARCHAR(50)-- DE���KEN TANIMLAMA
DECLARE @AGE INT,@GENDER BIT -- TEK SATIRDA B�RDEN FAZLA DE���KEN TANIMLAMA
-- DE���KENE DE�ER ATAMA
-- DE���KENLERE DE�ER ATANIRKEN SET �FADES� KULLANILIR...
SET @SURNAME = 'YILDIRIM'

-- DE���KENLERE DE�ER ATAMA Y�NTEM 2
SELECT @AGE = 35,@GENDER =0;
-- as (alias)  => takma ad, de�ikenlere veya alanlara veya tablolara takma isim vermek i�in kullan�l�r..
-- [] parantezler aradaki bo�lu�u gidermeki�in kullan�l�r..
SELECT @NAME as adi,@SURNAME as [soy ad�],@AGE as yas,@GENDER as cinsiyet

declare @num1 int=49,@num2 int=10,@sonuc int;
set @sonuc = @num1+ @num2
select @sonuc
-- karar yap�s�
if @num1>@num2
begin
	select '1. Say� b�y�k'
end
else
begin
	select '2. Say� b�y�k'
end
-- d�ng�...
declare @i int=0
select @i
while @i < 10
begin
	select @i
	set @i= @i+1
end










