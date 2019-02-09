CREATE TABLE [HR].[DimPracownik] (
    [Pracownik_Id]                INT           IDENTITY (1, 1) NOT NULL,
    [Nazwisko]                    NVARCHAR (30) NOT NULL,
    [Imie]                        NVARCHAR (25) NOT NULL,
    [NIP]                         CHAR (13)     NULL,
    [PESEL]                       CHAR (11)     NOT NULL,
    [Pracownik_Kod]               VARCHAR (10)  NOT NULL,
    [Stanowisko]                  VARCHAR (50)  NOT NULL,
    [Stanowisko_Kod]              VARCHAR (10)  NOT NULL,
    [Zespol]                      VARCHAR (50)  NOT NULL,
    [Zespol_Kod]                  VARCHAR (10)  NOT NULL,
    [Stanowisko_Data_Przypisania] SMALLDATETIME NOT NULL,
    [Stanowisko_Data_Wypisania]   SMALLDATETIME NULL,
    [Zespol_Data_Przypisania]     SMALLDATETIME NOT NULL,
    [Zespol_Data_Wypisania]       SMALLDATETIME NULL,
    PRIMARY KEY CLUSTERED ([Pracownik_Id] ASC)
);

