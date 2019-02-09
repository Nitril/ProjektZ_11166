CREATE TABLE [HR].[DimWyplaty_Wynagrodzenia] (
    [Wyplata_Id]             INT            NOT NULL,
    [Pracownik_Id]           INT            DEFAULT ((-1)) NOT NULL,
    [Kwota_Wynagrodzenia]    DECIMAL (8, 2) NOT NULL,
    [Kwota_Wyplaty]          DECIMAL (8, 2) NOT NULL,
    [Typ]                    VARCHAR (20)   NOT NULL,
    [Wyplata_Okres_Od]       SMALLDATETIME  NOT NULL,
    [Wyplata_Okres_Do]       SMALLDATETIME  NOT NULL,
    [Wynagrodzenie_Okres_Od] SMALLDATETIME  NOT NULL,
    [Wynagrodzenie_Okres_Do] SMALLDATETIME  NOT NULL
);



