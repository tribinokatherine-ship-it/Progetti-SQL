/*
    Operatori principali in  sql server.
        =        Uguale
        <> / !=  Diverso da
        <        Minore
        >        Maggiore
        <=       Minore uguale
        >=       Maggiore uguale

*/ 
 SELECT * FROM Studenti;
-- 1 UGUALE:
-- Questa riga restituisce solo lo studente con Id (4)
SELECT
    StudenteId,
    Nome 
    Cognome,
    Email
FROM Studenti
WHERE StudenteId = 4;

-- 2 DIVERSO:
-- Restituire tutti gli studenti trane con Id (5)
SELECT 
    StudenteId,
    Nome, 
    Cognome,
    Email
FROM Studenti
WHERE StudenteId <> 5;

-- MAGGIORE >
-- Restituire i corsi che hanno più di 5 crediti
SELECT DISTINCT  
    NomeCorso, 
    Descrizione,
    Crediti
FROM Corsi WHERE Crediti > 5;
    


-- MINORE <
-- Restituire i corsi che hanno meno di < 5 crediti
SELECT DISTINCT 
     NomeCorso,
     Descrizione,
     Crediti
FROM Corsi 
WHERE Crediti <5;


-- MAGGIORE O UGUALE >=
-- Restituire i corsi con almeno 5 crediti
SELECT DISTINCT  
    NomeCorso, 
    Descrizione,
    Crediti
FROM Corsi WHERE Crediti >= 5;

-- MINORE O UGUALE <=
-- Restituire i corsi con almeno 5 crediti
SELECT DISTINCT  
    NomeCorso, 
    Descrizione,
    Crediti
FROM Corsi WHERE Crediti <= 5;

/*
    AND significa (E)
    Tutte le condizione devono essere vere.
*/

/*
    Restituire la lista dei corsi con almeno 5 crediti
    e durata maggiore di 50 ore
*/
SELECT DISTINCT 
    NomeCorso, 
    Descrizione,
    Crediti,
    Durata
FROM Corsi
WHERE Crediti >= 5 AND Durata > 50;

/*
    OR significa "OPPURE"
    è sufficente che una delle condizione sia vera🤨
*/
-- Restituire la lista dei corsi che con 5 crediti
-- oppure corsi con 3 crediti
SELECT DISTINCT 
    NomeCorso, 
    Descrizione,
    Crediti,
    Durata
FROM Corsi
WHERE Crediti = 5 OR Crediti = 3 ;


/*===================================
   9 FILTRO DEGLI STUDENTI PER NOME
  ===================================*/
SELECT * FROM Studenti WHERE Nome = 'Anna';

/*===================================
   9 FILTRO DEGLI STUDENTI PER COGNOME
  ===================================*/
SELECT * FROM Studenti WHERE Cognome = 'Rossi';

/*===================================
   9 CONDIZIONE SU UNA DATA
  ===================================*/
SELECT 
    Nome +' '+ Cognome AS [Nome Completo],
    DataNascita,
    Email
FROM Studenti
WHERE DataNascita > '2002'
ORDER BY [Nome Completo] ASC;

/* ============================================================
   12. AND CON LE DATE
    Esercizio 1:
        Restituire la lista degli Studenti 
        nati tra il 2001 e il 2002
   ============================================================ */
   
   SELECT 
        Nome +' '+ Cognome AS NomeCompleto,
        DataNascita
   FROM  Studenti
   WHERE DataNascita >= '2001-01-01'
   AND DataNascita <= '2002-01-01';
    

-- 13 LIMIT IN SQL SERVER (TOP)
SELECT TOP 10 *
    FROM Studenti;

-- 14 TOP 10 CON IS NULL E NOT NULL 
SELECT TOP 10 *
    FROM Studenti
    WHERE DataNascita IS NOT NULL;
-- Possiamo  aggiungere anche AND e ORDER BY (Ordinare), asc dalla A->Z 
SELECT TOP 10 *
    FROM Studenti
    WHERE DataNascita IS NOT NULL
         AND DataNascita >= '2000'
         ORDER BY DataNascita ASC



-- 15 LISTE INT SQL SERVER IN(...)
-- IN = Restituisce gli elemtnti di una lista 
SELECT * FROM Corsi
    WHERE Crediti IN (6,5);

SELECT TOP 10 * FROM Corsi
    WHERE Crediti IN (6,5)
    ORDER BY Crediti ASC;


SELECT TOP 10 * FROM Corsi
    WHERE Crediti IN (6,5)
    ORDER BY NomeCorso ASC;

/*
    16 BETWEEN:

    Permette di verificare se un valore
    si trova all'interno di un intervallo.

    Sintassi:
    SELECT * FROM <TABELLA>

    WHERE colonna BETWEEN valore Minimo(<) AND valore Massimo(>)
*/
-- Corsi con una durata compresa tra 30 e 50 ore
  
   SELECT DISTINCT TOP 5
       NomeCorso AS [Nome del corso],
       Descrizione,
       Durata
   FROM Corsi
   WHERE Durata BETWEEN 30 AND 50;

-- 17 Restituisce la lista dei 5 Corsi con una durata compresa tra 30 e 50 ore
    SELECT DISTINCT TOP 5
       NomeCorso AS [Nome del corso],
       Descrizione,
       Durata
   FROM Corsi
   WHERE Durata BETWEEN 30 AND 50
   ORDER BY [Nome del corso] ASC;

-- 18  Restituire la lista degli studenti nati tra l'anno 2000 e 2002-12-31 
-- campi da visualizzare: Nome Completo , Data di Nascita
  
  SELECT Nome + ' ' + Cognome AS [Nome Completo],
         DataNascita AS [Data di Nascita 💗]
    FROM Studenti
    WHERE DataNascita BETWEEN '2000' AND '2002-12-31'
    ORDER BY DataNascita ASC;

-- 19 Confronto tra OR e IN 
    SELECT *
    FROM Corsi
    WHERE Crediti = 3
        OR Crediti = 5
        OR Crediti = 6

    SELECT *
    FROM Corsi
    WHERE Crediti IN (3, 5, 6);


    SELECT *
    FROM Corsi
    WHERE Crediti NOT IN (6, 3, 5);

/*  
    20 LIKE 
         A% =   Trova tutte le parole che INIZIANO con la lettera "A"
         %O =   Trova tutte le parole che TERMINANO con la lettera "O"
        %U% =   Trova tutte le parole che CONTENGONO una lettera "U"


         Esempio 1:
              Restituire la lista dei corsi che comincia con la lettera "P"

*/

    SELECT DISTINCT 
        NomeCorso,
        Descrizione,
        Durata
    FROM Corsi
    WHERE NomeCorso LIKE 'P%';


                
                
                
        
               
     

        
          

     
     
    
    
       
   
           
          
        