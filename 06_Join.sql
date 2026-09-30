/*  JOIN / INNER JOIN
    LEFT JOIN <- Parte da sisitra
    RIGHT JOIN <- Parte da destra
    FULL JOIN
    -----------------------------------------------------------
    L'INNER JOIN — PERCHÉ SERVE?  serve per incollare due o piu  tabelle diverse quando hanno un'informazione in comune (un codice o un ID).
    Si scrive sempre usando due parole magiche che lavorano insieme:
    JOIN → Dice quale nuova tabella vuoi prendere.
    ON → È la regola del domino: dice che i due ID devono essere uguali per potersi incastrare.

    Fino a questo punto abbiamo lavorato principalmente con una tabella.

    Ma un database relazionale è composto da più tabelle collegate tra loro.

    Nel nostro database "ScuolaDb" abbiamo, per esempio:

     [ TABELLA s ]                   [ TABELLA i ]                   [ TABELLA c ]
   Studenti                       Iscrizioni                        Corsi
 ┌───────────┐                  ┌───────────┐                  ┌───────────┐
 │StudenteId │ ◄──────────────► │StudenteId │                  │           │
 │ Nome      │   (Ponte ON)     │           │                  │           │
 │ Cognome   │                  │ CorsoId   │ ◄──────────────► │ CorsoId   │
 └───────────┘                  └───────────┘   (Ponte ON)     │ NomeCorso │
                                                               └───────────┘
 🟢 Le scatole (s, i, c) sono gli Alias: i soprannomi corti che diamo alle tabelle per non scrivere nomi lunghi.
 ⚡ Le frecce rappresentano il comando ON: indicano i due bulloni identici che si incastrano tra loro.
 🚫 Regola d'oro: Non puoi saltare da Studenti a Corsi direttamente se non passi prima attraverso il ponte di Iscrizioni!

    Uno studente può essere iscritto a un corso.

    Per ottenere informazioni provenienti da più tabelle utilizziamo i JOIN.

    1. SELECT → "Cosa voglio vedere sullo schermo?
    "Qui elenchi solo i nomi delle colonne che ti interessano,separati da una virgola. 
    Visto che usiamo gli alias, ricordati di mettere la letterina davanti!
   
    s.Nome (il nome dello studente)
    c.NomeCorso (il nome del corso)
    a.NomeAula (il nome dell'aula)

    2. FROM → "Da quale foglio inizio a leggere?
    "Qui indichi la primissima tabella da cui parte tutto il tuo ragionamento.

    FROM Studenti AS s3. 

    JOIN ... ON → "Quali altri fogli devo attaccare a catena?
    "È il trenino che abbiamo costruito insieme, dove ogni vagone si attacca al precedente usando il bullone in comune.

Sintassi base della Join / INNER JOIN
unise 2 tabella che hanno qualcosa in comune

SELECT 
    t1. colonne1
    t1. colonne2
    t1. colonne3
    t2. colonne1
    ....
FROM tabella1 AS t1
INNER JOIN tabella AS t2
   ON Condizione (t1.id = t2.Id)

*/

-- Restituisce la lista degli studenti scritti
SELECT * FROM Studenti, Corsi, -- da non fare ⚠️⚠️⚠️

SELECT *
FROM Studenti as s
INNER JOIN Iscrizioni as i
   on s.StudenteId = i.StudenteId;

--Restituire  Nome completo
            -- Data Nascita
            -- Codice fiscale
            -- Data Iscrizione
SELECT 
    s.Nome + ' ' + s.Cognome as [Nome Completo],
    s.DataNascita as [Data di nascita],
    s.CodiceFiscale as CF,
    i.DataIscrizione as [Data Iscrizione]
FROM Studenti as s
INNER JOIN Iscrizioni as i
    On s.StudenteId = i.StudenteId;


-- Esempio 2
-- Restituisce la lista degli studenti iscritti ad un corso.
SELECT 
    s.Nome + ' ' + s.Cognome as [Nome Completo],
    s.DataNascita as [Data di nascita],
    s.CodiceFiscale as CF,
    i.DataIscrizione as [Data Iscrizione],
    c.NomeCorso + '-' + c.Descrizione as [Nome e descrizione del corso],
    c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
    On s.StudenteId = i.StudenteId
