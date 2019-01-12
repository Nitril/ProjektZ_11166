CREATE TABLE [dbo].[Marki] (
    [Marka_Id]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [Marka_Kod]   VARCHAR (10)  NOT NULL,
    [Marka_Nazwa] VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([Marka_Id] ASC),
    UNIQUE NONCLUSTERED ([Marka_Kod] ASC)
);

