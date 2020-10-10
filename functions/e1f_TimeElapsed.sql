SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PaF
-- Create date: 2020-10-10
-- Description: Returns a textual representation of the difference in time
-- =============================================
CREATE FUNCTION [dbo].[e1f_TimeElapsed] 
    (
        @From DATETIME
    )
    RETURNS NVARCHAR(100)
    AS
    BEGIN

    RETURN 
    (
        SELECT TIME_ELAPSED = 
            CASE
                WHEN @From IS NULL THEN NULL
				WHEN MINUTES_AGO < 5 THEN 'teraz'
                WHEN MINUTES_AGO < 60 THEN CONCAT('pred ', MINUTES_AGO, ' minútami')
				WHEN HOURS_AGO < 2 THEN 'pred hodinou'
                WHEN HOURS_AGO < 24 THEN CONCAT('pred ', HOURS_AGO, ' hodinami')
				WHEN DAYS_AGO < 2 THEN CONCAT('pred ', DAYS_AGO, ' dòom')
                WHEN DAYS_AGO < 365 THEN CONCAT(DAYS_AGO, ' days ago')
				WHEN YEARS_AGO < 2 THEN 'pred rokom'
                ELSE CONCAT('pred ', YEARS_AGO, ' rokmi') END
        FROM ( SELECT MINUTES_AGO = DATEDIFF(MINUTE, @From, GETDATE()) ) TIMESPAN_MIN
        CROSS APPLY ( SELECT HOURS_AGO = DATEDIFF(HOUR, @From, GETDATE()) ) TIMESPAN_HOUR
        CROSS APPLY ( SELECT DAYS_AGO = DATEDIFF(DAY, @From, GETDATE()) ) TIMESPAN_DAY
        CROSS APPLY ( SELECT YEARS_AGO = DATEDIFF(YEAR, @From, GETDATE()) ) TIMESPAN_YEAR
    )
    END

/*
Usage:
SELECT [dbo].[e1f_TimeElapsed]('2019-10-09 16:00')
*/

