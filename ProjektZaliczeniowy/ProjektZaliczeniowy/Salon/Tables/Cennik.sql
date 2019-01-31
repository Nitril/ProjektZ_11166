CREATE TABLE [Salon].[Cennik] (
    [Oferta_Id]  INT             IDENTITY (1, 1) NOT NULL,
    [Mod_Id]     SMALLINT        CONSTRAINT [DF_Mod_Id_Cennik] DEFAULT ((-1)) NOT NULL,
    [Cena]       DECIMAL (10, 2) NOT NULL,
    [Oferta_Od]  DATETIME        NOT NULL,
    [Oferta_Do]  DATETIME        NULL,
    [Oferta_Kod] VARCHAR (10)    NOT NULL,
    PRIMARY KEY CLUSTERED ([Oferta_Id] ASC),
    CONSTRAINT [FK_Mod_Id_Cennik] FOREIGN KEY ([Mod_Id]) REFERENCES [Salon].[Modele] ([Mod_Id]) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    UNIQUE NONCLUSTERED ([Oferta_Kod] ASC)
);



