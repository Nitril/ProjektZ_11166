 --Zestawienia zamówień serwisu dla klientów wraz z poprzednimi i następnymi wartościami zamówień
CREATE FUNCTION rapAn.ZestawienieZamowienKlientSerwis (@KlientKod VARCHAR(10))
RETURNS TABLE
AS
RETURN
SELECT hdk.Imie + ' ' + hdk.Nazwisko AS Klient, Data_Zakonczenia_Data_Odbioru, Cena_Sprzedazy, 
		LAG(Cena_Sprzedazy) OVER(PARTITION BY hdk.Klient_Id ORDER BY Data_Zakonczenia_Data_Odbioru) AS Cena_Poprzednie_Zamowienie,
		LEAD(Cena_Sprzedazy, 2) OVER(PARTITION BY hdk.Klient_Id ORDER BY Data_Zakonczenia_Data_Odbioru) AS Cena_Nastepne_Zamowienie
FROM FactZamowienia fz WITH (READUNCOMMITTED)
INNER JOIN HR.DimKlient hdk WITH (READUNCOMMITTED) ON hdk.Klient_Id = fz.Klient_Id 
INNER JOIN HR.DimPracownik hdp WITH (READUNCOMMITTED) ON hdp.Pracownik_Id = fz.Sprzedawca_Id
WHERE Salon_Zamowienie_Id IS NULL AND hdk.Klient_Kod = @KlientKod