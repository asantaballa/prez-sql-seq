DROP SEQUENCE dbo.CountBy1 ; 
GO

CREATE SEQUENCE dbo.CountBy1  
    START WITH 1  
    INCREMENT BY 1 ;  
GO  

SELECT NEXT VALUE FOR dbo.CountBy1 AS Seq; 

DROP TABLE #Temp

INSERT INTO #Temp
SELECT
  NEXT VALUE FOR dbo.CountBy1 AS Seq


  

