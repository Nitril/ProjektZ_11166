CREATE TABLE [Salon].[Dim_Modele] (
    [Mod_Id]    SMALLINT      NOT NULL,
    [Mod_Kod]   VARCHAR (10)  NOT NULL,
    [Mod_Nazwa] VARCHAR (100) NOT NULL,
    [Mrk_Kod]   VARCHAR (10)  NOT NULL,
    [Mrk_Nazwa] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Dim_Modele] PRIMARY KEY CLUSTERED ([Mod_Id] ASC)
);





