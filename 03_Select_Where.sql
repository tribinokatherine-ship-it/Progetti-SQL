 USE ScuolaDB;
 GO

 -- Primo passo con select
 SELECT * FROM Studenti;
 -- Secondo passo con 'SELECT'
 /* 
     Esempio:
         select
            colonna1,
            colonna2,
            ...
         from tabella

*/
  SELECT  Nome,
          Cognome,  
          CodiceFiscale  
  FROM Studenti 
  
 -- Concatenazione di due colonne (+)   
 -- Alias = AS per definire il nome di una colonna

 --Esempio 1
  SELECT 
      Nome + '  ' + Cognome AS NomeCompleto,   
      CodiceFiscale
          
  FROM Studenti;  

-- Esenpio 2
  SELECT  
      Nome + '  ' + Cognome AS 'NomeCompleto',  
      CodiceFiscale  
  FROM Studenti;  

-- Esempio 3
  SELECT 
      Nome + '  ' + Cognome AS [NomeCompleto],  
      CodiceFiscale  AS [CF]
  FROM Studenti; 


 SELECT * FROM Studenti; 

 -- WHERE filtra a secondo le condizione
 -- Eseempio1
  SELECT  Nome + '  ' + Cognome AS 'NomeCompleto',  
          CodiceFiscale
          DataNascita
  FROM Studenti;  

  -- IS NULL / IS NOT NULL CON IL FILTRO Where
  SELECT  Nome + '  ' + Cognome AS 'NomeCompleto',  
          CodiceFiscale
          DataNascita
   FROM Studenti 
   WHERE DataNascita IS NOT NULL;

  /*
       Restituire la lista degli studenti
       che  hanno la data di nascita.


       Campi da visualizzare: 
           Nomecompleto dello studente,
           Email,
           Dta di nascita,
           Codice fiscale

*/

SELECT
    Nome + ' ' + Cognome AS [Nome completo dello studente]
    Email,
    DataNascita,
    CodiceFiscale
FROM Studenti 
WHERE DataNascita IS NULL;

-- ORDER ordina le colonne DESC / ASC 

 
 SELECT 

    Nome + ' ' + Cognome AS [Nome completo dello studente],
    Email,
    DataNascita,
    CodiceFiscale
FROM Studenti
WHERE DataNascita IS NULL
ORDER BY [Nome completo dello studente] ASC;


SELECT 

    Nome + ' ' + Cognome AS [Nome completo dello studente],
    Email,
    DataNascita,
    CodiceFiscale
FROM Studenti
WHERE DataNascita IS NULL
ORDER BY [Nome completo dello studente] DESC;



   

           