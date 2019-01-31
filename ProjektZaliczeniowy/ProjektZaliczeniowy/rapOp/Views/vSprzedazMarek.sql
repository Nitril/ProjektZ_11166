CREATE VIEW [rapOp].vSprzedazMarek 

AS

SELECT mk.Mrk_Nazwa, Count(Mrk_Nazwa) AS Ilosc_Zam, SUM(Cena_Sprzedazy) as Sumaryczna_Cena_Sprzedazy  
FROM Salon.Zamowienia z INNER JOIN Salon.Modele m ON z.Mod_Id = m.Mod_Id 
LEFT JOIN Salon.Marki mk ON mk.Mrk_Id = m.Mrk_Id 
GROUP BY mk.Mrk_Nazwa