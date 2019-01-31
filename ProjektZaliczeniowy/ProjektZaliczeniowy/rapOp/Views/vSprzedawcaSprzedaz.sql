CREATE VIEW [rapOp].vSprzedawcaSprzedaz 

AS
SELECT p.Imie + ' ' + p.Nazwisko As Nazwa_Pracownika, Count(Zamowienie_Id) As Liczba_Zamowien, SUM(Cena_Sprzedazy) AS Sumaryczna_Wartość_Sprzedazy 
FROM Salon.Zamowienia z WITH (READUNCOMMITTED)
INNER JOIN HR.Pracownik p WITH (READUNCOMMITTED) ON z.Sprzedawca_Id = p.Pracownik_Id 
GROUP BY p.Imie + ' ' + p.Nazwisko