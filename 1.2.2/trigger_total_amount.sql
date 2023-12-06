--Trigger groups update [orders]
--1. total_amount
CREATE OR ALTER TRIGGER UpdateTotalAmount
ON dbo.order_items
FOR INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Add item
    IF (SELECT COUNT(*) FROM INSERTED) > 0
    BEGIN
        UPDATE dbo.orders
        SET total_amount = total_amount + 
                          (SELECT SUM(actual_price * quantity) FROM INSERTED)
        WHERE id IN (SELECT order_id FROM INSERTED);
		PRINT('Order updated up');
    END

    -- Delete item
    IF (SELECT COUNT(*) FROM DELETED) > 0
    BEGIN
        UPDATE dbo.orders
        SET total_amount = total_amount - 
                          (SELECT SUM(actual_price * quantity) FROM DELETED)
        WHERE id IN (SELECT order_id FROM DELETED);
		PRINT('Order updated down');
    END
END;

-- --Test trigger
-- --Order
-- INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (0, 0, 0, '11-10-2023');
-- INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (0, 0, 0, '11-15-2023');


-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)
-- 				VALUES		(10, 2, 50000, 4);
-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)
-- 				VALUES		(10, 25, 50000, 1);
-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)
-- 				VALUES		(11, 18, 45000, 1);
-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)
-- 				VALUES		(11, 19, 45000, 2);

-- DELETE FROM order_items WHERE order_id = 10 AND item_id = 2