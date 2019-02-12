 --najrzadziej lub wcale niezamawiane modele samochodów
CREATE PROCEDURE rapAn.NajrzadziejZamawianeModele
AS
SELECT sdm.Mod_Nazwa, SUM(fz.Ilosc) AS Ile_szt_Zamowien
FROM FactZamowienia fz WITH (READUNCOMMITTED)
INNER JOIN Salon.Dim_Modele sdm WITH (READUNCOMMITTED) ON sdm.Mod_Id = fz.Mod_Id 
GROUP BY sdm.Mod_Nazwa
ORDER BY SUM(fz.Ilosc) DESC
OFFSET (SELECT Count(*) FROM Salon.Dim_Modele)/2  ROWS 
FETCH NEXT (SELECT Count(*) FROM Salon.Dim_Modele)/2 ROWS ONLY