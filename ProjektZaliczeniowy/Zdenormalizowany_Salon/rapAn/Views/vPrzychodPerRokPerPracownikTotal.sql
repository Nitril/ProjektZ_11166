-- pokaz wygenerowany przychód na przestrzeni lat i miesięcy grupując po latach sprzedaży, miesiącach i kwocie sprzedaży
CREATE VIEW rapAn.vPrzychodPerRokPerPracownikTotal
AS
SELECT
    YEAR(Data_Rozpoczecia_Data_Sprzedazy) as Rok,
	MONTH(Data_Rozpoczecia_Data_Sprzedazy) as Miesiąc,
    SUM(Cena_Sprzedazy) as Sprzedaż
FROM FactZamowienia fz WITH (READUNCOMMITTED)
WHERE Salon_Zamowienie_Id IS NOT NULL AND Serwis_Zamowienie_Id IS NULL
GROUP BY ROLLUP(YEAR(Data_Rozpoczecia_Data_Sprzedazy),MONTH(Data_Rozpoczecia_Data_Sprzedazy))