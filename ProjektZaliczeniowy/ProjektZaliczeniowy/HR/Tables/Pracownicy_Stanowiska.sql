CREATE TABLE [HR].[Pracownicy_Stanowiska] (
    [Przypisanie_Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Pracownik_Id]     INT           NOT NULL,
    [Stanowisko_Id]    INT           NOT NULL,
    [Data_Przypisania] SMALLDATETIME NOT NULL,
    [Data_Wypisania]   SMALLDATETIME NULL,
    PRIMARY KEY CLUSTERED ([Przypisanie_Id] ASC),
    CONSTRAINT [FK_Pracownik_Id_Pracownicy_Stanowiska] FOREIGN KEY ([Pracownik_Id]) REFERENCES [HR].[Pracownik] ([Pracownik_Id]),
    CONSTRAINT [FK_Stanowisko_Id_Pracownicy_Stanowiska] FOREIGN KEY ([Stanowisko_Id]) REFERENCES [HR].[Stanowiska_Pracy] ([Stanowisko_Id])
);

