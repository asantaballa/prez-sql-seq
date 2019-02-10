# To Do

- [ ] Rename functions to TSeq
- [ ] Write the procedural version
- [ ] Write the CTE version
- [ ] Update github to have presentation as website

# Overall flow

* Discuss where need sequence
  * Real examples
    * Generating date table
  * But mention that am looking at pretty general solution, not just date table.
* Example: Using sequences
* Example: Using digits
* Example: Using systables + ranking function
* == Other ==
* Show as basis for date range function
* Talk about performance


-- Things in date table --

https://www.mssqltips.com/sqlservertip/4054/creating-a-date-dimension-or-calendar-table-in-sql-server/

```
CREATE TABLE dbo.DateDimension
(
  --DateKey           INT         NOT NULL PRIMARY KEY,
  [Date]              DATE        NOT NULL,
  [Day]               TINYINT     NOT NULL,
  DaySuffix           CHAR(2)     NOT NULL,
  [Weekday]           TINYINT     NOT NULL,
  WeekDayName         VARCHAR(10) NOT NULL,
  IsWeekend           BIT         NOT NULL,
  IsHoliday           BIT         NOT NULL,
  HolidayText         VARCHAR(64) SPARSE,
  DOWInMonth          TINYINT     NOT NULL,
  [DayOfYear]         SMALLINT    NOT NULL,
  WeekOfMonth         TINYINT     NOT NULL,
  WeekOfYear          TINYINT     NOT NULL,
  ISOWeekOfYear       TINYINT     NOT NULL,
  [Month]             TINYINT     NOT NULL,
  [MonthName]         VARCHAR(10) NOT NULL,
  [Quarter]           TINYINT     NOT NULL,
  QuarterName         VARCHAR(6)  NOT NULL,
  [Year]              INT         NOT NULL,
  MMYYYY              CHAR(6)     NOT NULL,
  MonthYear           CHAR(7)     NOT NULL,
  FirstDayOfMonth     DATE        NOT NULL,
  LastDayOfMonth      DATE        NOT NULL,
  FirstDayOfQuarter   DATE        NOT NULL,
  LastDayOfQuarter    DATE        NOT NULL,
  FirstDayOfYear      DATE        NOT NULL,
  LastDayOfYear       DATE        NOT NULL,
  FirstDayOfNextMonth DATE        NOT NULL,
  FirstDayOfNextYear  DATE        NOT NULL
);
GO
```

-- Weird variation on the digits approch --
```
INSERT #dim([date]) 
SELECT d
FROM
(
  SELECT d = DATEADD(DAY, rn - 1, @StartDate)
  FROM 
  (
    SELECT TOP (DATEDIFF(DAY, @StartDate, @CutoffDate)) 
      rn = ROW_NUMBER() OVER (ORDER BY s1.[object_id])
    FROM sys.all_objects AS s1
    CROSS JOIN sys.all_objects AS s2
    -- on my system this would support > 5 million days
    ORDER BY s1.[object_id]
  ) AS x
) AS y;
```
