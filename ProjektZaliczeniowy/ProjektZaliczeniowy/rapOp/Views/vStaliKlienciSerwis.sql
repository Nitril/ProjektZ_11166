CREATE VIEW rapOp.vStaliKlienciSerwis
		AS
		SELECT kl.Imie, kl.Nazwisko, COUNT(Zamowienie_Id) AS Liczba_Zamowien
		FROM Serwis.Zamowienia za WITH (READUNCOMMITTED) 
		INNER JOIN HR.Klient kl WITH (READUNCOMMITTED) ON kl.Klient_Id = za.Klient_Id
		GROUP BY kl.Imie, kl.Nazwisko
		HAVING COUNT(Zamowienie_Id)>3