﻿CREATE TABLE [HR].[Pracownicy_Zespoly] (
    [Przypisanie_Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Zespol_Id]        INT           CONSTRAINT [DF_Zespol_Id_Pracownicy_Zespoly] DEFAULT ((-1)) NOT NULL,
    [Pracownik_Id]     INT           CONSTRAINT [DF_Pracownik_Id_Pracownicy_Zespoly] DEFAULT ((-1)) NOT NULL,
    [Data_Przypisania] SMALLDATETIME NOT NULL,
    [Data_Wypisania]   SMALLDATETIME NULL,
    PRIMARY KEY CLUSTERED ([Przypisanie_Id] ASC),
    CONSTRAINT [FK_Pracownik_Id_Pracownicy_Zespoly] FOREIGN KEY ([Pracownik_Id]) REFERENCES [HR].[Pracownik] ([Pracownik_Id]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    CONSTRAINT [FK_Zespol_Id_Pracownicy_Zespoly] FOREIGN KEY ([Zespol_Id]) REFERENCES [HR].[Zespoly] ([Zespol_Id]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
);



