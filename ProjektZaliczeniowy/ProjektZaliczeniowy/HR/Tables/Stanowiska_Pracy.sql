CREATE TABLE [HR].[Stanowiska_Pracy] (
    [Stanowisko_Id] INT          IDENTITY (1, 1) NOT NULL,
    [Stanowisko]    VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Stanowisko_Id] ASC)
);

