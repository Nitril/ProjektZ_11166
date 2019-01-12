CREATE TABLE [dbo].[Modele] (
    [Model_Id]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [Model_Kod]   VARCHAR (10)  NOT NULL,
    [Model_Nazwa] VARCHAR (100) NOT NULL,
    [Marka_Id]    SMALLINT      NOT NULL,
    PRIMARY KEY CLUSTERED ([Model_Id] ASC),
    CONSTRAINT [FK_Marka_Id] FOREIGN KEY ([Marka_Id]) REFERENCES [dbo].[Marki] ([Marka_Id]),
    UNIQUE NONCLUSTERED ([Model_Kod] ASC)
);

