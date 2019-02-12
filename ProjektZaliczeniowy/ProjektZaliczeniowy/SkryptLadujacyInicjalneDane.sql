/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
 USE SALONSAMOCHODOWY
 GO

INSERT INTO Salon.Marki
	VALUES
		('JEEP',	'JEEP, Fiat Chrysler Automobiles (FCA) US LLC'),
		('FORD',	'Ford Motor Company'),
		('FIAT',	'Fabrika Italiano Automobile Torino'),
		('OPEL',	'Opel Automobile GmbH'),
		('LUXT',	'Luxtorpeda Sp z o.o.');
GO

		INSERT INTO Serwis.Statusy_Zamowien
	VALUES
		('Nowe'),
		('Złożone'),
		('Realizowane'),
		('Gotowe'),
		('Zamknięte');
GO
		INSERT INTO HR.Stanowiska_Pracy
	VALUES
		('Pracownik biurowy','PRBI'),
		('Mechanik','MCH'),
		('Lakiernik','LAK'),
		('Sprzedawca','SPR'),
		('Tester','TST' );		
GO
		INSERT INTO HR.Zespoly
	VALUES
		('Zasoby Ludzkie','HAER'),
		('Mechanicy','MECH'),
		('Lakiernicy','LAKI'),
		('Sprzedawcy','SPRZ'),
		('Testerzy','TSTS' );
GO
INSERT INTO Serwis.Uslugi
	VALUES
		(	'Całkowity przegląd samochodu', 'Przeglad ', 'PRZ'),
		(	'Naprawa pojazdu', 'Naprawa', 'NAP' ),
		('Zmiana koloru pojazdu','Lakierowanie' , 'LAK'),
		('Wymiana części', 'Wymiana', 'WYM'	),
		('Testy pojazdu', 'Testy', 'TST'	);
GO
INSERT INTO Salon.Modele(Mod_Kod, Mod_Nazwa, Mrk_Id)
		SELECT
			M.Mod_Kod
		,	M.Mod_Nazwa
		,	sm.Mrk_Id
		FROM 
		(
			VALUES
				('FIES',	'FIESTA'			, 'FORD')
			,	('TOUR',	'TOURNEO COURIER'	, 'FORD')
			,	('ECOS',	'ECOSPORT'			, 'FORD')
			,	('MUST',	'MUSTANG'			, 'FORD')
			,	('CHER',	'CHEROKEE'			, 'JEEP')
			,	('COMP',	'COMPASS'			, 'JEEP')
			,	('PATR',	'PATRIOT'			, 'JEEP')
			,	('COMM',	'COMMANDER'			, 'JEEP')
			,	('MALU',	'MALUCH'			, 'FIAT')
			,	('PUNT',	'PUNTO'				, 'FIAT')
			,	('MULT',	'MULTIPLA'			, 'FIAT')
			,	('BRAV',	'BRAVO'				, 'FIAT')
			,	('CORS',	'CORSA'			, 'OPEL')
			,	('ASTR',	'ASTRA'			, 'OPEL')
			,	('INSI',	'INSIGNIA'			, 'OPEL')
			,	('MERI',	'MERIVA'			, 'OPEL')
			,	('LUXO',	'LUXTORPEDA'			, 'LUXT')
		) AS M(Mod_Kod, Mod_Nazwa, Mrk_Kod)
		INNER JOIN Salon.Marki AS sm  ON M.Mrk_Kod = sm.Mrk_Kod
