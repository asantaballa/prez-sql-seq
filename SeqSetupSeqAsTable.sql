IF OBJECT_ID('dbo.Seq', 'U') IS NOT NULL DROP TABLE dbo.Seq; 

CREATE TABLE Seq
(
  Seq INT IDENTITY(1,1)
)

DECLARE @i INT = 1
WHILE @i <= 1000
BEGIN
	INSERT INTO Seq DEFAULT VALUES
	SET @i = @i + 1
END

SELECT * FROM Seq
