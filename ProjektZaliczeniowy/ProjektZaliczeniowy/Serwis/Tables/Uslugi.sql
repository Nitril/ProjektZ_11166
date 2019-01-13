CREATE TABLE [Serwis].[Uslugi] (
    [Usluga_Id]    INT           IDENTITY (1, 1) NOT NULL,
    [Usluga_Nazwa] VARCHAR (20)  NOT NULL,
    [Usluga_Opis]  VARCHAR (200) NOT NULL,
    PRIMARY KEY CLUSTERED ([Usluga_Id] ASC)
);

