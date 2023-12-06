--2. discount_amount_by_membership
CREATE OR ALTER TRIGGER UpdateDiscountByMembership
ON dbo.orders
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF (SELECT COUNT(*) FROM INSERTED) > 0
    BEGIN
        UPDATE dbo.orders
        SET discount_amount_by_membership = inserted.total_amount * 
                                            (SELECT discount_percent 
                                            FROM dbo.memberships m
                                            WHERE m.id = 
                                                CASE 
                                                    WHEN EXISTS (SELECT 1 FROM directly_orders d WHERE d.order_id = o.id)
                                                    THEN (SELECT membership_id FROM customers c WHERE c.id = (SELECT customer_id FROM directly_orders d WHERE d.order_id = o.id))
                                                    ELSE (SELECT membership_id FROM customers c WHERE c.id = (SELECT customer_id FROM customer_accounts n WHERE n.username = (SELECT customer_account_username FROM online_orders n WHERE n.order_id = o.id)))
                                                END
                                            ) / 100
        FROM orders o, INSERTED
        WHERE o.id = INSERTED.id;
		PRINT('discount_amount_by_membership changed');
    END
END;


--Test trigger
-- insert into customers (sex, first_name, last_name, phone_number, membership_id) values ('OTHER', 'SIUUUUUU', 'UUUUUUUU','2525252525', 3);
-- insert into customers (sex, first_name, last_name, phone_number, membership_id) values ('MALE', 'SUIIII', 'IIIIIII', '3737373737', 5);

-- INSERT INTO accounts (username, password) values ('customer5', 'password5');
-- INSERT INTO accounts (username, password) values ('customer6', 'password6');

-- INSERT INTO customer_accounts (username, total_points, account_status, latest_ordered_at, customer_id) values ('customer5', 50, 'ACTIVE', convert(datetime, '20/11/2023', 103), 11);
-- INSERT INTO customer_accounts (username, total_points, account_status, latest_ordered_at, customer_id) values ('customer6', 100, 'INACTIVE', convert(datetime, '01/01/2017', 103), 12);

-- --Online orders
-- INSERT INTO online_orders 	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
-- 				VALUES		(10, 'DONE', 0, '...', '11-10-2023 10:00', 'customer5', 'employee1', 'employee3', 0);
-- INSERT INTO online_orders 	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
-- 				VALUES		(11, 'DONE', 0, '...', '11-17-2023 14:00', 'customer6', 'employee2', 'employee3', 0);

-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)       --Memebership customer5: 10%
-- 				VALUES		(10, 20, 50000, 4);
-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)
-- 				VALUES		(10, 21, 50000, 2);
-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)		--Memebership customer6: 25%
-- 				VALUES		(11, 10, 45000, 1);
-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)
-- 				VALUES		(11, 11, 45000, 2);
-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)
-- 				VALUES		(11, 12, 32500, 2);

-- DELETE FROM order_items WHERE order_id = 10 AND item_id = 20

-- --Offline orders
-- INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (0, 0, 0, '11-10-2023');
-- INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (0, 0, 0, '11-15-2023');

-- INSERT INTO directly_orders (order_id, change, customer_payment, customer_id, export_emp_username) 
-- 				VALUES		(12, 0, 200000, 11, 'employee5');
-- INSERT INTO directly_orders (order_id, change, customer_payment, customer_id, export_emp_username) 
-- 				VALUES		(13, 0, 50000, 12, 'employee6');

-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)       --Memebership customer5: 10%
-- 				VALUES		(12, 20, 50000, 4);
-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)
-- 				VALUES		(12, 21, 50000, 2);
-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)		--Memebership customer6: 25%
-- 				VALUES		(13, 10, 45000, 1);
-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)
-- 				VALUES		(13, 11, 45000, 2);
-- INSERT INTO order_items (order_id, item_id, actual_price, quantity)
-- 				VALUES		(13, 12, 32500, 2);