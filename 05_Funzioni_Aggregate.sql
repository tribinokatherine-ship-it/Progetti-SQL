-- Le Funzioni Aggregate in SQL Server
/*
    Le funzioni aggregate permettono di
    effetuare calcoli sulle righe
    
    Le principali sono:
    
    |COUNT()    | Conta         |
    |-----------|---------------|
    |SUM()      | SOMMA         |
    |-----------|---------------|
    |AVG()      | Media         |
    |-----------|---------------|
    |MIN()      | Valore Minimo |
    |-----------|---------------|
    |MAX()      | Valore Massimo|
    |-----------|---------------|

*/

-- 1 Totale righe degli studenti
SELECT 
   COUNT(*) AS [Numero Totale Studenti degli Studenti]
FROM Studenti;

-- 2 COUNT / UNION ALL

SELECT 'Studenti' AS Tabella,
        Count(*) AS NumeroRighe 
FROM Studenti
-- Quanti corsi cè l'ho metto UNION ALLL MI PERMETTTE DI UNIFICARE 
UNION ALL

SELECT 
    'Corsi',
    COUNT(*)
FROM Corsi

UNION ALL

SELECT 
    'Docenti',
    COUNT(*)
FROM Docenti

UNION ALL

SELECT 
    'Docenti Corso',
    COUNT(*)
FROM DocentiCorso

UNION ALL

SELECT 
    'Aule',
    COUNT(*)
FROM Aule

UNION ALL

SELECT 
    'Iscrizioni',
    COUNT(*)
FROM Iscrizioni

UNION ALL

SELECT 
    'Lezioni',
    COUNT(*)
FROM Lezioni

UNION ALL

SELECT 
    'Voti',
    COUNT(*)
FROM Voti;
------------------------------------------------------------------------------------------------------

-- 3 Restituire la somma totale dei crediti della tabella "Corsi"
SELECT  
    SUM(Crediti) AS [Totale Crediti]
    FROM Corsi;

-- 4 Restituire la media dei crediti 
SELECT  
    AVG(Crediti) AS [Media Crediti]
    FROM Corsi;
-- 4 Restituire la durata media
SELECT  
    AVG(Durata) AS [Durata media]
    FROM Corsi;

-- 5 Trovare il valore minimo dei crediti
SELECT  
    MIN(Crediti) AS [Valore Minimo dei Crediti]
    FROM Corsi;

-- 6 Trovare il valore massimo dei crediti
SELECT  
    Max(Crediti) AS [Valore Massimo dei Crediti]
    FROM Corsi;
------------------------------------------------------------------------
/*  
    GROUP BY 
    Il "GROUP BY" serve per raggruppare i record.
    Per esempio , vogliamo sapere quanti docenti abbiamo per specializzazione
*/ 
  SELECT 
      Specializzazione, 
      COUNT(*) AS [Totale Docenti] 
  FROM Docenti
  GROUP BY Specializzazione;


-- 8 Lista totale dei docenti che hanno la specializzazione 
-- che iniziano con la lettera "D"

         
   SELECT
	 Nome + ' ' + Cognome AS [Nome Completo],
	 Specializzazione,
	COUNT(*) AS 'Totale Docenti'
   FROM Docenti
   WHERE Specializzazione LIKE 'D%'
   GROUP BY  Nome, Cognome, Specializzazione
   ORDER BY Specializzazione ASC; 

-- 9 HAVING 
-- HAVING serve per filtrare i gruppi con GROUP BY
-- Esempio  1:
  
-- Mostra solamente le specializzazione che hanno almeno 3

  SELECT 
      Specializzazione, 
      COUNT(*) AS [Totale Docenti]
  FROM Docenti
  GROUP BY Specializzazione
  HAVING COUNT(*) >= 3;

  /*
     Differenza fondamentale
     WHERE:filtra le righe del raggruppamento

     HAVING:filtra i gruppi dopo il raggruppamento

     Shema:
           SELECT
               *....
                ...
                ..
                .
           FROM
           WHERE
           GROUP BY
           HAVING
               (SELECT
               ORDER BY)
*/

-- Primo Report completo
-- Anna          Edith            Giovanni        Ale              Bayo
-- Totale Corsi, Media dei crediti, Somma crediti, credito Minimo  e Massimo

-- Funzione 
SELECT 
     COUNT(*) AS [Totale Corso],
     AVG(Crediti) AS [Media dei crediti],
     SUM(Crediti) AS [Somma dei crediti],
     MIN(Crediti) AS [Minimo dei crediti],
     MAX(Crediti) AS [Credito Massimo]
FROM Corsi;
    