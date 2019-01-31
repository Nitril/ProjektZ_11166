CREATE TABLE [HR].[Zespoly] (
    [Zespol_Id]  INT          IDENTITY (1, 1) NOT NULL,
    [Zespol]     VARCHAR (50) NOT NULL,
    [Zespol_Kod] VARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([Zespol_Id] ASC),
    UNIQUE NONCLUSTERED ([Zespol_Kod] ASC)
);



