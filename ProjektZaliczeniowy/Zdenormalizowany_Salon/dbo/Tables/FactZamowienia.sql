﻿CREATE TABLE [dbo].[FactZamowienia] (
    [Salon_Zamowienie_Id]             INT             NULL,
    [Serwis_Zamowienie_Id]            INT             NULL,
    [Klient_Id]                       INT             DEFAULT ((-1)) NOT NULL,
    [Sprzedawca_Id]                   INT             DEFAULT ((-1)) NOT NULL,
    [Usluga_Id]                       INT             DEFAULT ((-1)) NULL,
    [Mod_Id]                          SMALLINT        DEFAULT ((-1)) NULL,
    [Status_Id]                       INT             DEFAULT ((-1)) NULL,
    [Ilosc]                           INT             NOT NULL,
    [Zrealizowano]                    BIT             NOT NULL,
    [Oplacono]                        BIT             NOT NULL,
    [Cena_Sprzedazy]                  DECIMAL (10, 2) NOT NULL,
    [Data_Utworzenia]                 SMALLDATETIME   NOT NULL,
    [Data_Rozpoczecia_Data_Sprzedazy] SMALLDATETIME   NULL,
    [Data_Zakonczenia_Data_Odbioru]   SMALLDATETIME   NULL,
    [Aktualizujacy_Id]                INT             NOT NULL,
    [Wpis_Od]                         DATETIME2 (7)   NOT NULL,
    [Wpis_Do]                         DATETIME2 (7)   NOT NULL,
    CONSTRAINT [CHK_Cena_Sprzedazy] CHECK ([Cena_Sprzedazy]>(0)),
    CONSTRAINT [FK_Klient_Id_Serwis_Zamowienia] FOREIGN KEY ([Klient_Id]) REFERENCES [HR].[DimKlient] ([Klient_Id]) ON DELETE SET DEFAULT ON UPDATE CASCADE,
    CONSTRAINT [FK_Status_Id_Serwis_Zamowienia] FOREIGN KEY ([Status_Id]) REFERENCES [Serwis].[DimStatusy_Zamowien] ([Status_Id]) ON DELETE SET DEFAULT ON UPDATE CASCADE,
    CONSTRAINT [FK_Usluga_Id_Serwis_Zamowienia] FOREIGN KEY ([Usluga_Id]) REFERENCES [Serwis].[DimUslugi] ([Usluga_Id]) ON DELETE SET DEFAULT ON UPDATE CASCADE
);



