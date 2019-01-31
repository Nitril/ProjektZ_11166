CREATE TABLE [Serwis].[HistoriaZamowien] (
    [Zamowienie_Id]    INT             NOT NULL,
    [Klient_Id]        INT             NOT NULL,
    [Sprzedawca_Id]    INT             NOT NULL,
    [Usluga_Id]        INT             NOT NULL,
    [Status_Id]        INT             NOT NULL,
    [Ilosc]            INT             NOT NULL,
    [Zrealizowano]     BIT             NOT NULL,
    [Oplacono]         BIT             NOT NULL,
    [Cena_Sprzedazy]   DECIMAL (10, 2) NOT NULL,
    [Data_Utworzenia]  SMALLDATETIME   NOT NULL,
    [Data_Rozpoczecia] SMALLDATETIME   NULL,
    [Data_Zakonczenia] SMALLDATETIME   NULL,
    [Aktualizujacy_Id] INT             NOT NULL,
    [Wpis_Od]          DATETIME2 (7)   NOT NULL,
    [Wpis_Do]          DATETIME2 (7)   NOT NULL
);




GO
CREATE CLUSTERED INDEX [ix_HistoriaZamowien]
    ON [Serwis].[HistoriaZamowien]([Wpis_Do] ASC, [Wpis_Od] ASC) WITH (DATA_COMPRESSION = PAGE);



