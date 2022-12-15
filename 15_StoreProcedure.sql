/*
	stored procedure => sakl� yordamlar

	--g�vdesinden sql ifadeleri vard�r. bu ifadeler ile birlikte hem sorguyu �al��t�r�r hemde geriye de�er d�nebilir. 
*/

--procedure olu�turma
create procedure SpFirst
as
begin
	select  'merhaba'
end

go
-- procedure �a��rma
--execute SpFirst
exec SpFirst
--
-- sp'den d�nen de�er yakalan�r...
--NOT : spler geriye sadece int d�nerler....
declare @ret int =1
exec @ret = SpFirst --sp'den d�nen de�er 0'd�r...istenirse return ifadesi ile de�er de�i�tirilebilir...
select @ret

go
--create procedure spTopla
create proc spTopla
(
	@s1 int,
	@s2 int
)
as
begin
	
	return @s1 + @s2
end
go
declare @r int
exec @r = spTopla 2,4 --sp'ye parametreler , ile ayr�larak g�nderilir..
select @r

-- olu�turulan procedureler Veritaban� sekmesine Programmability sekmesinde Stored Procedure sekmesinde bulunur. sp'de de�i�ik yap�lmak istenirse sp'ye sa� t�k yap�p modify se�ene�i ile gelen kod ekran�ndan kodda g�ncelleme yap�l�r...

go
alter proc spKategoriEkle
(
	@CategoryName nvarchar(50),
	@Description nvarchar(max),
	@KatId int output, -- sp g�vdesinden ��kacak parametre
	@Message nvarchar(500) output
)
as
begin	
	-- trim => parametredeki bo�uklar� temizliyoruz...
  if not exists(select * from Categories where CategoryName = TRIM(@CategoryName)) -- kategori yoksa...
  begin
		insert Categories
		(CategoryName,Description)
		values
		(@CategoryName,@Description)

		-- scope_identity() => bu scope i�erisinde en son insert edilen tablonun identity de�erini verir..
		--@@identity() => son eklenen identity de�eri al�n�r. ancak en son insert edilen tablonun identity de�erini verir..

		--select @KatId = SCOPE_IDENTITY();
		set @katId = scope_identity()	
		-- eklenen kategorinin id'sini paremetre (output) olarak alal�m....
	end
	else
	begin
		 set @Message = 'Bu isimde kategori daha �nce eklenmi�....'
	end
end

go
declare @cid int,@msg nvarchar(500)
exec spKategoriEkle ' Demo','Deneme kategorisi',@cid output,@msg output
select @cid,@msg-- eklenen kategorinin id'sini se�elim...

go

alter proc StokGuncelle
(
	@ProdId int,
	@Stok smallint,
	@Message nvarchar(500) output
)
as
begin
	
	if @ProdId is not null
	begin
			update Products
				set UnitsInStock = UnitsInStock +  @Stok
			where ProductID = @ProdId
	end
	else
	begin
			update Products
				set UnitsInStock = UnitsInStock +  @Stok
	end

		--@@ROWCOUNT => etkilenen sat�r say�s�n� verir...
		select @Message = CONVERT(nvarchar(10), @@ROWCOUNT) +  ' Adet Kay�t G�ncellendi'
end
go


declare @urunid int = null,@stok smallint=5,@msg nvarchar(500)
exec StokGuncelle @urunid,@stok,@msg output
select @msg



go

ALTER proc spShipperEkle
(
	@CompanyName nvarchar(50),
	@Phone nvarchar(50)
)
as
begin
	-- try catch yap�s� programlamada �al��ma zaman�ndaki hatalar� yakalamak ve y�netmek i�in kullan�l�r. catch yap�s� try i�erisinde bir hata olu�tu�unda devreye girer...

	begin try
		
		--transaction yap�s� genelde birbirine ba�l� i�lem yap�l�rken hayat kurtat�r
		--transaction ba�lat..
		BEGIN TRAN --TRANSACTION

		insert Shippers 
		(CompanyName,Phone)
		values
		(@CompanyName,@Phone)

	--	declare @sonuc int = 100/0; --- bilerek bir hata olu�tural�m.....
		-- insert i�lemine ba�l� ba�ka bir i�lem yap�l�yor....
		-- ��LEMLER BA�ARILI B�TT���NDE TRANSACTION'I B�T�REL�M...
		COMMIT TRAN--TRANSACTION -
	end try
	begin catch
		
		-- ROLLBACK => transaction'i geri al�r
		 ROLLBACK TRAN -- TRANSACTION
		--	select 'Bir hata olu�tu.....';
			select ERROR_LINE(), ERROR_MESSAGE()
	end catch
end


select LEN('asjdh askdhsakdsahdklsadhlksa salkdsahldkhsalda') -- karakter say�s�n� verir...

exec spShipperEkle 'asa','3233213'
SELECT * FROM Shippers

go

create proc spRapor
as
begin

	select 
		p.ProductName,
		COUNT(*) as SiparisSayisi,
		SUM(od.UnitPrice) as ToplamKazanilanPara
	from Orders o
	inner join [Order Details] od on o.OrderID = od.OrderID
	inner join Products p on p.ProductID = od.ProductID
	group by p.ProductName

end
go

exec spRapor