CREATE TABLE [Serwis].[Historia_Zamowien] (
    [Log_Id]          INT      IDENTITY (1, 1) NOT NULL,
    [Zamowienie_Id]   INT      NOT NULL,
    [Pracownik_Id]    INT      NOT NULL,
    [Status_Id]       INT      NOT NULL,
    [Data_Ustawienia] DATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([Log_Id] ASC),
    CONSTRAINT [FK_Pracownik_Id_Historia_Zamowien] FOREIGN KEY ([Pracownik_Id]) REFERENCES [HR].[Pracownik] ([Pracownik_Id]),
    CONSTRAINT [FK_Status_Id_Historia_Zamowien] FOREIGN KEY ([Status_Id]) REFERENCES [Serwis].[Statusy_Zamowien] ([Status_Id]),
    CONSTRAINT [FK_Zamowienie_Id_Historia_Zamowien] FOREIGN KEY ([Zamowienie_Id]) REFERENCES [dbo].[Zamowienia] ([Zamowienie_Id])
);



