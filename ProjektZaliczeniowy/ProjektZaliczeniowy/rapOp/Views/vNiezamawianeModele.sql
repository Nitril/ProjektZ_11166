CREATE VIEW [rapOp].vNiezamawianeModele 

AS
SELECT m.Mod_Nazwa
FROM Salon.Zamowienia z RIGHT JOIN Salon.Modele m ON z.Mod_Id = m.Mod_Id
WHERE z.Zamowienie_Id IS NULL