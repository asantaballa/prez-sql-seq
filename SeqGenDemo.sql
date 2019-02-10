WITH Base AS
(
	SELECT 
	  Seq
	, Date = DATEADD(DAY, Seq, CONVERT(DATE, '2019-01-01'))
	 FROM Seq(0,366)
)
, Src AS
(
	SELECT
	  b.*
	, Year = DATEPART(YEAR, b.Date)
	, Month = DATEPART(MONTH, b.Date)
	, MonthName = DATENAME(MONTH, b.Date)
	, Day = DATEPART(DAY, b.Date)
	, Weekday = DATEPART(WEEKDAY, b.Date)
	, WeekDayName = DATENAME(WEEKDAY, b.Date)
	FROM Base b
)
SELECT * 
FROM Src s
WHERE s.Year = 2019
ORDER BY Seq 
