Create VIEW rapOp.vPracownicyNieprzypisaniDoZespolu
		AS
		SELECT pr.Imie, pr.Nazwisko
		FROM HR.Pracownik pr WITH (READUNCOMMITTED) 
		LEFT OUTER JOIN HR.Pracownicy_Zespoly pz WITH (READUNCOMMITTED) ON pz.Pracownik_Id = pr.Pracownik_Id
		WHERE pz.Pracownik_Id IS NULL