GO
INSERT INTO Salon.Cennik(Cena, Oferta_Od, Oferta_Do, Oferta_Kod, Mod_Id)
		SELECT
			c.Cena
		,	c.Oferta_Od
		,	c.Oferta_Do
		,	c.Oferta_Kod
		,	mo.Mod_Id
		FROM 
		(
			VALUES
				(150000,	'2014-01-01',	'2019-12-31', 'FR1', 'FIES' ),
				(250000,	'2014-01-01',	'2017-01-01', 'FR2', 'TOUR' ),
				(235000,	'2017-01-02',	'2019-03-01', 'FRX', 'TOUR' ),
				(350000,	'2014-01-01',	'2019-12-01', 'FR3', 'ECOS' ),
				(250000,	'2014-01-01',	'2019-12-01', 'FR4', 'MUST' ),
				(99999,		'2014-01-01',	'2019-12-01', 'JP1', 'CHER' ),
				(199999,	'2014-01-01',	'2018-12-01', 'JP2', 'COMP' ),
				(159999,	'2018-12-02',	'2019-12-01', 'JPX', 'COMP' ),
				(123999,	'2014-01-01',	'2019-12-01', 'JP3', 'PATR' ),
				(123999,	'2014-01-01',	'2019-12-01', 'JP4', 'COMM' ),
				(143999,	'2014-01-01',	'2019-12-01', 'FI1', 'MALU' ),
				(133999,	'2014-01-01',	'2019-12-01', 'FI2', 'PUNT' ),
				(79000,		'2014-01-01',	'2019-12-01', 'FI3', 'MULT' ),
				(60000,		'2014-01-01',	'2019-12-01', 'FI4', 'BRAV' ),
				(98123,		'2014-01-01',	'2019-12-01', 'OP1', 'CORS' ),
				(150000,	'2014-01-01',	'2018-12-01', 'OP2', 'ASTR' ),
				(120000,	'2018-01-02',	'2019-12-01', 'OPX', 'ASTR' ),
				(88888,		'2014-01-01',	'2019-12-01', 'OP3', 'INSI' ),
				(123000,	'2014-01-01',	'2018-12-01', 'OP4', 'MERI' ),
				(143999,	'2018-12-02',	'2019-12-01', 'OPZ', 'MERI' )
		) AS c(Cena, Oferta_Od, Oferta_Do, Oferta_Kod, Mod_Kod )
		INNER JOIN Salon.Modele AS mo  ON c.Mod_Kod = mo.Mod_Kod
GO
		INSERT INTO HR.Pracownik(Nazwisko, Imie, NIP, PESEL, Pracownik_Kod)
		VALUES ('Dres', 'Zbigniew', 7352137586, 87452514963, 'DRZB'),
				('Kowalski', 'Marek', 7323137586, 78452514963, 'KOMA'),
				('Kowalski', 'Tadeusz', 7123137586, 77452514963, 'KOTA'),
				('Martynika', 'Marta', 7123188888, 88452514963, 'MAMA'),
				('Kowalska', 'Katarzyna', 8123137586, 77452234963, 'KAKO'),
				('Chytra', 'Karol', 9123137586, 77234514963, 'CHKA'),
				('Nowak', 'Andrzej', 7123137580, 90452514963, 'NOAN'),
				('Szpak', 'Dariusz', 7123137666, 55452514999, 'SZDA'),
				('Michalski', 'Anastazja', 7123137111, 49452514888, 'MIAN'),
				('Ring', 'Maria', 7123137222, 71452514777, 'RIMA')
GO

		INSERT INTO HR.Klient(Nazwisko, Imie, NIP, Firma, Telefon, Nr_Dowodu_Osobistego, Klient_Kod)
		VALUES ('Super', 'Zbigniew', 2222137586, NULL, 123456, 'KSD12354', 'SUPER'),
				('Kowalski', 'Karol', 3333137586, NULL, 123456, 'ASD12254', 'KOWAL'),
				('Kowalski', 'Marta', 7126667586, 'IBM', 123456, 'QWE12354', 'MARTA'),
				('Martynika', 'Olaf', 7123199988, NULL, 123456, 'QWE11114', 'OLAFA'),
				('Kowalska', 'Katarzyna', 8144337586, NULL, 123456, 'LKJ12354', 'KATAR'),
				('Chytra', 'Karol', 9123000086, NULL, 123456, 'MNB12354', 'KAROL'),
				('Nowak', 'Andrzej', 7100037580, 'THX', 123456, 'FGH12354', 'ANDRZ'),
				('Kawczynska', 'Alicja', 7111137580, NULL, NULL, 'QWE66664', 'ALICJ'),
				('Nowak', 'Andrzej', 7100777580, 'Dot', 123456, 'ZNV12354', 'NOWAK')
GO
		

