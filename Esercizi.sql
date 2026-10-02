/* Esercizio 1
    Restituire i voti medi degli studenti 
    Campi da visulizzare:
        Nome Completo dello studente
        CF
        il voto
*/

SELECT 
    s.Nome + ' ' + s.Cognome as [Nome Completo Studente],
    s.CodiceFiscale as  [CF],
    AVG(v.Voto) as [Voto Medio]
FROM Studenti s
     JOIN Voti v
        ON s.StudenteId = v.StudenteId
GROUP BY s.Nome, s.Cognome, s.CodiceFiscale;



-- CONCAT()
SELECT 
   CONCAT(s.Nome , ' ' , s.Cognome) as 'Nome Completo dello Studente',
   s.CodiceFiscale as  CF,
   CAST(AVG(v.Voto) as INT) as 'Voto medio'  -- CAST(INT) CONVERTE DA DECIMALE IN INTERO
FROM Studenti s
     JOIN Voti v
        ON s.StudenteId = v.StudenteId
GROUP BY s.Nome, s.Cognome, s.CodiceFiscale;
-------------------------------------------------------
-- Questo è per capire come sono collegare le nostre tabelle

Select * from Studenti;
Select * from Iscrizioni; 
Select * from Corsi;
Select * from DocentiCorso;
Select * from Docenti;
Select * from Lezioni;
Select * from Aule;

Docenti, Corsi, Aule Lezioni
Lezioni <-> Aule <-Corsi
Iscrizioni <-> Studenti <- Corsi
DocentiCorsi <- Docenti

 -- Esercizio 2


/*
	Restituire la lista degli studenti iscritti ad un corso SENZA la data di nascita, 
	mostrando:
		Nome completo
		Data di nascita (rinominata)
		Codice Fiscale
		Corso
		Voto
		Docente
		Aula
*/
SELECT 
    CONCAT(s.Nome, ' ', s.Cognome) AS NomeCompleto,
    ISNULL(CONVERT(VARCHAR(10), s.DataNascita, 120), 'Non registrata') AS Data_di_Nascita,
    s.CodiceFiscale AS CF,
    c.NomeCorso AS Corso,
    CAST(AVG(v.Voto) AS INT) AS Voto,
    CONCAT(d.Nome, ' ', d.Cognome) AS Docente,
    a.NomeAula AS Aula
FROM Studenti s
JOIN Iscrizioni i 
    ON s.StudenteId = i.StudenteId
JOIN Corsi c 
    ON i.CorsoId = c.CorsoId
JOIN Voti v 
    ON s.StudenteId = v.StudenteId 
    AND c.CorsoId = v.CorsoId
JOIN DocentiCorso dc 
    ON c.CorsoId = dc.CorsoId
JOIN Docenti d 
    ON dc.DocenteId = d.DocenteId
JOIN Lezioni l 
    ON c.CorsoId = l.CorsoId
JOIN Aule a 
    ON l.AulaId = a.AulaId
WHERE s.DataNascita IS NULL
GROUP BY s.Nome, s.Cognome, s.DataNascita, s.CodiceFiscale, c.NomeCorso, d.Nome, d.Cognome, a.NomeAula;


-- Esercizio 3

/* 
   1 Mostrare gli studenti che hanno preso un voto maggiore o uguale a 28 in qualsiasi corso.

   2 Mostrare gli studenti che non sono iscritti a nessun corso.

   3 Mostrare i corsi che non hanno studenti iscritti.

   4 Con Full JOIN  Mostrare studenti e voti, anche se non corrispondono

*/ 
 --1.

 SELECT s.StudenteId, s.Nome, s.Cognome, s.DataNascita, s.Email, s.Telefono, s.CodiceFiscale
FROM Studenti s
     JOIN Voti v 
     ON s.StudenteId = v.StudenteId
WHERE v.Voto >= 28
ORDER BY v.Voto DESC, s.Cognome ASC; -- Prima i voti alti, poi ordine alfabetico


---1 Con DISTINCT 
SELECT DISTINCT s.StudenteId, s.Nome, s.Cognome, s.DataNascita, s.Email, s.Telefono, s.CodiceFiscale
FROM Studenti s
     JOIN Voti v 
     ON s.StudenteId = v.StudenteId
WHERE v.Voto >= 28
ORDER BY s.StudenteId ASC; -- Ordina semplicemente per l'identificativo univoco dello studente


---2
SELECT s.StudenteId, s.Nome, s.Cognome, s.DataNascita, s.Email, s.Telefono, s.CodiceFiscale
FROM Studenti s
     LEFT JOIN Iscrizioni i 
     ON s.StudenteId = i.StudenteId
WHERE i.StudenteId IS NULL
ORDER BY s.Cognome ASC, s.Nome ASC; -- Dalla A alla Z


---3
SELECT c.CorsoId, c.NomeCorso, c.Descrizione, c.Crediti, c.Durata
FROM Corsi c
     JOIN Iscrizioni i
     ON c.CorsoId = i.CorsoId
     WHERE i.CorsoId IS NULL
     ORDER BY c.NomeCorso ASC; -- Dalla A alla Z per nome del corso

---4
SELECt  s.StudenteId, s.Nome, s.Cognome, v.CorsoId, v.Voto
FROM Studenti s
FULL OUTER JOIN Voti v
           ON s.StudenteId = v.StudenteId
           ORDER BY v.Voto DESC; -- Dal voto più alto al più basso, con i NULL alla fine
    
    


