WITH DayBase AS
(
	SELECT 
	  Seq
	, Date = DATEADD(DAY, Seq, CONVERT(DATE, '2019-01-01'))
	 FROM SeqF(0,365)
)
, Src AS
(
	SELECT
	  d.*
	, Year = DATEPART(YEAR, d.Date)
	, Month = DATEPART(MONTH, d.Date)
	, MonthName = DATENAME(MONTH, d.Date)
	, Day = DATEPART(DAY, d.Date)
	, Weekday = DATEPART(WEEKDAY, d.Date)
	, WeekDayName = DATENAME(WEEKDAY, d.Date)
	, EndOfMonth = EOMONTH(d.Date)
	FROM DayBase d
)
SELECT * 
FROM Src s
WHERE s.Year = 2019
ORDER BY Seq 