INSERT INTO HR.Pracownicy_Stanowiska(Pracownik_Id, Stanowisko_Id , Data_Przypisania, Data_Wypisania)
		SELECT
			pr.Pracownik_Id
		,	st.Stanowisko_Id
		,	d.Data_Przypisania
		,	d.Data_Wypisania
		FROM 
		(
			VALUES
				('DRZB', 'PRBI', '2017-01-01',	NULL),
				('KOMA', 'MCH', '2016-01-01',	NULL ),
				('KOTA', 'LAK', '2015-03-01', NULL ),
				('MAMA', 'SPR', '2015-02-01', NULL ),
				('KAKO', 'TST', '2015-01-01', NULL ),
				('CHKA', 'PRBI', '2017-01-01', NULL ),
				('NOAN', 'LAK', '2014-01-01', NULL ),
				('SZDA', 'SPR', '2016-01-01', NULL),
				('MIAN', 'TST', '2017-01-01', NULL ),
				('RIMA', 'PRBI', '2015-01-01', '2017-01-01' )
		) AS d(Pracownik_Kod, Stanowisko_Kod, Data_Przypisania, Data_Wypisania)
		INNER JOIN HR.Pracownik AS pr  ON d.Pracownik_Kod = pr.Pracownik_Kod
		INNER JOIN HR.Stanowiska_Pracy AS st  ON d.Stanowisko_Kod = st.Stanowisko_Kod
GO
		-- pracwonicy zespoly
		INSERT INTO HR.Pracownicy_Zespoly(Zespol_Id, Pracownik_Id , Data_Przypisania, Data_Wypisania)
		SELECT
			zes.Zespol_Id
		,	pr.Pracownik_Id
		,	ze.Data_Przypisania
		,	ze.Data_Wypisania
		FROM 
		(
			VALUES
				('DRZB', 'HAER',  '2017-01-01',	NULL ),
				('KOMA', 'MECH', '2016-01-01',	NULL ),
				('KOTA', 'LAKI', '2015-03-01', NULL ),
				('MAMA', 'SPRZ', '2015-02-01', NULL ),
				('KAKO', 'TSTS', '2015-01-01', NULL ),
				('CHKA', 'HAER', '2017-01-01', NULL ),
				('NOAN', 'LAKI', '2014-01-01', NULL ),
				('SZDA', 'SPRZ', '2016-01-01', NULL),
				('MIAN', 'TSTS', '2017-01-01', NULL ),
				('RIMA', 'HAER', '2015-01-01', '2017-01-01' )
		) AS ze(Pracownik_Kod, Zespol_Kod, Data_Przypisania, Data_Wypisania)
		INNER JOIN HR.Zespoly AS zes  ON ze.Zespol_Kod = zes.Zespol_Kod
		INNER JOIN HR.Pracownik AS pr  ON ze.Pracownik_Kod = pr.Pracownik_Kod
GO


				
				
-- hr wynagrodzenia
		INSERT INTO HR.Wynagrodzenia(Pracownik_Id ,Kwota,  Okres_Od, Okres_Do)
		SELECT
			
			pr.Pracownik_Id
		,	k.Kwota
		,	k.Okres_Od
		,	k.Okres_Do
		FROM 
		(
			VALUES
				('DRZB', 5000, '2017-01-01', '2017-12-31'  ),
				('DRZB', 6000, '2018-01-01', '2018-12-31'  ),
				('DRZB', 6000, '2019-01-01', '2019-12-31'  ),
				('KOMA', 6000, '2016-01-01', '2018-12-31'  ),
				('KOMA', 7000, '2019-01-01', '2019-12-31'  ),
				('KOTA', 4000, '2015-03-01', '2019-12-31'  ),
				('MAMA', 4000, '2015-03-01', '2017-12-31'  ),
				('MAMA', 5000, '2017-12-31', '2019-12-31'  ),
				('KAKO', 3000, '2015-01-01', '2015-12-31'  ),
				('KAKO', 4000, '2016-01-01', '2016-12-31'  ),
				('KAKO', 5000, '2017-01-01', '2017-12-31'  ),
				('KAKO', 5500, '2018-01-01', '2018-12-31'  ),
				('KAKO', 6500, '2019-01-01', '2019-12-31'  ),
				('CHKA', 16500, '2017-01-01', '2019-12-31'  ),
				('NOAN', 8500, '2014-01-01', '2015-12-31'  ),
				('NOAN', 8500, '2014-01-01', '2017-12-31'  ),
				('NOAN', 8500, '2018-01-01', '2019-12-31'  ),
				('SZDA', 3500, '2016-01-01', '2019-12-31'  ),
				('MIAN', 3500, '2017-01-01', '2017-12-31'  ),
				('MIAN', 4500, '2018-01-01', '2019-12-31'  ),
				('RIMA', 4500, '2015-01-01', '2016-12-31'  )
		)    AS k(Pracownik_Kod, Kwota, Okres_Od, Okres_Do)
		INNER JOIN [HR].[Pracownik] AS pr ON pr.Pracownik_Kod = k.Pracownik_Kod
