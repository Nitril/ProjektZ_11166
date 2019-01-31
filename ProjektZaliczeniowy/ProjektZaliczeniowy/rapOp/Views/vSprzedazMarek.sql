CREATE VIEW [rapOp].vSprzedazMarek 

AS

SELECT mk.Mrk_Nazwa, Count(Mrk_Nazwa) AS Ilosc_Zam, SUM(Cena_Sprzedazy) as Sumaryczna_Cena_Sprzedazy  
FROM Salon.Zamowienia z WITH (READUNCOMMITTED) 
INNER JOIN Salon.Modele m WITH (READUNCOMMITTED) ON z.Mod_Id = m.Mod_Id 
LEFT JOIN Salon.Marki mk WITH (READUNCOMMITTED) ON mk.Mrk_Id = m.Mrk_Id 
GROUP BY mk.Mrk_Nazwa