CREATE TABLE [dbo].[Modele] (
    [Mod_Id]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [Mod_Kod]   VARCHAR (10)  NOT NULL,
    [Mod_Nazwa] VARCHAR (100) NOT NULL,
    [Mrk_Id]    SMALLINT      NOT NULL,
    PRIMARY KEY CLUSTERED ([Mod_Id] ASC),
    CONSTRAINT [FK_Mrk_Id_Modele] FOREIGN KEY ([Mrk_Id]) REFERENCES [dbo].[Marki] ([Mrk_Id]),
    UNIQUE NONCLUSTERED ([Mod_Kod] ASC)
);