GO

-- HR wyplaty

INSERT INTO HR.Wyplaty(Pracownik_Id ,Kwota, Typ,  Okres_Od, Okres_Do)
		SELECT
			
			pr.Pracownik_Id
		,	k.Kwota
		,   k.Typ
		,	k.Okres_Od
		,	k.Okres_Do
		FROM 
		(
			VALUES
				('DRZB', 15000, 'Pensja', '2017-01-01', '2017-03-31'  ),
				('DRZB', 15000,'Pensja', '2017-04-01', '2017-06-30'  ),
				('DRZB', 15000,'Pensja', '2017-07-01', '2017-09-30'  ),
				('DRZB', 15000,'Pensja', '2017-10-01', '2017-12-31'  ),
				('DRZB', 18000,'Pensja', '2018-01-01', '2018-03-31'  ),
				('DRZB', 18000,'Pensja', '2018-04-01', '2018-06-30'  ),
				('DRZB', 18000,'Pensja', '2018-07-01', '2018-09-30'  ),
				('KOMA', 36000,'Pensja', '2016-01-01', '2016-06-30'  ),
				('KOMA', 36000,'Pensja', '2016-07-01', '2016-12-31'  ),
				('KOMA', 36000,'Pensja', '2017-01-01', '2017-06-30'  ),
				('KOMA', 36000,'Pensja', '2017-07-01', '2017-12-31'  ),
				('KOMA', 36000,'Pensja', '2018-01-01', '2018-06-30'  ),
				('KOMA', 36000,'Pensja', '2018-07-01', '2018-12-31'  ),
				('KOTA', 76000, 'Pensja', '2015-03-01', '2016-12-31'  ),
				('KOTA', 48000, 'Pensja', '2017-01-01', '2017-12-31'  ),
				('KOTA', 4000, 'Pensja', '2018-01-01', '2018-01-31'  ),
				('KOTA', 4000, 'Pensja', '2018-02-01', '2018-02-28'  ),
				('KOTA', 4000, 'Pensja', '2018-03-01', '2018-03-31'  ),
				('KOTA', 4000, 'Pensja', '2018-04-01', '2018-04-30'  ),
				('KOTA', 4000, 'Pensja', '2018-05-01', '2018-05-31'  ),
				('KOTA', 4000, 'Pensja', '2018-06-01', '2018-06-30'  ),
				('KOTA', 4000, 'Pensja', '2018-07-01', '2018-07-31'  ),
				('KOTA', 4000, 'Pensja', '2018-08-01', '2018-08-31'  ),
				('KOTA', 4000, 'Pensja', '2018-09-01', '2018-09-30'  ),
				('KOTA', 4000, 'Pensja', '2018-10-01', '2018-10-31'  ),
				('KOTA', 4000, 'Pensja', '2018-11-01', '2018-11-30'  ),
				('KOTA', 4000, 'Pensja', '2018-12-01', '2018-12-31'  ),
				('KOTA', 4000, 'Pensja', '2019-01-01', '2019-01-31'  ),
				('MAMA', 84000, 'Pensja','2015-03-01', '2017-12-31'  ),
				('MAMA', 5000, 'Pensja','2018-01-01', '2018-01-31'  ),
				('MAMA', 5000, 'Pensja','2018-02-01', '2018-02-28'  ),
				('MAMA', 5000, 'Pensja','2018-03-01', '2018-03-31'  ),
				('MAMA', 5000, 'Pensja','2018-04-01', '2018-04-30'  ),
				('MAMA', 5000, 'Pensja','2018-05-01', '2018-05-31'  ),
				('MAMA', 5000, 'Pensja','2018-06-01', '2018-06-30'  ),
				('MAMA', 5000, 'Pensja','2018-07-01', '2018-07-31'  ),
				('MAMA', 5000, 'Pensja','2018-08-01', '2018-08-31'  ),
				('MAMA', 5000, 'Pensja','2018-09-01', '2018-09-30'  ),
				('MAMA', 5000, 'Pensja','2018-10-01', '2018-10-31'  ),
				('MAMA', 5000, 'Pensja','2018-11-01', '2018-11-30'  ),
				('MAMA', 5000, 'Pensja','2018-12-01', '2018-12-31'  ),
				('MAMA', 5000, 'Pensja','2019-01-01', '2019-01-31'  ),
				('KAKO', 36000, 'Pensja', '2015-01-01', '2015-12-31'  ),
				('KAKO', 48000,'Pensja', '2016-01-01', '2016-12-31'  ),
				('KAKO', 60000,'Pensja', '2017-01-01', '2017-12-31'  ),
				('KAKO', 66000,'Pensja', '2018-01-01', '2018-12-31'  ),
				('KAKO', 6500, 'Pensja','2019-01-01', '2019-01-31'  ),
				('CHKA', 198000,'Pensja', '2017-01-01', '2017-12-31'  ),
				('CHKA', 16500,'Pensja', '2018-01-01', '2018-01-31'  ),
				('CHKA', 16500,'Pensja', '2018-02-01', '2018-02-28'  ),
				('CHKA', 16500,'Pensja', '2018-03-01', '2018-03-31'  ),
				('CHKA', 16500,'Pensja', '2018-04-01', '2018-04-30'  ),
				('CHKA', 16500,'Pensja', '2018-05-01', '2018-05-31'  ),
				('CHKA', 16500,'Pensja', '2018-06-01', '2018-06-30'  ),
				('CHKA', 16500,'Pensja', '2018-07-01', '2018-07-31'  ),
				('CHKA', 16500,'Pensja', '2018-08-01', '2018-08-31'  ),
				('CHKA', 16500,'Pensja', '2018-09-01', '2018-09-30'  ),
				('CHKA', 16500,'Pensja', '2018-10-01', '2018-10-31'  ),
				('CHKA', 16500,'Pensja', '2018-11-01', '2018-11-30'  ),
				('CHKA', 16500,'Pensja', '2018-12-01', '2018-12-31'  ),
				('CHKA', 16500,'Pensja', '2019-01-01', '2019-01-31'  ),
				('NOAN', 204000,'Pensja', '2014-01-01', '2015-12-31'  ),
				('NOAN', 102000,'Pensja', '2016-01-01', '2016-12-31'  ),
				('NOAN', 102000,'Pensja', '2017-01-01', '2017-12-31'  ),
				('NOAN', 102000,'Pensja', '2018-01-01', '2018-12-31'  ),
				('NOAN', 8500,'Pensja', '2019-01-01', '2019-01-31'  ),
				('SZDA', 42000, 'Pensja', '2016-01-01', '2016-12-31'  ),
				('SZDA', 42000, 'Pensja', '2017-01-01', '2017-12-31'  ),
				('SZDA', 42000,'Pensja', '2018-01-01', '2018-12-31'  ),
				('SZDA', 3500,'Pensja', '2019-01-01', '2019-01-31'  ),
				('MIAN', 42000,'Pensja', '2017-01-01', '2017-12-31'  ),
				('MIAN', 4500,'Pensja', '2018-01-01', '2018-01-31'  ),
				('MIAN', 4500,'Pensja', '2018-02-01', '2018-02-28'  ),
				('MIAN', 4500,'Pensja', '2018-03-01', '2018-03-31'  ),
				('MIAN', 4500,'Pensja', '2018-04-01', '2018-04-30'  ),
				('MIAN', 4500,'Pensja', '2018-05-01', '2018-05-31'  ),
				('MIAN', 4500,'Pensja', '2018-06-01', '2018-06-30'  ),
				('MIAN', 4500,'Pensja', '2018-07-01', '2018-07-31'  ),
				('MIAN', 4500,'Pensja', '2018-08-01', '2018-08-31'  ),
				('MIAN', 4500,'Pensja', '2018-09-01', '2018-09-30'  ),
				('MIAN', 4500,'Pensja', '2018-10-01', '2018-10-31'  ),
				('MIAN', 4500,'Pensja', '2018-11-01', '2018-11-30'  ),
				('MIAN', 4500,'Pensja', '2018-12-01', '2018-12-31'  ),
				('MIAN', 4500,'Pensja', '2019-01-01', '2019-01-31'  ),
				('RIMA', 108000,'Pensja', '2015-01-01', '2016-12-31'  ),
				('RIMA', 50000,'Premia', '2015-01-01', '2015-12-31'  )
		) AS k(Pracownik_Kod, Kwota,Typ, Okres_Od, Okres_Do)
		INNER JOIN HR.Pracownik AS pr  ON k.Pracownik_Kod = pr.Pracownik_Kod
GO