--pokaż rabat jaki został udzielony na poszczególne zamówienie
CREATE VIEW [rapOp].[vZamowieniaRabat] 
AS
SELECT z.Zamowienie_Id, CAST((c.Cena-z.Cena_Sprzedazy/c.Cena)AS DECIMAL (8, 2)) AS Rabat
FROM Salon.Zamowienia z WITH (READUNCOMMITTED)
INNER JOIN Salon.Cennik c WITH (READUNCOMMITTED) ON z.Mod_Id = c.Mod_Id