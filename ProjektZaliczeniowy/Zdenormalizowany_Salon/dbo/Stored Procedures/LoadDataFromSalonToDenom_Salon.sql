CREATE PROCEDURE LoadDataFromSalonToDenom_Salon   
    
AS   
  
-- procedura ladujaca dane z bazy SALONSAMOCHODOWY do zdenormalizowanej bazy DENOM_SALONSAMOCHODOWY
Insert into DENOM_SALONSAMOCHODOWY.Serwis.DimUslugi([Usluga_Id]
      ,[Usluga_Opis]
      ,[Usluga_Nazwa]
      ,[Usluga_Kod] )
	  SELECT ssu.[Usluga_Id]
      ,ssu.[Usluga_Opis]
      ,ssu.[Usluga_Nazwa]
      ,ssu.[Usluga_Kod] 
	  from [SALONSAMOCHODOWY].[Serwis].[Uslugi] ssu 
	  WHERE NOT EXISTS(SELECT dssu.[Usluga_Id]
      ,dssu.[Usluga_Opis]
      ,dssu.[Usluga_Nazwa]
      ,dssu.[Usluga_Kod] 
	  from DENOM_SALONSAMOCHODOWY.Serwis.DimUslugi dssu
	  WHERE (dssu.[Usluga_Id] = ssu.[Usluga_Id] AND dssu.[Usluga_Opis]=ssu.[Usluga_Opis] AND dssu.[Usluga_Nazwa] = ssu.[Usluga_Nazwa] AND ssu.[Usluga_Kod] = dssu.[Usluga_Kod])  )

Insert into [DENOM_SALONSAMOCHODOWY].[HR].[DimKlient]([Klient_Id]
      ,[Nazwisko]
      ,[Imie]
      ,[NIP]
      ,[Firma]
      ,[Telefon]
      ,[Nr_Dowodu_Osobistego]
      ,[Klient_Kod])
SELECT 
	   shk.[Klient_Id]
      ,shk.[Nazwisko]
      ,shk.[Imie]
      ,shk.[NIP]
      ,shk.[Firma]
      ,shk.[Telefon]
      ,shk.[Nr_Dowodu_Osobistego]
      ,shk.[Klient_Kod] from [SALONSAMOCHODOWY].[HR].[Klient] shk
	  WHERE NOT EXISTS(SELECT dhd.[Klient_Id]
      ,dhd.[Nazwisko]
      ,dhd.[Imie]
      ,dhd.[NIP]
      ,dhd.[Firma]
      ,dhd.[Telefon]
      ,dhd.[Nr_Dowodu_Osobistego]
      ,dhd.[Klient_Kod]
	  from [DENOM_SALONSAMOCHODOWY].[HR].[DimKlient] dhd
	  WHERE shk.[Klient_Id] = dhd.[Klient_Id])

INSERT INTO [DENOM_SALONSAMOCHODOWY].[Salon].[Dim_Modele] ([Mod_Id]
      ,[Mod_Kod]
      ,[Mod_Nazwa]
      ,[Mrk_Kod]
      ,[Mrk_Nazwa])
Select smo.[Mod_Id]
      ,smo.[Mod_Kod]
      ,smo.[Mod_Nazwa]
      ,sma.[Mrk_Kod]
      ,sma.[Mrk_Nazwa]
FROM
SALONSAMOCHODOWY.Salon.Modele smo 
INNER JOIN SALONSAMOCHODOWY.Salon.Marki sma ON  sma.Mrk_Id = smo.Mrk_Id
WHERE NOT EXISTS(SELECT dsd.[Mod_Id]
      ,dsd.[Mod_Kod]
      ,dsd.[Mod_Nazwa]
      ,dsd.[Mrk_Kod]
      ,dsd.[Mrk_Nazwa]
	  from [DENOM_SALONSAMOCHODOWY].[Salon].[Dim_Modele] dsd
	  WHERE (smo.[Mod_Id] = dsd.[Mod_Id]))


