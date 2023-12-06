--3. discount_amount_by_voucher
CREATE OR ALTER TRIGGER UpdateDiscountByVoucher
ON order_vouchers
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Add voucher
    IF (SELECT COUNT(*) FROM INSERTED) > 0
    BEGIN
        DECLARE @totalAmount money;
        DECLARE @totalAppliedAmount money;

        -- Get total_amount & total_applied_amount
        SELECT @totalAmount = total_amount,
               @totalAppliedAmount = total_applied_amount
        FROM vouchers v, orders
        WHERE v.id IN (SELECT voucher_id FROM INSERTED);
		--PRINT(@totalAmount);
		--PRINT(@totalAppliedAmount);

        -- Check the condition before executing the trigger
        IF @totalAmount > @totalAppliedAmount
           AND (SELECT discount_amount_by_membership + discount_amount_by_voucher 
                FROM orders 
                WHERE id = (SELECT order_id FROM INSERTED)) <= 0.5 * @totalAmount
        BEGIN
            -- Execute trigger
            UPDATE orders
			SET discount_amount_by_voucher = discount_amount_by_voucher +
                                         (SELECT promotional_amount 
                                          FROM vouchers 
                                          WHERE id IN (SELECT voucher_id FROM INSERTED))
			WHERE id IN (SELECT order_id FROM INSERTED);

			PRINT('Voucher Added');

            --SET discount_amount_by_voucher = discount_amount_by_voucher + 
             --                                (SELECT promotional_amount FROM INSERTED)
            --WHERE id IN (SELECT order_id FROM INSERTED);
        END
        ELSE
        BEGIN
             -- Raise error
             --PRINT('total_amount not satisfied or discounted amount exceeded over 50% of total_amount');
			 RAISERROR ('total_amount not satisfied or discounted amount exceeded over 50%% of total_amount' ,10,1);
			 ROLLBACK TRANSACTION;
			 --THROW;
        END
    END

    -- Delete voucher
    IF (SELECT COUNT(*) FROM DELETED) > 0
    BEGIN
        UPDATE orders
        SET discount_amount_by_voucher = discount_amount_by_voucher -
                                         (SELECT promotional_amount 
                                          FROM vouchers 
                                          WHERE id IN (SELECT voucher_id FROM DELETED))
        WHERE id IN (SELECT order_id FROM DELETED);
		PRINT('Voucher Deleted');
    END
END;

-- -- Test trigger
-- INSERT INTO vouchers (description, voucher_name, started_at, status, promotional_amount, total_applied_amount, period) values ('...', 'Monthly voucher', '12-01-2023', 1, 30000, 150000, 30); --voucher_id: 2
-- INSERT INTO vouchers (description, voucher_name, started_at, status, promotional_amount, total_applied_amount, period) values ('...', 'Monthly voucher', '12-01-2023', 1, 50000, 150000, 30);
-- INSERT INTO vouchers (description, voucher_name, started_at, status, promotional_amount, total_applied_amount, period) values ('...', 'Monthly voucher', '12-01-2023', 1, 100000, 200000, 30);
-- INSERT INTO vouchers (description, voucher_name, started_at, status, promotional_amount, total_applied_amount, period) values ('...', 'Monthly voucher', '12-01-2023', 1, 180000, 400000, 30); --voucher_id: 5

-- INSERT INTO order_vouchers (order_id, voucher_id) values (12, 2); --30k / 150k
-- INSERT INTO order_vouchers (order_id, voucher_id) values (13, 3); --50k / 150k
-- INSERT INTO order_vouchers (order_id, voucher_id) values (13, 4); --100k / 200k
-- INSERT INTO order_vouchers (order_id, voucher_id) values (12, 5); --180k / 400k
-- --Why we cannot apply multiple vouchers for a single order?? Bruh

-- DELETE FROM order_vouchers WHERE order_id = 13 AND voucher_id = 3