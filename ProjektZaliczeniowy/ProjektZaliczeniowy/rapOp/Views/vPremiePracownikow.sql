CREATE VIEW rapOp.vPremiePracownikow
		AS
		Select pr.Imie, pr.Nazwisko, SUM(kwota) as Sumaryczna_Kwota_Premii
		FROM HR.Pracownik pr  WITH (READUNCOMMITTED) INNER JOIN HR.Wyplaty wy WITH (READUNCOMMITTED) ON pr.Pracownik_Id = wy.Pracownik_Id
		WHERE wy.Typ ='Premia'
		GROUP BY pr.Imie, pr.Nazwisko;