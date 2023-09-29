SET NOCOUNT ON

TRUNCATE TABLE DIM_Date

DECLARE @CurrentDate DATE = '2019-01-01'
DECLARE @EndDate DATE = '2030-12-31'

WHILE @CurrentDate < @EndDate
BEGIN
   INSERT INTO [dbo].[Dim_Date] (
      [DateKey],
      [Date],
      [Day],
      [DayOfYear],
      [Month],
      [MonthName],
      [Year],
      [MMYYYY],
      [MonthYear]
      )
   SELECT DateKey = YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 + DAY(@CurrentDate),
      DATE = @CurrentDate,
      Day = DAY(@CurrentDate),
      [DayOfYear] = DATENAME(dy, @CurrentDate),
      [Month] = MONTH(@CurrentDate),
      [MonthName] = DATENAME(mm, @CurrentDate),
      [Year] = YEAR(@CurrentDate),
      [MMYYYY] = RIGHT('0' + CAST(MONTH(@CurrentDate) AS VARCHAR(2)), 2) + CAST(YEAR(@CurrentDate) AS VARCHAR(4)),
      [MonthYear] = CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + UPPER(LEFT(DATENAME(mm, @CurrentDate), 3))

   SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END