INNER JOIN Corsi AS c
    On i.CorsoId = c.CorsoId

-- Esempio 3:
-- Restituisce la lista degli studenti iscritti ad  un corso con la data di nascita null. 
-- (senza la data di nascita perche null significa che non è facoltativo invece NOT NULL è facoltativo CON )

SELECT 
    s.Nome + ' ' + s.Cognome as [Nome Completo],
    s.DataNascita as [Data di nascita],
    s.CodiceFiscale as CF,
    i.DataIscrizione as [Data Iscrizione],
    c.NomeCorso + '-' + c.Descrizione as [corso],
    c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
    On s.StudenteId = i.StudenteId
INNER JOIN Corsi AS c
    On i.CorsoId = c.CorsoId
   WHERE s.DataNascita IS  NULL;

/*
   Docenti, Corsi, Aule Lezioni
   Lezioni <-> Aule <- Corsi
   Iscrizioni <-> Studenti <- Corsi
   DocentiCorsi <- Docenti

   Restituire: 
         il nome dello studente,
         il corso,
         l'aula,
         Docente,
         lezione
*/

SELECT * From Studenti;
SELECT * From Iscrizioni;
SELECT * From Corsi;
SELECT * From DocentiCorso;
SELECT * From Docenti;
SELECT * From Lezioni;
SELECT * From Aule; 
    
-- -- 1. COSA VOGLIO VEDERE
Select DISTINCT
    s.Nome + ' ' + s.Cognome as [Nome Studente],
    s.DataNascita as [Data di nascita],
    s.CodiceFiscale as CF,
    i.DataIscrizione as [Data Iscrizione],
    c.NomeCorso + '-' + c.Descrizione as [corso],
    c.Durata,
    d.Nome + ' ' + d.Cognome as [Nome Docente],
    d.Specializzazione,
    a.NomeAula as [Nome Aula],
    a.Capacita as [Capacità]

-- -- 2. DA DOVE PARTO
from Studenti as s

-- -- 3. IL TRENINO DEI COLLEGAMENTI (JOIN)
JOIN Iscrizioni as i
    ON s.StudenteId = i.StudenteId
JOIN Corsi as c
    ON c.CorsoId = i.CorsoId
JOIN DocentiCorso as dc
    ON dc.CorsoId = c.CorsoId
JOIN Docenti as d
    ON d.DocenteId = dc.DocenteId
JOIN Lezioni as l
    ON c.CorsoId = l.CorsoId
JOIN Aule as a
    ON a.AulaId = l.AulaId;

---------------------------------------------------------------------
/* 
   LEFT JOIN
        Mostra i record della tabella sinistra
        anche se non esiste corristpondenza
        nella tabella destra.
*/

SELECT TOP 10 *
FROM Studenti as s
INNER JOIN Iscrizioni i
    ON i.StudenteId = s.StudenteId
WHERE DataNascita IS NOT NULL
    AND DataNascita >= '2000'
ORDER BY DataNascita asc
SELECT TOP 10 *
FROM Studenti as s
JOIN Iscrizioni i
    ON i.StudenteId = s.StudenteId
LEFT JOIN Corsi c
    ON i.CorsoId = c.CorsoId    
WHERE DataNascita IS NOT NULL
    AND DataNascita <> '2000'
ORDER BY DataNascita asc

-----------------------------------------------------------------------------------

 /*
   1. CONVERT: Cambia il tipo di dato di una colonna (ad esempio, trasforma un numero o una data in un testo).(VACHAR)
   2. ISNULL: Controlla se la colonna è vuota (NULL) e, in tal caso, la sostituisce con un valore predefinito 
      (ad esempio, un testo come "Nessun dato" o lo zero 0).

   Immaginiamo la tabella dei tuoi Studenti. 
   Alcuni ragazzi non hanno inserito la loro Data di Nascita (il campo è NULL). 
   Tu vuoi stampare la lista e, se manca la data, vuoi che appaia la scritta "Mancante".
*/

