-- pokaz zespoly i uszereguj pod kontem wyplacanych wypłat w danym roku - rok przekazany jako parametr
CREATE FUNCTION rapAn.SprawdzRankingWyplatZespolow (@rok INT)
RETURNS TABLE
AS
RETURN

SELECT Zespol,  YEAR(Wynagrodzenie_Okres_Od) AS Rok, Kwota_Wynagrodzenia,
RANK() OVER(ORDER BY Kwota_Wynagrodzenia ASC) AS Ranking_Wynagrodzeń
FROM HR.DimWyplaty_Wynagrodzenia_Przypisania WITH (READUNCOMMITTED)
WHERE Wyplata_Id IS NOT NULL AND YEAR(Wynagrodzenie_Okres_Od) = @rok
GROUP BY Zespol , Kwota_Wynagrodzenia, YEAR(Wynagrodzenie_Okres_Od), Month(Wynagrodzenie_Okres_Od)