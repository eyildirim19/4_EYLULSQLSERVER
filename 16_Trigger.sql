/*
	trigger => tetikleyiciler

	tablo üzerine insert,update ve delete iþlemi sýrasýnda otomatik tetiklenen yapýlardýr...
	
	1) after trigger (insert,update,delete iþleminden sonra)
	2) instead of trigger (insert, update,delete iþlemi yerine)

	triggerlar tablomuzun alt sekmesinden Triggers sekmesi altýndadýr...
*/

create trigger InsertTrigger
on Categories -- categories tablosuna
after insert -- insert iþleminden sonra
as
begin
	-- yapýlacak iþlem...
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
for insert -- after ile ayný þeydir...
as
begin	
	
	declare @shipperName nvarchar(50);
	--select top 1 @shipperName = CompanyName  from Shippers
	--order by ShipperID desc

	-- eklenen son satýrý tutar. trigger içerisindeki 

	select @shipperName = CompanyName from inserted -- eklenen son kayýt bu tabloda tutulur. bu tablodan eklenen satýrýn CompanyName bilgisini alýyoruz...
	select @shipperName + ' adlý shippers eklenmiþtir....';

end

--
insert Shippers
(CompanyName,Phone)
values
('Deneme1','11111')



go

create trigger sLog
on Shippers
after update -- update iþleminden sonra...
as
begin	
	declare @shipId int, @cname nvarchar(40),@phone nvarchar(24)
		--select * from deleted -- son delete edilen tablo
	--select * from inserted -- son insert edilen tablo
	--NOT : UPDATE ÝÞLEMÝ DELETE VE INSERT ÝÞLEMÝNÝN KARIÞIMIDIR...
	select 
		@shipId  = ShipperID,@cname = CompanyName,@phone = Phone
	from deleted -- silinen satýrdaki kayýtlarý alýyoruz...
	-- bu kayýtlarý log tablosuna atalým....
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




-- ÖDEV : order ve orderteday oluþturan bir sp yazýlacak...bu sp CustomerId,EmployeeId,ProductId,Quantity parametreleri alýnacak. OrderDetail oluþturulurken OrderDetail'in UnitPrice alanýna Product tablosundaki UnitPrice alaný set edilecek....burada eðer quantity alanýný productin UnitsInStock alanýndan küçükse (stok yeterliyse) order ve ordertail oluþturulacak...
-- trigger yardýmý ile quantity deðeri kadar product'in unitsinstock'u azalacak qantity-unitsinstock (sipariþ miktarýný stoktan düþeceksiniz. 

-- bir sp 
-- bir trigger



go

create trigger spDel
on Region 
instead of delete -- DELETE YERÝNE
as
begin
	select 'OPPPSSSSSS!';
end

go
select * from Region
delete from Region