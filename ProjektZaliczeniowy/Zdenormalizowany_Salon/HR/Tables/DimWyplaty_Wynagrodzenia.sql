CREATE TABLE [HR].[DimWyplaty_Wynagrodzenia] (
    [Wyplata_Id]             INT            IDENTITY (1, 1) NOT NULL,
    [Pracownik_Id]           INT            DEFAULT ((-1)) NOT NULL,
    [Kwota]                  DECIMAL (8, 2) NOT NULL,
    [Typ]                    VARCHAR (20)   NOT NULL,
    [Okres_Od]               SMALLDATETIME  NOT NULL,
    [Okres_Do]               SMALLDATETIME  NOT NULL,
    [Wynagrodzenie_Okres_Od] SMALLDATETIME  NOT NULL,
    [Wynagrodzenie_Okres_Do] SMALLDATETIME  NOT NULL,
    PRIMARY KEY CLUSTERED ([Wyplata_Id] ASC),
    CONSTRAINT [FK_Pracownik_Id_Wyplaty] FOREIGN KEY ([Pracownik_Id]) REFERENCES [HR].[DimPracownik] ([Pracownik_Id]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
);

