CREATE OR ALTER PROCEDURE GetTopCustomersWithLargestOrders
    @startDate DATETIME2,
    @endDate DATETIME2,
    @numberOfCustomers INT
AS
BEGIN
    WITH OrderedCustomers AS (
        SELECT TOP (@numberOfCustomers)
            c.id AS customer_id,
            c.first_name,
            c.last_name,
            c.phone_number,
            SUM(o.total_amount) AS total_order_amount
        FROM
            customers c
            JOIN directly_orders do ON c.id = do.customer_id
            JOIN orders o ON do.order_id = o.id
        WHERE
            o.ordered_at >= @startDate AND o.ordered_at <= @endDate
        GROUP BY
            c.id, c.first_name, c.last_name, c.phone_number

        UNION ALL

        SELECT TOP (@numberOfCustomers)
            c.id AS customer_id,
            c.first_name,
            c.last_name,
            c.phone_number,
            SUM(o.total_amount) AS total_order_amount
        FROM
            customers c
            JOIN customer_accounts ca ON c.id = ca.customer_id
            JOIN online_orders oo ON (ca.username = oo.customer_account_username)
            JOIN orders o ON oo.order_id = o.id
        WHERE
            o.ordered_at >= @startDate AND o.ordered_at <= @endDate
        GROUP BY
            c.id, c.first_name, c.last_name, c.phone_number
    )

    SELECT 
		customer_id,
		first_name,
		last_name,
		phone_number,
		SUM(total_order_amount) AS total_order_amount
    FROM OrderedCustomers
	GROUP BY customer_id, first_name, last_name, phone_number
    ORDER BY total_order_amount DESC;
END;
