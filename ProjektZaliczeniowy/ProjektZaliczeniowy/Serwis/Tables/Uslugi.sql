﻿CREATE TABLE [Serwis].[Uslugi] (
    [Usluga_Id]    INT            IDENTITY (1, 1) NOT NULL,
    [Usluga_Opis]  NVARCHAR (200) NOT NULL,
    [Usluga_Nazwa] NVARCHAR (20)  NOT NULL,
    [Usluga_Kod]   NVARCHAR (10)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Usluga_Id] ASC),
    UNIQUE NONCLUSTERED ([Usluga_Kod] ASC)
);





