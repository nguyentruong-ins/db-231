CREATE OR ALTER PROCEDURE GetTopSellingShifts
    @startDate DATETIME2,
    @endDate DATETIME2,
    @numberOfShifts
 INT
AS
BEGIN
    WITH OrderedShifts
 AS (
        SELECT TOP (@numberOfShifts
    )
            s.id,
			s.started_at,
			s.ended_at,
			s.day,
			s."month",
			s."year",
            SUM(oi.actual_price * oi.quantity) AS total_sales
        FROM
            shifts s
            JOIN orders o ON 
				-- Check where order is on employees' shift
				s."month" = MONTH(o.ordered_at) 
				AND s."year" = YEAR(o.ordered_at) 
				AND s.day = DAY(o.ordered_at)
				AND CAST(o.ordered_at AS TIME) BETWEEN s.started_at AND s.ended_at
            JOIN order_items oi ON o.id = oi.order_id
        WHERE
            o.ordered_at >= @startDate AND o.ordered_at <= @endDate
        GROUP BY
			s.id, s.started_at, s.ended_at, s.day, s."month", s."year"
		ORDER BY
            total_sales DESC
    )

    SELECT *
    FROM OrderedShifts;
END;

-- EXEC GetTopSellingShifts '2023-01-01', '2023-12-31', 10;