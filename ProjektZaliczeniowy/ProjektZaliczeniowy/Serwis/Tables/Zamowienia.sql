﻿CREATE TABLE [Serwis].[Zamowienia] (
    [Zamowienie_Id]    INT                                         IDENTITY (1, 1) NOT NULL,
    [Klient_Id]        INT                                         DEFAULT ((-1)) NOT NULL,
    [Sprzedawca_Id]    INT                                         DEFAULT ((-1)) NOT NULL,
    [Usluga_Id]        INT                                         DEFAULT ((-1)) NOT NULL,
    [Status_Id]        INT                                         DEFAULT ((-1)) NOT NULL,
    [Ilosc]            INT                                         NOT NULL,
    [Zrealizowano]     BIT                                         NOT NULL,
    [Oplacono]         BIT                                         NOT NULL,
    [Cena_Sprzedazy]   DECIMAL (10, 2)                             NOT NULL,
    [Data_Utworzenia]  SMALLDATETIME                               NOT NULL,
    [Data_Rozpoczecia] SMALLDATETIME                               NULL,
    [Data_Zakonczenia] SMALLDATETIME                               NULL,
    [Aktualizujacy_Id] INT                                         NOT NULL,
    [Wpis_Od]          DATETIME2 (7) GENERATED ALWAYS AS ROW START DEFAULT (CONVERT([datetime2],'1900-01-01 00:00:00.0000000')) NOT NULL,
    [Wpis_Do]          DATETIME2 (7) GENERATED ALWAYS AS ROW END   DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    PRIMARY KEY CLUSTERED ([Zamowienie_Id] ASC),
    CONSTRAINT [FK_Aktualizujacy_Id_Serwis_Zamowienia] FOREIGN KEY ([Aktualizujacy_Id]) REFERENCES [HR].[Pracownik] ([Pracownik_Id]),
    CONSTRAINT [FK_Klient_Id_Serwis_Zamowienia] FOREIGN KEY ([Klient_Id]) REFERENCES [HR].[Klient] ([Klient_Id]) ON DELETE SET DEFAULT ON UPDATE CASCADE,
    CONSTRAINT [FK_Sprzedawca_Id_Serwis_Zamowienia] FOREIGN KEY ([Sprzedawca_Id]) REFERENCES [HR].[Pracownik] ([Pracownik_Id]) ON DELETE SET DEFAULT ON UPDATE CASCADE,
    CONSTRAINT [FK_Status_Id_Serwis_Zamowienia] FOREIGN KEY ([Status_Id]) REFERENCES [Serwis].[Statusy_Zamowien] ([Status_Id]) ON DELETE SET DEFAULT ON UPDATE CASCADE,
    CONSTRAINT [FK_Usluga_Id_Serwis_Zamowienia] FOREIGN KEY ([Usluga_Id]) REFERENCES [Serwis].[Uslugi] ([Usluga_Id]) ON DELETE SET DEFAULT ON UPDATE CASCADE,
    PERIOD FOR SYSTEM_TIME ([Wpis_Od], [Wpis_Do])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Serwis].[HistoriaZamowien], DATA_CONSISTENCY_CHECK=ON));







