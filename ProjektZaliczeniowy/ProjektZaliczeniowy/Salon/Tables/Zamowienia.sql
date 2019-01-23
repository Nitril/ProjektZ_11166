CREATE TABLE [Salon].[Zamowienia] (
    [Zamowienie_Id]   INT                                         IDENTITY (1, 1) NOT NULL,
    [Klient_Id]       INT                                         CONSTRAINT [DF_Klient_Id_Zamowienia] DEFAULT ((-1)) NOT NULL,
    [Sprzedawca_Id]   INT                                         CONSTRAINT [DF_Sprzedawca_Id_Zamowienia] DEFAULT ((-1)) NOT NULL,
    [Mod_Id]          SMALLINT                                    CONSTRAINT [DF_Mod_Id_Zamowienia] DEFAULT ((-1)) NOT NULL,
    [Oferta_Id]       INT                                         CONSTRAINT [DF_Oferta_Id_Zamowienia] DEFAULT ((-1)) NOT NULL,
    [Ilosc]           INT                                         NOT NULL,
    [Zrealizowano]    BIT                                         NOT NULL,
    [Oplacono]        BIT                                         NOT NULL,
    [Cena_Sprzedazy]  DECIMAL (10, 2)                             NOT NULL,
    [Data_Utworzenia] SMALLDATETIME                               NOT NULL,
    [Data_Sprzedazy]  SMALLDATETIME                               NULL,
    [Data_Odbioru]    SMALLDATETIME                               NULL,
    [StartDate]       DATETIME2 (7) GENERATED ALWAYS AS ROW START DEFAULT (CONVERT([datetime2],'1900-01-01 00:00:00.0000000')) NOT NULL,
    [EndDate]         DATETIME2 (7) GENERATED ALWAYS AS ROW END   DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    PRIMARY KEY CLUSTERED ([Zamowienie_Id] ASC),
    CONSTRAINT [CHK_Cena_Sprzedazy] CHECK ([Cena_Sprzedazy]>(0)),
    CONSTRAINT [FK_Klient_Id_Zamowienia] FOREIGN KEY ([Klient_Id]) REFERENCES [HR].[Klient] ([Klient_Id]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    CONSTRAINT [FK_Mod_Id_Zamowienia] FOREIGN KEY ([Mod_Id]) REFERENCES [Salon].[Modele] ([Mod_Id]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    CONSTRAINT [FK_Oferta_Id_Zamowienia] FOREIGN KEY ([Oferta_Id]) REFERENCES [Salon].[Cennik] ([Oferta_Id]),
    CONSTRAINT [FK_Sprzedawca_Id_Zamowienia] FOREIGN KEY ([Sprzedawca_Id]) REFERENCES [HR].[Pracownik] ([Pracownik_Id]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    PERIOD FOR SYSTEM_TIME ([StartDate], [EndDate])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Salon].[HistoriaZamowien], DATA_CONSISTENCY_CHECK=ON));



