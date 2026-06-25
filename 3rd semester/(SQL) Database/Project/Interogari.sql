--select cu join
SELECT 
    c.id_comanda,
    c.data_comanda,
    c.status,
    cl.nume,
    cl.prenume
FROM Comenzi c
JOIN Clienti cl ON c.id_client = cl.id_client;

--select cu group by si interogare cu functie de agregare
SELECT 
    status,
    COUNT(*) AS numar_comenzi
FROM Comenzi
GROUP BY status;

--select cu subinterogare 
SELECT nume, prenume
FROM Clienti
WHERE id_client IN 
(
    SELECT DISTINCT id_client
    FROM Comenzi
);

UPDATE Comenzi
SET status = 'Finalizata'
WHERE id_comanda = 3;

UPDATE Produse
SET pret = pret * 1.10
WHERE id_categorie = 1;

DELETE FROM Detalii_Comanda
WHERE cantitate = 1;


UPDATE Comenzi
SET status = 'Finalizata'
WHERE id_comanda = 7;

UPDATE Produse
SET pret = pret * 1.25
WHERE id_categorie = 3;

UPDATE Produse
SET stoc = stoc * 2
WHERE id_categorie = 5;

UPDATE Produse
SET stoc = stoc * 2
WHERE id_categorie = 7;
