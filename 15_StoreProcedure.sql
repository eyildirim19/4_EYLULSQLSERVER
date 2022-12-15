/*
	stored procedure => saklý yordamlar

	--gövdesinden sql ifadeleri vardýr. bu ifadeler ile birlikte hem sorguyu çalýþtýrýr hemde geriye deðer dönebilir. 
*/

--procedure oluþturma
create procedure SpFirst
as
begin
	select  'merhaba'
end

go
-- procedure çaðýrma
--execute SpFirst
exec SpFirst
--
-- sp'den dönen deðer yakalanýr...
--NOT : spler geriye sadece int dönerler....
declare @ret int =1
exec @ret = SpFirst --sp'den dönen deðer 0'dýr...istenirse return ifadesi ile deðer deðiþtirilebilir...
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
exec @r = spTopla 2,4 --sp'ye parametreler , ile ayrýlarak gönderilir..
select @r

-- oluþturulan procedureler Veritabaný sekmesine Programmability sekmesinde Stored Procedure sekmesinde bulunur. sp'de deðiþik yapýlmak istenirse sp'ye sað týk yapýp modify seçeneði ile gelen kod ekranýndan kodda güncelleme yapýlýr...

go
alter proc spKategoriEkle
(
	@CategoryName nvarchar(50),
	@Description nvarchar(max),
	@KatId int output, -- sp gövdesinden çýkacak parametre
	@Message nvarchar(500) output
)
as
begin	
	-- trim => parametredeki boþuklarý temizliyoruz...
  if not exists(select * from Categories where CategoryName = TRIM(@CategoryName)) -- kategori yoksa...
  begin
		insert Categories
		(CategoryName,Description)
		values
		(@CategoryName,@Description)

		-- scope_identity() => bu scope içerisinde en son insert edilen tablonun identity deðerini verir..
		--@@identity() => son eklenen identity deðeri alýnýr. ancak en son insert edilen tablonun identity deðerini verir..

		--select @KatId = SCOPE_IDENTITY();
		set @katId = scope_identity()	
		-- eklenen kategorinin id'sini paremetre (output) olarak alalým....
	end
	else
	begin
		 set @Message = 'Bu isimde kategori daha önce eklenmiþ....'
	end
end

go
declare @cid int,@msg nvarchar(500)
exec spKategoriEkle ' Demo','Deneme kategorisi',@cid output,@msg output
select @cid,@msg-- eklenen kategorinin id'sini seçelim...

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

		--@@ROWCOUNT => etkilenen satýr sayýsýný verir...
		select @Message = CONVERT(nvarchar(10), @@ROWCOUNT) +  ' Adet Kayýt Güncellendi'
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
	-- try catch yapýsý programlamada çalýþma zamanýndaki hatalarý yakalamak ve yönetmek için kullanýlýr. catch yapýsý try içerisinde bir hata oluþtuðunda devreye girer...

	begin try
		
		--transaction yapýsý genelde birbirine baðlý iþlem yapýlýrken hayat kurtatýr
		--transaction baþlat..
		BEGIN TRAN --TRANSACTION

		insert Shippers 
		(CompanyName,Phone)
		values
		(@CompanyName,@Phone)

	--	declare @sonuc int = 100/0; --- bilerek bir hata oluþturalým.....
		-- insert iþlemine baðlý baþka bir iþlem yapýlýyor....
		-- ÝÞLEMLER BAÞARILI BÝTTÝÐÝNDE TRANSACTION'I BÝTÝRELÝM...
		COMMIT TRAN--TRANSACTION -
	end try
	begin catch
		
		-- ROLLBACK => transaction'i geri alýr
		 ROLLBACK TRAN -- TRANSACTION
		--	select 'Bir hata oluþtu.....';
			select ERROR_LINE(), ERROR_MESSAGE()
	end catch
end


select LEN('asjdh askdhsakdsahdklsadhlksa salkdsahldkhsalda') -- karakter sayýsýný verir...

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