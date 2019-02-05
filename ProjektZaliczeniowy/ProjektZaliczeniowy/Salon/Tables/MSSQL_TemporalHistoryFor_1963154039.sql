CREATE TABLE [Salon].[MSSQL_TemporalHistoryFor_1963154039] (
    [Zamowienie_Id]    INT             NOT NULL,
    [Klient_Id]        INT             NOT NULL,
    [Sprzedawca_Id]    INT             NOT NULL,
    [Mod_Id]           SMALLINT        NOT NULL,
    [Ilosc]            INT             NOT NULL,
    [Zrealizowano]     BIT             NOT NULL,
    [Oplacono]         BIT             NOT NULL,
    [Cena_Sprzedazy]   DECIMAL (10, 2) NOT NULL,
    [Data_Utworzenia]  SMALLDATETIME   NOT NULL,
    [Data_Sprzedazy]   SMALLDATETIME   NULL,
    [Data_Odbioru]     SMALLDATETIME   NULL,
    [Aktualizujacy_Id] INT             NOT NULL,
    [Wpis_Od]          DATETIME2 (7)   NOT NULL,
    [Wpis_Do]          DATETIME2 (7)   NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_MSSQL_TemporalHistoryFor_1963154039]
    ON [Salon].[MSSQL_TemporalHistoryFor_1963154039]([Wpis_Do] ASC, [Wpis_Od] ASC) WITH (DATA_COMPRESSION = PAGE);

