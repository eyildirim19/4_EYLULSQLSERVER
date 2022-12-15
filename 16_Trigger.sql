/*
	trigger => tetikleyiciler

	tablo �zerine insert,update ve delete i�lemi s�ras�nda otomatik tetiklenen yap�lard�r...
	
	1) after trigger (insert,update,delete i�leminden sonra)
	2) instead of trigger (insert, update,delete i�lemi yerine)

	triggerlar tablomuzun alt sekmesinden Triggers sekmesi alt�ndad�r...
*/

create trigger InsertTrigger
on Categories -- categories tablosuna
after insert -- insert i�leminden sonra
as
begin
	-- yap�lacak i�lem...
	select 'test'
end

-- triggeri silebiliriz
--drop trigger InsertTrigger

declare @KatId int, @Message nvarchar(500)
exec spKategoriEkle 'trg','Denememekkjaskjsdjksal', @KatId output, @Message output

go
create trigger sekle
on Shippers
--after insert
for insert -- after ile ayn� �eydir...
as
begin	
	
	declare @shipperName nvarchar(50);
	--select top 1 @shipperName = CompanyName  from Shippers
	--order by ShipperID desc

	-- eklenen son sat�r� tutar. trigger i�erisindeki 

	select @shipperName = CompanyName from inserted -- eklenen son kay�t bu tabloda tutulur. bu tablodan eklenen sat�r�n CompanyName bilgisini al�yoruz...
	select @shipperName + ' adl� shippers eklenmi�tir....';

end

--
insert Shippers
(CompanyName,Phone)
values
('Deneme1','11111')



go

create trigger sLog
on Shippers
after update -- update i�leminden sonra...
as
begin	
	declare @shipId int, @cname nvarchar(40),@phone nvarchar(24)
		--select * from deleted -- son delete edilen tablo
	--select * from inserted -- son insert edilen tablo
	--NOT : UPDATE ��LEM� DELETE VE INSERT ��LEM�N�N KARI�IMIDIR...
	select 
		@shipId  = ShipperID,@cname = CompanyName,@phone = Phone
	from deleted -- silinen sat�rdaki kay�tlar� al�yoruz...
	-- bu kay�tlar� log tablosuna atal�m....
	insert ShippersLog
	([ShipperID], [CompanyName], [Phone], [CreDate])
	values
	(@shipId,@cname,@phone,GETDATE())
end

update Shippers
	set CompanyName = 'Deneme Triggger',
		Phone = '1231'
where ShipperID = 4

select * from Shippers
select * from ShippersLog




-- �DEV : order ve orderteday olu�turan bir sp yaz�lacak...bu sp CustomerId,EmployeeId,ProductId,Quantity parametreleri al�nacak. OrderDetail olu�turulurken OrderDetail'in UnitPrice alan�na Product tablosundaki UnitPrice alan� set edilecek....burada e�er quantity alan�n� productin UnitsInStock alan�ndan k���kse (stok yeterliyse) order ve ordertail olu�turulacak...
-- trigger yard�m� ile quantity de�eri kadar product'in unitsinstock'u azalacak qantity-unitsinstock (sipari� miktar�n� stoktan d��eceksiniz. 

-- bir sp 
-- bir trigger



go

create trigger spDel
on Region 
instead of delete -- DELETE YER�NE
as
begin
	select 'OPPPSSSSSS!';
end

go
select * from Region
delete from Region