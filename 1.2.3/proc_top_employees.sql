CREATE OR ALTER PROCEDURE GetTopSellingEmployees
    @startDate DATETIME2,
    @endDate DATETIME2,
    @numberOfEmployees INT
AS
BEGIN
    WITH OrderedEmployees AS (
        SELECT TOP (@numberOfEmployees)
            ea.id AS employee_id,
            ea.first_name,
            ea.last_name,
            ea.username,
            SUM(oi.actual_price * oi.quantity) AS total_sales
        FROM
            employee_accounts ea
            JOIN employee_shifts es ON ea.username = es.username
            JOIN shifts s ON es.shift_id = s.id
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
            ea.id, ea.first_name, ea.last_name, ea.username
        ORDER BY
            total_sales DESC
    )

    SELECT *
    FROM OrderedEmployees;
END;

-- EXEC GetTopSellingEmployees '2023-01-01', '2023-12-31', 10;
