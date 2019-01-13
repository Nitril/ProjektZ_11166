CREATE TABLE [Serwis].[Statusy_Zamowien] (
    [Status_Id] INT          IDENTITY (1, 1) NOT NULL,
    [Status]    VARCHAR (25) NOT NULL,
    PRIMARY KEY CLUSTERED ([Status_Id] ASC)
);

