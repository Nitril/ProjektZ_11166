CREATE TABLE [dbo].[Klient] (
    [Klient_Id]            INT           IDENTITY (1, 1) NOT NULL,
    [Nazwisko]             NVARCHAR (30) NOT NULL,
    [Imie]                 NVARCHAR (25) NOT NULL,
    [NIP]                  CHAR (13)     NULL,
    [Firma]                NVARCHAR (40) NULL,
    [Telefon]              NVARCHAR (24) NULL,
    [Nr_Dowodu_Osobistego] CHAR (9)      NULL,
    PRIMARY KEY CLUSTERED ([Klient_Id] ASC),
    UNIQUE NONCLUSTERED ([Nr_Dowodu_Osobistego] ASC)
);