Insert into DENOM_SALONSAMOCHODOWY.Salon.DimCennik(
	   [Oferta_Id]
      ,[Mod_Id]
      ,[Cena]
      ,[Oferta_Od]
      ,[Oferta_Do]
      ,[Oferta_Kod] )
	  SELECT ssc.[Oferta_Id]
      ,ssc.[Mod_Id]
      ,ssc.[Cena]
      ,ssc.[Oferta_Od]
      ,ssc.[Oferta_Do]
      ,ssc.[Oferta_Kod]
	  from [SALONSAMOCHODOWY].[Salon].[Cennik] ssc
	  WHERE NOT EXISTS(SELECT dsd.[Oferta_Id]
      ,dsd.[Mod_Id]
      ,dsd.[Cena]
      ,dsd.[Oferta_Od]
      ,dsd.[Oferta_Do]
      ,dsd.[Oferta_Kod]
	  from DENOM_SALONSAMOCHODOWY.Salon.DimCennik dsd
	  WHERE (ssc.[Oferta_Id] = dsd.[Oferta_Id]))

Insert into [DENOM_SALONSAMOCHODOWY].[Serwis].[DimStatusy_Zamowien] ([Status_Id]
      ,[Status])
	  select
	  sss.[Status_Id]
      ,sss.[Status]
	  from [SALONSAMOCHODOWY].[Serwis].[Statusy_Zamowien] sss
	  WHERE NOT EXISTS(SELECT dsd.[Status_Id]
      ,dsd.[Status]
	  from [DENOM_SALONSAMOCHODOWY].[Serwis].[DimStatusy_Zamowien] dsd
	  WHERE (sss.[Status_Id] = dsd.[Status_Id]))


INSERT INTO [DENOM_SALONSAMOCHODOWY].[HR].[DimPracownik]
([Pracownik_Id]
      ,[Nazwisko]
      ,[Imie]
      ,[NIP]
      ,[PESEL]
      ,[Pracownik_Kod]
      )
SELECT shr.[Pracownik_Id]
      ,shr.[Nazwisko]
      ,shr.[Imie]
      ,shr.[NIP]
      ,shr.[PESEL]
      ,shr.[Pracownik_Kod]
FROM SALONSAMOCHODOWY.HR.Pracownik shr
      WHERE NOT EXISTS(SELECT dhd.[Pracownik_Id]
      ,dhd.[Nazwisko]
      ,dhd.[Imie]
      ,dhd.[NIP]
      ,dhd.[PESEL]
      ,dhd.[Pracownik_Kod]
	  from [DENOM_SALONSAMOCHODOWY].[HR].[DimPracownik] dhd
	  WHERE (shr.[Pracownik_Id] = dhd.[Pracownik_Id]))



INSERT INTO [DENOM_SALONSAMOCHODOWY].[HR].[DimWyplaty_Wynagrodzenia_Przypisania]
(      [Wyplata_Id]
      ,[Pracownik_Id]
      ,[Kwota_Wynagrodzenia]
      ,[Kwota_Wyplaty]
      ,[Typ]
      ,[Wyplata_Okres_Od]
      ,[Wyplata_Okres_Do]
      ,[Wynagrodzenie_Okres_Od]
      ,[Wynagrodzenie_Okres_Do]
	  ,[Stanowisko]
      ,[Stanowisko_Kod]
      ,[Zespol]
      ,[Zespol_Kod]
      ,[Stanowisko_Data_Przypisania]
      ,[Stanowisko_Data_Wypisania]
      ,[Zespol_Data_Przypisania]
      ,[Zespol_Data_Wypisania])
