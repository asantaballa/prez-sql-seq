USE Demo01
GO

IF OBJECT_ID('dbo.SeqT', 'U') IS NOT NULL DROP TABLE dbo.SeqT; 

CREATE TABLE SeqT
(
  Seq INT IDENTITY(1,1)
)

DECLARE @i INT = 1
WHILE @i <= 1000
BEGIN
	INSERT INTO SeqT DEFAULT VALUES
	SET @i = @i + 1
END

SELECT Seq FROM SeqT -- "where ..."
