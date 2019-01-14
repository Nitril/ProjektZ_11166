CREATE TABLE [HR].[Wynagrodzenia] (
    [Wynagrodzenie_Id] INT            IDENTITY (1, 1) NOT NULL,
    [Pracownik_Id]     INT            CONSTRAINT [DF_Pracownik_Id_Wynagrodzenia] DEFAULT ((-1)) NOT NULL,
    [Kwota]            DECIMAL (8, 2) NOT NULL,
    [Okres_Od]         SMALLDATETIME  NOT NULL,
    [Okres_Do]         SMALLDATETIME  NOT NULL,
    PRIMARY KEY CLUSTERED ([Wynagrodzenie_Id] ASC),
    CONSTRAINT [FK_Pracownik_Id_Wynagrodzenia] FOREIGN KEY ([Pracownik_Id]) REFERENCES [HR].[Pracownik] ([Pracownik_Id]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
);



