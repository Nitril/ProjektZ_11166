-- Zestawienie sprzedazy poszczególnych zamówień w serwisie i pracowników którzy sprzedawali zamówienie wraz z całością sprzedaży dla pracownika i wszystkich pracowników
CREATE VIEW rapAn.vWykazSprzedazZamowienPerPracownikSerwis
AS
 SELECT hdp.Imie + ' ' + hdp.Nazwisko AS Pracownik, Serwis_Zamowienie_Id,Cena_Sprzedazy, 
     SUM(Cena_Sprzedazy) OVER(PARTITION BY Sprzedawca_Id) AS Suma_Sprzedazy_Pracownik
      ,SUM(Cena_Sprzedazy) OVER() AS Suma_Calej_Sprzedazy
FROM FactZamowienia fz WITH (READUNCOMMITTED)
INNER JOIN Serwis.DimUslugi sdu WITH (READUNCOMMITTED) ON sdu.Usluga_Id = fz.Usluga_Id
INNER JOIN HR.DimPracownik hdp WITH (READUNCOMMITTED) ON hdp.Pracownik_Id = fz.Sprzedawca_Id
WHERE Salon_Zamowienie_Id IS NULL