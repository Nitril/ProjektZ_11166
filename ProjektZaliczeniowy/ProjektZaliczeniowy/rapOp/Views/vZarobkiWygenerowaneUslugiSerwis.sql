-- pokaż sumaryczny przychód wygenerowany przez poszczególne usługi
CREATE VIEW rapOp.vZarobkiWygenerowaneUslugiSerwis
		AS
		SELECT us.Usluga_Nazwa, SUM(za.Cena_Sprzedazy) AS Przychod
		FROM Serwis.Zamowienia za WITH (READUNCOMMITTED) 
		INNER JOIN Serwis.Uslugi us WITH (READUNCOMMITTED) ON za.Usluga_Id = us.Usluga_Id
		GROUP BY us.Usluga_Nazwa