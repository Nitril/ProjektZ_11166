CREATE TABLE [Salon].[Marki] (
    [Mrk_Id]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [Mrk_Kod]   VARCHAR (10)  NOT NULL,
    [Mrk_Nazwa] VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([Mrk_Id] ASC),
    UNIQUE NONCLUSTERED ([Mrk_Kod] ASC)
);

