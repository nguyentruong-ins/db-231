-- Get Total Revenue in 1 Store in a period of time --

ALTER FUNCTION dbo.GetTotalRevenue(
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

DECLARE @result MONEY;
SET @result = dbo.GetTotalRevenue(2, '2023-11-08', '2023-11-11');
SELECT @result AS TotalRevenue;

------------------------------------------------------------------------------

-- Get best seller online and best seller at table in a period of time -- 


ALTER FUNCTION GetBestSellers(
    @start_date datetime2,
    @end_date datetime2
)
RETURNS @BestSellers TABLE (
    best_seller_online NVARCHAR(255),
    best_seller_at_table NVARCHAR(255)
)
AS
BEGIN
    IF @start_date IS NOT NULL AND @end_date IS NOT NULL AND @start_date <= @end_date
    BEGIN
        INSERT INTO @BestSellers
        SELECT
            (SELECT TOP 1
                items.item_name
            FROM
                online_orders
                JOIN order_items ON online_orders.order_id = order_items.order_id
                JOIN items ON order_items.item_id = items.id
            WHERE
                online_orders.predicted_arrived_time BETWEEN @start_date AND @end_date
            GROUP BY
                items.item_name
            ORDER BY
                COUNT(order_items.item_id) DESC) AS best_seller_online,
            
            (SELECT TOP 1
                items.item_name
            FROM
                orders
                JOIN directly_orders ON orders.id = directly_orders.order_id
                JOIN order_items ON orders.id = order_items.order_id
                JOIN items ON order_items.item_id = items.id
            WHERE
                orders.ordered_at BETWEEN @start_date AND @end_date
            GROUP BY
                items.item_name
            ORDER BY
                COUNT(order_items.item_id) DESC) AS best_seller_at_table;
    END

    RETURN;
END;

------------- TEST SQL ---------------

SELECT * FROM GetBestSellers('2023-11-08', '2023-11-11');
