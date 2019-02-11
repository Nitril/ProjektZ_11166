CREATE TABLE [Salon].[DimCennik] (
    [Oferta_Id]  INT             NOT NULL,
    [Mod_Id]     SMALLINT        NOT NULL,
    [Cena]       DECIMAL (10, 2) NOT NULL,
    [Oferta_Od]  DATETIME        NOT NULL,
    [Oferta_Do]  DATETIME        NULL,
    [Oferta_Kod] VARCHAR (10)    NOT NULL,
    PRIMARY KEY CLUSTERED ([Oferta_Id] ASC),
    CONSTRAINT [FK_Denom_Mod_Id_Cennik] FOREIGN KEY ([Mod_Id]) REFERENCES [Salon].[Dim_Modele] ([Mod_Id])
);