(SELECT 
       hwp.[Wyplata_Id]
      ,hpr.[Pracownik_Id]
      ,hwy.[Kwota]
      ,hwp.[Kwota]
      ,hwp.[Typ]
      ,hwp.[Okres_Od]
      ,hwp.[Okres_Do]
      ,hwy.[Okres_Od]
      ,hwy.[Okres_Do]
	  ,hsp.[Stanowisko]
      ,hsp.[Stanowisko_Kod]
      ,hz.[Zespol]
      ,hz.[Zespol_Kod]
      ,hps.[Data_Przypisania]
      ,hps.[Data_Wypisania]
      ,hsz.[Data_Przypisania]
      ,hsz.[Data_Wypisania]
FROM SALONSAMOCHODOWY.HR.Pracownik hpr
INNER JOIN SALONSAMOCHODOWY.HR.Wyplaty hwp ON hpr.Pracownik_Id = hwp.Pracownik_Id
INNER JOIN SALONSAMOCHODOWY.HR.Wynagrodzenia hwy ON hwy.Pracownik_Id = hwp.Pracownik_Id 
INNER JOIN SALONSAMOCHODOWY.HR.Pracownicy_Stanowiska hps ON hps.Pracownik_Id = hpr.Pracownik_Id
INNER JOIN SALONSAMOCHODOWY.HR.Stanowiska_Pracy hsp ON hsp.Stanowisko_Id = hps.Stanowisko_Id
INNER JOIN SALONSAMOCHODOWY.HR.Pracownicy_Zespoly hsz ON hsz.Pracownik_Id = hpr.Pracownik_Id
INNER JOIN SALONSAMOCHODOWY.HR.Zespoly hz ON hz.Zespol_Id = hsz.Zespol_Id
UNION
SELECT dhd.[Wyplata_Id]
      ,dhd.[Pracownik_Id]
      ,dhd.[Kwota_Wynagrodzenia]
      ,dhd.[Kwota_Wyplaty]
      ,dhd.[Typ]
      ,dhd.[Wyplata_Okres_Od]
      ,dhd.[Wyplata_Okres_Do]
      ,dhd.[Wynagrodzenie_Okres_Od]
      ,dhd.[Wynagrodzenie_Okres_Do]
	  ,dhd.[Stanowisko]
      ,dhd.[Stanowisko_Kod]
      ,dhd.[Zespol]
      ,dhd.[Zespol_Kod]
      ,dhd.[Stanowisko_Data_Przypisania]
      ,dhd.[Stanowisko_Data_Wypisania]
      ,dhd.[Zespol_Data_Przypisania]
      ,dhd.[Zespol_Data_Wypisania]
	  from [DENOM_SALONSAMOCHODOWY].[HR].[DimWyplaty_Wynagrodzenia_Przypisania] dhd)
EXCEPT 
(SELECT dhd.[Wyplata_Id]
      ,dhd.[Pracownik_Id]
      ,dhd.[Kwota_Wynagrodzenia]
      ,dhd.[Kwota_Wyplaty]
      ,dhd.[Typ]
      ,dhd.[Wyplata_Okres_Od]
      ,dhd.[Wyplata_Okres_Do]
      ,dhd.[Wynagrodzenie_Okres_Od]
      ,dhd.[Wynagrodzenie_Okres_Do]
	  ,dhd.[Stanowisko]
      ,dhd.[Stanowisko_Kod]
      ,dhd.[Zespol]
      ,dhd.[Zespol_Kod]
      ,dhd.[Stanowisko_Data_Przypisania]
      ,dhd.[Stanowisko_Data_Wypisania]
      ,dhd.[Zespol_Data_Przypisania]
      ,dhd.[Zespol_Data_Wypisania]
	  from [DENOM_SALONSAMOCHODOWY].[HR].[DimWyplaty_Wynagrodzenia_Przypisania] dhd)




INSERT INTO [DENOM_SALONSAMOCHODOWY].[dbo].[FactZamowienia] ([Salon_Zamowienie_Id]
	  ,[Serwis_Zamowienie_Id]
      ,[Klient_Id]
      ,[Sprzedawca_Id]
      ,[Usluga_Id]
      ,[Mod_Id]
      ,[Status_Id]
      ,[Ilosc]
      ,[Zrealizowano]
      ,[Oplacono]
      ,[Cena_Sprzedazy]
      ,[Data_Utworzenia]
      ,[Data_Rozpoczecia_Data_Sprzedazy]
      ,[Data_Zakonczenia_Data_Odbioru]
      ,[Aktualizujacy_Id]
      ,[Wpis_Od]
      ,[Wpis_Do])
(SELECT [Zamowienie_Id]
	  ,NULL
      ,[Klient_Id]
      ,[Sprzedawca_Id]
      ,NULL
      ,[Mod_Id]
      ,NULL
      ,[Ilosc]
      ,[Zrealizowano]
      ,[Oplacono]
      ,[Cena_Sprzedazy]
      ,[Data_Utworzenia]
      ,[Data_Sprzedazy]
      ,[Data_Odbioru]
      ,[Aktualizujacy_Id]
      ,[Wpis_Od]
      ,[Wpis_Do]
FROM [SALONSAMOCHODOWY].[Salon].[Zamowienia]
UNION 
SELECT 
	   [Salon_Zamowienie_Id]
	  ,[Serwis_Zamowienie_Id]
      ,[Klient_Id]
      ,[Sprzedawca_Id]
      ,[Usluga_Id]
      ,[Mod_Id]
      ,[Status_Id]
      ,[Ilosc]
      ,[Zrealizowano]
      ,[Oplacono]
      ,[Cena_Sprzedazy]
      ,[Data_Utworzenia]
      ,[Data_Rozpoczecia_Data_Sprzedazy]
      ,[Data_Zakonczenia_Data_Odbioru]
      ,[Aktualizujacy_Id]
      ,[Wpis_Od]
      ,[Wpis_Do]
	  FROM [DENOM_SALONSAMOCHODOWY].[dbo].[FactZamowienia])
