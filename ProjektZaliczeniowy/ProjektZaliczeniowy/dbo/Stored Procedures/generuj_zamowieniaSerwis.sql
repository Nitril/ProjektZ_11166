CREATE PROCEDURE generuj_zamowieniaSerwis
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
	DECLARE @uslugaId int
	SELECT @uslugaId = [Usluga_Id] FROM (SELECT ROW_NUMBER() OVER(ORDER BY [Usluga_Id]) [rownr] , [Usluga_Id] FROM Serwis.Uslugi) t WHERE t.rownr = 1 + (SELECT CAST(RAND() * Count(*) as SMALLINT) FROM Serwis.Uslugi)
	END

	BEGIN
	DECLARE @statusId int
	SELECT @statusId = [Status_Id] FROM (SELECT ROW_NUMBER() OVER(ORDER BY [Status_Id]) [rownr] , [Status_Id] FROM Serwis.Statusy_Zamowien) t WHERE t.rownr = 1 + (SELECT CAST(RAND() * Count(*) as SMALLINT) FROM Serwis.Statusy_Zamowien)
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
	SELECT @cenasprzedazy = CAST(RAND() * 1000+ 50 as DECIMAL)
	END
	
	begin
	INSERT INTO Serwis.Zamowienia values (@klientId, @sprzedawcaId, @uslugaId,@statusId, @ilosc, @zrealizowano,@oplacono,@cenasprzedazy, @time, @time,@time+50,  @aktualizujacyId ,DEFAULT , DEFAULT )
	end
	set @ileZamowien = @ileZamowien -1;
	
end