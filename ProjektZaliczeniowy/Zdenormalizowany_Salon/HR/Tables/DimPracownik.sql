CREATE TABLE [HR].[DimPracownik] (
    [Pracownik_Id]  INT           NOT NULL,
    [Nazwisko]      NVARCHAR (30) NOT NULL,
    [Imie]          NVARCHAR (25) NOT NULL,
    [NIP]           CHAR (13)     NULL,
    [PESEL]         CHAR (11)     NOT NULL,
    [Pracownik_Kod] VARCHAR (10)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Pracownik_Id] ASC),
    UNIQUE NONCLUSTERED ([PESEL] ASC),
    UNIQUE NONCLUSTERED ([Pracownik_Kod] ASC)
);