SELECT 
    Nome,
    ISNULL( CONVERT(varchar, DataNascita, 105), 'Mancante' ) AS DataDiNascita
FROM Studenti;

/*
 Come si legge questo codice dall'interno verso l'esterno:
 1. CONVERT(varchar, DataNascita, 105)
    Prende la data di nascita e la trasforma in un testo (varchar). Il numero 105 serve solo a dirgli di scriverla nello stile italiano,
    cioè GIORNO-MESE-ANNO (es. 29-09-2026).

2. ISNULL( ... , 'Mancante')
   Ora che la data è diventata un testo, il computer controlla: "La data c'è?". Se c'è, mostra la data convertita. 
   Se la data era vuota (NULL), la sostituisce con il testo 'Mancante'.
*/
-------------------------------------------------------------------------------------------------------------------------------------


SELECT 
    
    ISNULL(s.Nome + ' ' + s.Cognome, 'Studente non assegato') AS Studente, 
    ISNULL(CONVERT(VARCHAR, s.DataNascita, 105), 'N/D') AS [Data di Nascita],
    ISNULL(s.CodiceFiscale, 'CF00000') AS [CF],
    ISNULL(s.Email, 'Email non definito') AS [Email],
    ISNULL(s.Telefono, '000000') AS Telefono,
    ISNULL(CONVERT(VARCHAR, i.DataIscrizione, 105), 'N/D') AS [DataNascita],
    ISNULL(c.NomeCorso,'Non definito') AS [Nome Corso],
    ISNULL(c.Descrizione, ' Non definito') AS [Descrizione],
    ISNULL(c.Crediti, 00) AS Crediti,
    ISNULL(c.Durata, 0) AS Durata
FROM Studenti s 
LEFT JOIN Iscrizioni i
    On i.StudenteId = s.StudenteId
LEFT JOIN Corsi c
    On i.CorsoId = c.CorsoId
 

-----------------------------------------------------------------------------------
-- Le funzione ISNULL()nd restiuisce valore specifico se l'espressinone è null

-- ISNULL()

SELECT 
     Nome,
     Cognome,
     DataNascita
FROM Studenti
WHERE DataNascita is null;

-- Convert()
SELECT 
     Nome,
     Cognome,
     ISNULL(CONVERT(VARCHAR, DataNascita, 104), 'N /D') AS DataNascita
FROM Studenti
WHERE DataNascita is null;

-- 09:00:00.0000000 restituire la Ora 

--------------------------------------------------------------------------------------------
-- Le funzione ISNULL() restituisce valore specifito se l'espressione è null
-- Convert()
SELECT 
    Nome,
    Cognome,
    ISNULL(CONVERT(VARCHAR, DataNascita, 104), 'N/D') AS DataNascita 
FROM Studenti
where DataNascita is null;
SELECT 
    Nome,
    Cognome,
    DataNascita 
FROM Studenti
where DataNascita is null;
SELECT 
    Titolo + ' ' + Descrizione AS [Materia],
    --ISNULL(LEFT(CONVERT(VARCHAR, OraInizio, 108), 2), 'N/D') as Ora,
    ISNULL(LEFT(CONVERT(VARCHAR, OraInizio, 108), 5), 'N/D') as Minuti,
    ISNULL(DATEPART(HOUR, OraInizio), 2) AS Ora,
    DATEPART(MINUTE, OraInizio) AS Minuti
FROM Lezioni;
SELECT 
    Titolo + ' ' + Descrizione AS [Materia],
    'la lezione inizia alle ' +
    CAST(DATEPART(HOUR, OraInizio) AS nvarchar(2)) + ':' + 
    RIGHT('0' + CAST(DATEPART(MINUTE, OraInizio) as nvarchar(2)), 2 ) as Orario
FROM Lezioni;
-- 108 => 09:00
SELECT
    Titolo + ' ' + Descrizione AS [Materia],
    'la lezione inizia alle ' +
    ISNULL(CONVERT(VARCHAR(5), OraInizio, 108), 'N/D') AS Ora
FROM Lezioni;



