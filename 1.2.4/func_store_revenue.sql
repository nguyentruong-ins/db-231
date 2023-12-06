-- Get Total Revenue in 1 Store in a period of time --
CREATE OR ALTER FUNCTION dbo.GetTotalRevenue(
    @storeID INT,
    @startDate DATE,
    @endDate DATE
)
RETURNS MONEY
AS
BEGIN
    DECLARE @totalRevenue MONEY;

    IF @storeID IS NULL OR @startDate IS NULL OR @endDate IS NULL OR @startDate > @endDate
    BEGIN
        RETURN NULL;
    END

    SELECT @totalRevenue = ISNULL(SUM(o.total_amount), 0)
    FROM orders o
    WHERE o.ordered_at BETWEEN @startDate AND @endDate
        AND (
            EXISTS (
                SELECT 1
                FROM directly_orders do
                WHERE do.order_id = o.id
                    AND do.export_emp_username IN (
                        SELECT ea.username
                        FROM employee_accounts ea
                        WHERE ea.store_id = @storeID
                    )
            )
            OR EXISTS (
                SELECT 1
                FROM online_orders oo
                INNER JOIN customer_accounts ca ON oo.customer_account_username = ca.username
                WHERE oo.order_id = o.id
                    AND oo.export_employee_username IN (
                        SELECT ea.username
                        FROM employee_accounts ea
                        WHERE ea.store_id = @storeID
                    )
            )
        );

    RETURN @totalRevenue;
END;

------------- TEST SQL ---------------

-- DECLARE @result MONEY;
-- SET @result = dbo.GetTotalRevenue(2, '2023-11-08', '2023-11-11');
-- SELECT @result AS TotalRevenue;

------------------------------------------------------------------------------