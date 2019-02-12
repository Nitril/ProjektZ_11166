CREATE PROCEDURE generuj_zamowieniaSalon
       @ileZamowien int

AS
while @ileZamowien>0
begin
	
    begin
	DECLARE @klientId int
	SELECT @klientId = [Klient_Id] FROM (SELECT ROW_NUMBER() OVER(ORDER BY [Klient_Id]) [rownr] , [Klient_Id] FROM [HR].[Klient]) t WHERE t.rownr = 1 + (SELECT CAST(RAND() * Count(*) as INT) FROM [HR].[Klient])
	END

	BEGIN
	DECLARE @sprzedawcaId int
	SELECT @sprzedawcaId = [Pracownik_Id] FROM (SELECT ROW_NUMBER() OVER(ORDER BY [Pracownik_Id]) [rownr] , [Pracownik_Id] FROM HR.Pracownik) t WHERE t.rownr = 1 + (SELECT CAST(RAND() * Count(*) as INT) FROM HR.Pracownik)
	END

	BEGIN
	DECLARE @modelid int
	SELECT @modelid = [Mod_Id] FROM (SELECT ROW_NUMBER() OVER(ORDER BY [Mod_Id]) [rownr] , [Mod_Id] FROM Salon.Modele) t WHERE t.rownr = 1 + (SELECT CAST(RAND() * Count(*) as SMALLINT) FROM [Salon].[Modele])
	END

	BEGIN
	DECLARE @ilosc int
	SELECT @ilosc = CAST(RAND() * 4+ 1 as INT)
	END
	
	BEGIN
	DECLARE @zrealizowano BIT
	SELECT @zrealizowano = convert(bit, round(1*rand(),0))
	END

	BEGIN
	DECLARE @oplacono BIT
	SELECT @oplacono = convert(bit, round(1*rand(),0))
	END
	
	BEGIN
-- get a random datetime +/- 365 days
	DECLARE @time SMALLDATETIME
	SET @time = GETDATE() + (365 * 2 * RAND() - 365)
	print(@time)
	END

	BEGIN
	DECLARE @aktualizujacyId int
	SELECT @aktualizujacyId = [Pracownik_Id] FROM (SELECT ROW_NUMBER() OVER(ORDER BY [Pracownik_Id]) [rownr] , [Pracownik_Id] FROM HR.Pracownik) t WHERE t.rownr = 1 + (SELECT CAST(RAND() * Count(*) as INT) FROM [HR].[Pracownik])
	END

	BEGIN
	DECLARE @cenasprzedazy int
	SELECT @cenasprzedazy = [Cena]  FROM Salon.Cennik  ce WHERE @time >= ce.Oferta_Od AND ce.Mod_Id = @modelid
	END

	begin
	INSERT INTO Salon.Zamowienia values (@klientId, @sprzedawcaId, @modelid, @ilosc, @zrealizowano,@oplacono,@cenasprzedazy, @time, @time,@time+50,  @aktualizujacyId ,DEFAULT , DEFAULT )
	end
	set @ileZamowien = @ileZamowien -1;
	
end