CREATE TABLE [dbo].[Zamowienia] (
    [Zamowienie_Id]   INT             IDENTITY (1, 1) NOT NULL,
    [Klient_Id]       INT             NOT NULL,
    [Sprzedawca_Id]   INT             NOT NULL,
    [Mod_Id]          SMALLINT        NOT NULL,
    [Oferta_Id]       INT             NOT NULL,
    [Ilosc]           INT             NOT NULL,
    [Zrealizowano]    BIT             NOT NULL,
    [Oplacono]        BIT             NOT NULL,
    [Cena_Sprzedazy]  DECIMAL (10, 2) NOT NULL,
    [Data_Utworzenia] SMALLDATETIME   NOT NULL,
    [Data_Sprzedazy]  SMALLDATETIME   NULL,
    [Data_Odbioru]    SMALLDATETIME   NULL,
    PRIMARY KEY CLUSTERED ([Zamowienie_Id] ASC),
    CONSTRAINT [FK_Klient_Id_Zamowienia] FOREIGN KEY ([Klient_Id]) REFERENCES [dbo].[Klient] ([Klient_Id]),
    CONSTRAINT [FK_Mod_Id_Zamowienia] FOREIGN KEY ([Mod_Id]) REFERENCES [dbo].[Modele] ([Mod_Id]),
    CONSTRAINT [FK_Oferta_Id_Zamowienia] FOREIGN KEY ([Oferta_Id]) REFERENCES [dbo].[Cennik] ([Oferta_Id]),
    CONSTRAINT [FK_Sprzedawca_Id_Zamowienia] FOREIGN KEY ([Sprzedawca_Id]) REFERENCES [dbo].[Pracownik] ([Pracownik_Id])
);