EXCEPT 
(SELECT 
	   [Salon_Zamowienie_Id]
	  ,[Serwis_Zamowienie_Id]
      ,[Klient_Id]
      ,[Sprzedawca_Id]
      ,[Usluga_Id]
      ,[Mod_Id]
      ,[Status_Id]
      ,[Ilosc]
      ,[Zrealizowano]
      ,[Oplacono]
      ,[Cena_Sprzedazy]
      ,[Data_Utworzenia]
      ,[Data_Rozpoczecia_Data_Sprzedazy]
      ,[Data_Zakonczenia_Data_Odbioru]
      ,[Aktualizujacy_Id]
      ,[Wpis_Od]
      ,[Wpis_Do]
	  FROM [DENOM_SALONSAMOCHODOWY].[dbo].[FactZamowienia])


INSERT INTO [DENOM_SALONSAMOCHODOWY].[dbo].[FactZamowienia] ([Salon_Zamowienie_Id]
	  ,[Serwis_Zamowienie_Id]
      ,[Klient_Id]
      ,[Sprzedawca_Id]
      ,[Usluga_Id]
      ,[Mod_Id]
      ,[Status_Id]
      ,[Ilosc]
      ,[Zrealizowano]
      ,[Oplacono]
      ,[Cena_Sprzedazy]
      ,[Data_Utworzenia]
      ,[Data_Rozpoczecia_Data_Sprzedazy]
      ,[Data_Zakonczenia_Data_Odbioru]
      ,[Aktualizujacy_Id]
      ,[Wpis_Od]
      ,[Wpis_Do])
(SELECT 
	  NULL
	  ,[Zamowienie_Id]
      ,[Klient_Id]
      ,[Sprzedawca_Id]
      ,[Usluga_Id]
      ,NULL
      ,[Status_Id]
      ,[Ilosc]
      ,[Zrealizowano]
      ,[Oplacono]
      ,[Cena_Sprzedazy]
      ,[Data_Utworzenia]
      ,[Data_Rozpoczecia]
      ,[Data_Zakonczenia]
      ,[Aktualizujacy_Id]
      ,[Wpis_Od]
      ,[Wpis_Do]
FROM [SALONSAMOCHODOWY].[Serwis].[Zamowienia]
UNION
SELECT [Salon_Zamowienie_Id]
	  ,[Serwis_Zamowienie_Id]
      ,[Klient_Id]
      ,[Sprzedawca_Id]
      ,[Usluga_Id]
      ,[Mod_Id]
      ,[Status_Id]
      ,[Ilosc]
      ,[Zrealizowano]
      ,[Oplacono]
      ,[Cena_Sprzedazy]
      ,[Data_Utworzenia]
      ,[Data_Rozpoczecia_Data_Sprzedazy]
      ,[Data_Zakonczenia_Data_Odbioru]
      ,[Aktualizujacy_Id]
      ,[Wpis_Od]
      ,[Wpis_Do]
	  FROM [DENOM_SALONSAMOCHODOWY].[dbo].[FactZamowienia])
EXCEPT
(SELECT [Salon_Zamowienie_Id]
	  ,[Serwis_Zamowienie_Id]
      ,[Klient_Id]
      ,[Sprzedawca_Id]
      ,[Usluga_Id]
      ,[Mod_Id]
      ,[Status_Id]
      ,[Ilosc]
      ,[Zrealizowano]
      ,[Oplacono]
      ,[Cena_Sprzedazy]
      ,[Data_Utworzenia]
      ,[Data_Rozpoczecia_Data_Sprzedazy]
      ,[Data_Zakonczenia_Data_Odbioru]
      ,[Aktualizujacy_Id]
      ,[Wpis_Od]
      ,[Wpis_Do]
	  FROM [DENOM_SALONSAMOCHODOWY].[dbo].[FactZamowienia])