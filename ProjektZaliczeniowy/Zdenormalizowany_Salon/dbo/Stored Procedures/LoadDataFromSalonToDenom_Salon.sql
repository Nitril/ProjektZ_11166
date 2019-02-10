CREATE PROCEDURE LoadDataFromSalonToDenom_Salon   
    
AS   
  
-- procedura ladujaca 
Insert into DENOM_SALONSAMOCHODOWY.Serwis.DimUslugi([Usluga_Id]
      ,[Usluga_Opis]
      ,[Usluga_Nazwa]
      ,[Usluga_Kod]) select [Usluga_Id]
      ,[Usluga_Opis]
      ,[Usluga_Nazwa]
      ,[Usluga_Kod] from [SALONSAMOCHODOWY].[Serwis].[Uslugi];


Insert into [DENOM_SALONSAMOCHODOWY].[HR].[DimKlient]([Klient_Id]
      ,[Nazwisko]
      ,[Imie]
      ,[NIP]
      ,[Firma]
      ,[Telefon]
      ,[Nr_Dowodu_Osobistego]
      ,[Klient_Kod]) select [Klient_Id]
      ,[Nazwisko]
      ,[Imie]
      ,[NIP]
      ,[Firma]
      ,[Telefon]
      ,[Nr_Dowodu_Osobistego]
      ,[Klient_Kod] from [SALONSAMOCHODOWY].[HR].[Klient];


Insert into [DENOM_SALONSAMOCHODOWY].[Serwis].[DimStatusy_Zamowien] ([Status_Id]
      ,[Status])
	  select
	  [Status_Id]
      ,[Status]
	  from [SALONSAMOCHODOWY].[Serwis].[Statusy_Zamowien];



INSERT INTO [DENOM_SALONSAMOCHODOWY].[Salon].[Dim_Modele] ([Mod_Id]
      ,[Mod_Kod]
      ,[Mod_Nazwa]
      ,[Cena]
      ,[Oferta_Od]
      ,[Oferta_Do]
      ,[Oferta_Kod]
      ,[Mrk_Kod]
      ,[Mrk_Nazwa])
Select smo.[Mod_Id]
      ,[Mod_Kod]
      ,[Mod_Nazwa]
      ,[Cena]
      ,[Oferta_Od]
      ,[Oferta_Do]
      ,[Oferta_Kod]
      ,[Mrk_Kod]
      ,[Mrk_Nazwa]
FROM
SALONSAMOCHODOWY.Salon.Cennik sc 
INNER JOIN SALONSAMOCHODOWY.Salon.Modele smo ON  sc.Mod_Id = smo.Mod_Id
INNER JOIN SALONSAMOCHODOWY.Salon.Marki sma ON  sma.Mrk_Id = smo.Mrk_Id

INSERT INTO [DENOM_SALONSAMOCHODOWY].[HR].[DimPracownik]
([Pracownik_Id]
      ,[Nazwisko]
      ,[Imie]
      ,[NIP]
      ,[PESEL]
      ,[Pracownik_Kod]
      ,[Stanowisko]
      ,[Stanowisko_Kod]
      ,[Zespol]
      ,[Zespol_Kod]
      ,[Stanowisko_Data_Przypisania]
      ,[Stanowisko_Data_Wypisania]
      ,[Zespol_Data_Przypisania]
      ,[Zespol_Data_Wypisania])
SELECT hpr.[Pracownik_Id]
      ,[Nazwisko]
      ,[Imie]
      ,[NIP]
      ,[PESEL]
      ,[Pracownik_Kod]
      ,[Stanowisko]
      ,[Stanowisko_Kod]
      ,[Zespol]
      ,[Zespol_Kod]
      ,hps.[Data_Przypisania]
      ,hps.[Data_Wypisania]
      ,hsz.[Data_Przypisania]
      ,hsz.[Data_Wypisania]
FROM SALONSAMOCHODOWY.HR.Pracownik hpr
INNER JOIN SALONSAMOCHODOWY.HR.Pracownicy_Stanowiska hps ON hps.Pracownik_Id = hpr.Pracownik_Id
INNER JOIN SALONSAMOCHODOWY.HR.Stanowiska_Pracy hsp ON hsp.Stanowisko_Id = hps.Stanowisko_Id
INNER JOIN SALONSAMOCHODOWY.HR.Pracownicy_Zespoly hsz ON hsz.Pracownik_Id = hpr.Pracownik_Id
INNER JOIN SALONSAMOCHODOWY.HR.Zespoly hz ON hz.Zespol_Id = hsz.Zespol_Id

INSERT INTO [DENOM_SALONSAMOCHODOWY].[HR].[DimWyplaty_Wynagrodzenia]
([Wyplata_Id]
      ,[Pracownik_Id]
      ,[Kwota_Wynagrodzenia]
	  ,[Kwota_Wyplaty]
      ,[Typ]
      ,[Wyplata_Okres_Od]     
	  ,[Wyplata_Okres_Do]
      ,[Wynagrodzenie_Okres_Od]
      ,[Wynagrodzenie_Okres_Do])
SELECT [Wyplata_Id]
      ,hwy.[Pracownik_Id]
      ,hwy.[Kwota]
	  ,hwp.[Kwota]
      ,[Typ]
      ,hwp.[Okres_Od]
      ,hwp.[Okres_Do]
      ,hwy.[Okres_Od]
      ,hwy.[Okres_Do]
FROM SALONSAMOCHODOWY.HR.Wyplaty hwp
INNER JOIN SALONSAMOCHODOWY.HR.Wynagrodzenia hwy ON hwy.Pracownik_Id = hwp.Pracownik_Id 


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
SELECT [Zamowienie_Id]
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
SELECT 
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