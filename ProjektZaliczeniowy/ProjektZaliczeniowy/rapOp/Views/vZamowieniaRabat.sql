CREATE VIEW [rapOp].vZamowieniaRabat 

AS

SELECT z.Zamowienie_Id, (c.Cena-z.Cena_Sprzedazy/c.Cena) AS Rabat
FROM Salon.Zamowienia z WITH (READUNCOMMITTED)
INNER JOIN Salon.Cennik c WITH (READUNCOMMITTED) ON z.Mod_Id = c.Mod_Id
WHERE c.Cena = (SELECT c.Cena 
FROM Salon.Cennik 
WHERE z.Data_Sprzedazy BETWEEN c.Oferta_Od AND c.Oferta_Do)