CREATE TABLE [dbo].[Cennik] (
    [Oferta_Id] INT             IDENTITY (1, 1) NOT NULL,
    [Mod_Id]    SMALLINT        NOT NULL,
    [Cena]      DECIMAL (10, 2) NOT NULL,
    [Oferta_Od] DATETIME        NOT NULL,
    [Oferta_Do] DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([Oferta_Id] ASC),
    CONSTRAINT [FK_Mod_Id_Cennik] FOREIGN KEY ([Mod_Id]) REFERENCES [dbo].[Modele] ([Mod_Id])
);

