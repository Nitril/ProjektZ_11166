CREATE TABLE [Salon].[Dim_Modele] (
    [Mod_Id]     SMALLINT        NOT NULL,
    [Mod_Kod]    VARCHAR (10)    NOT NULL,
    [Mod_Nazwa]  VARCHAR (100)   NOT NULL,
    [Cena]       DECIMAL (10, 2) NOT NULL,
    [Oferta_Od]  DATETIME        NOT NULL,
    [Oferta_Do]  DATETIME        NULL,
    [Oferta_Kod] VARCHAR (10)    NOT NULL,
    [Mrk_Kod]    VARCHAR (10)    NOT NULL,
    [Mrk_Nazwa]  VARCHAR (100)   NOT NULL
);



