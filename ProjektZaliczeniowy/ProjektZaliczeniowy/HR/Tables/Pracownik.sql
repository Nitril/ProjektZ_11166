CREATE TABLE [HR].[Pracownik] (
    [Pracownik_Id] INT           IDENTITY (1, 1) NOT NULL,
    [Nazwisko]     NVARCHAR (30) NOT NULL,
    [Imie]         NVARCHAR (25) NOT NULL,
    [NIP]          CHAR (13)     NULL,
    [PESEL]        CHAR (11)     NOT NULL,
    PRIMARY KEY CLUSTERED ([Pracownik_Id] ASC),
    UNIQUE NONCLUSTERED ([PESEL] ASC),
    UNIQUE NONCLUSTERED ([PESEL] ASC)
);

