CREATE VIEW rapOp.vWynagrodzeniaZespolowTotal
		AS
		SELECT ze.Zespol, SUM(wy.Kwota) as Suma_Wynagrodzenia
		FROM HR.Wynagrodzenia wy  WITH (READUNCOMMITTED)
		INNER JOIN HR.Pracownik pr WITH (READUNCOMMITTED) ON wy.Pracownik_Id = pr.Pracownik_Id
		INNER JOIN HR.Pracownicy_Zespoly pz WITH (READUNCOMMITTED) ON pz.Pracownik_Id = pr.Pracownik_Id
		INNER JOIN HR.Zespoly ze WITH (READUNCOMMITTED) ON pz.Zespol_Id = ze.Zespol_Id 
		GROUP BY ze.Zespol