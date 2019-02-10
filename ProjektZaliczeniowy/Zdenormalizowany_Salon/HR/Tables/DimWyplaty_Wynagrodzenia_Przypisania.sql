CREATE TABLE [HR].[DimWyplaty_Wynagrodzenia_Przypisania] (
    [DimWWP_Id]                   INT            IDENTITY (1, 1) NOT NULL,
    [Wyplata_Id]                  INT            NOT NULL,
    [Pracownik_Id]                INT            DEFAULT ((-1)) NOT NULL,
    [Kwota_Wynagrodzenia]         DECIMAL (8, 2) NOT NULL,
    [Kwota_Wyplaty]               DECIMAL (8, 2) NOT NULL,
    [Typ]                         VARCHAR (20)   NOT NULL,
    [Wyplata_Okres_Od]            SMALLDATETIME  NOT NULL,
    [Wyplata_Okres_Do]            SMALLDATETIME  NOT NULL,
    [Wynagrodzenie_Okres_Od]      SMALLDATETIME  NOT NULL,
    [Wynagrodzenie_Okres_Do]      SMALLDATETIME  NOT NULL,
    [Stanowisko]                  VARCHAR (50)   NOT NULL,
    [Stanowisko_Kod]              VARCHAR (10)   NOT NULL,
    [Zespol]                      VARCHAR (50)   NOT NULL,
    [Zespol_Kod]                  VARCHAR (10)   NOT NULL,
    [Stanowisko_Data_Przypisania] SMALLDATETIME  NOT NULL,
    [Stanowisko_Data_Wypisania]   SMALLDATETIME  NULL,
    [Zespol_Data_Przypisania]     SMALLDATETIME  NOT NULL,
    [Zespol_Data_Wypisania]       SMALLDATETIME  NULL,
    PRIMARY KEY CLUSTERED ([DimWWP_Id] ASC),
    CONSTRAINT [FK_DimWyplaty_Wynagrodzenia_Przypisania] FOREIGN KEY ([Pracownik_Id]) REFERENCES [HR].[DimPracownik] ([Pracownik_Id]) ON UPDATE CASCADE
);

