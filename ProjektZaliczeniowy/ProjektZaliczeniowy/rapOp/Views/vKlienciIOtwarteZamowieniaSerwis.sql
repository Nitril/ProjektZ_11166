CREATE VIEW rapOp.vKlienciIOtwarteZamowieniaSerwis
		AS
		SELECT kl.Imie, kl.Nazwisko, za.Zamowienie_Id, za.Cena_Sprzedazy, sz.[Status]
		FROM Serwis.Zamowienia za WITH (READUNCOMMITTED) 
		INNER JOIN HR.Klient kl WITH (READUNCOMMITTED) ON kl.Klient_Id = za.Klient_Id
		INNER JOIN Serwis.Statusy_Zamowien sz WITH (READUNCOMMITTED) ON za.Status_Id = sz.Status_Id
		WHERE za.Status_Id <> 5