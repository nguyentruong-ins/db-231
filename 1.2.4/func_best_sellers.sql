-- Get best seller online and best seller at table in a period of time -- 
CREATE OR ALTER FUNCTION GetBestSellers(
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

-- SELECT * FROM GetBestSellers('2023-11-08', '2023-11-11');
