-- 026_insert_ingredients.sql
insert into ingredients (ingredient_name) values ('milk');
insert into ingredients (ingredient_name) values ('sugar');
insert into ingredients (ingredient_name) values ('flour');
insert into ingredients (ingredient_name) values ('vanilla extract');
insert into ingredients (ingredient_name) values ('cocoa powder');
insert into ingredients (ingredient_name) values ('eggs');
insert into ingredients (ingredient_name) values ('butter');
insert into ingredients (ingredient_name) values ('whipped cream');
insert into ingredients (ingredient_name) values ('strawberries');
insert into ingredients (ingredient_name) values ('lemon juice');
insert into ingredients (ingredient_name) values ('mint leaves');
insert into ingredients (ingredient_name) values ('chocolate chips');
insert into ingredients (ingredient_name) values ('condensed milk');
insert into ingredients (ingredient_name) values ('coffee');
insert into ingredients (ingredient_name) values ('rum');
insert into ingredients (ingredient_name) values ('caramel sauce');
insert into ingredients (ingredient_name) values ('nutella');
insert into ingredients (ingredient_name) values ('coconut flakes');
insert into ingredients (ingredient_name) values ('ice cream');
insert into ingredients (ingredient_name) values ('raspberries');

-- 027_insert_categories.sql
INSERT INTO categories values ('smoothie');
INSERT INTO categories values ('coffee');
INSERT INTO categories values ('juice');
INSERT INTO categories values ('tea');
INSERT INTO categories values ('desert');

-- 028_insert_items.sql
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Capuchino', '...', '...', 45000, 2);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Lover Coffee', '...', '...', 50000, 2);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Magical Coffee', '...', '...', 45000, 2);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Egg Coffee', '...', '...', 45000, 2);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Hot Ice Coffee', '...', '...', 45000, 2);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Weasel Coffee', '...', '...', 45000, 2);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Chocolate Coffee', '...', '...', 45000, 2);

INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Chocolate Matba', '...', '...', 45000, 1);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Happy Liquid', '...', '...', 45000, 1);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Coolest Smoothie', '...', '...', 45000, 1);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Its Green Inside Smoothie', '...', '...', 45000, 1);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Banana Smoothie', '...', '...', 45000, 1);

INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Detox Juice', '...', '...', 45000, 3);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Dragon Fruit Juice', '...', '...', 45000, 3);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Grape Juice', '...', '...', 45000, 3);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Orange Juice', '...', '...', 45000, 3);

INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Lemon Peach Tea', '...', '...', 45000, 4);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Victory Tea', '...', '...', 45000, 4);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Lucky Tea', '...', '...', 45000, 4);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Chrysanthemum', '...', '...', 45000, 4);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Honey Tea', '...', '...', 45000, 4);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Bubble Tea', '...', '...', 45000, 4);

INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Berry Pudding', '...', '...', 50000, 5);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Fruit Yogurt', '...', '...', 50000, 5);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Lovely Donut', '...', '...', 50000, 5);
INSERT INTO items (item_name, description, instruction, base_price, category_id) values ('Macarons', '...', '...', 50000, 5);


-- 029_insert_into_menus.sql
INSERT INTO menus (menu_name, period, started_at) values ('Normal Menu', 0, convert(datetime, '01/01/2000', 103))

-- 030_insert_into_accounts.sql
INSERT INTO accounts (username, password) values ('employee1', 'password1');
INSERT INTO accounts (username, password) values ('employee2', 'password2');
INSERT INTO accounts (username, password) values ('employee3', 'password3');
INSERT INTO accounts (username, password) values ('employee4', 'password4');
INSERT INTO accounts (username, password) values ('employee5', 'password5');
INSERT INTO accounts (username, password) values ('employee6', 'password6');

INSERT INTO accounts (username, password) values ('customer1', 'password1');
INSERT INTO accounts (username, password) values ('customer2', 'password2');
INSERT INTO accounts (username, password) values ('customer3', 'password3');
INSERT INTO accounts (username, password) values ('customer4', 'password4');

-- 031_insert_into_memberships.sql
INSERT INTO memberships (description, membership_type, discount_percent) values ('...', 'BRONZE', 5);
INSERT INTO memberships (description, membership_type, discount_percent) values ('...', 'SILVER', 7);
INSERT INTO memberships (description, membership_type, discount_percent) values ('...', 'GOLD', 10);
INSERT INTO memberships (description, membership_type, discount_percent) values ('...', 'DIAMOND', 15);
INSERT INTO memberships (description, membership_type, discount_percent) values ('...', 'VIP', 25);

-- 032_insert_into_customers.sql
insert into customers (sex, first_name, last_name, phone_number, membership_id) values ('FEMALE', 'Adan', 'McConway', '5957591109', 3);
insert into customers (sex, first_name, last_name, phone_number, membership_id) values ('FEMALE', 'Janina', 'McLewd', '4651383549', 5);
insert into customers (sex, first_name, last_name, phone_number, membership_id) values ('FEMALE', 'Fiorenze', 'Boij', '6717187461', 3);
insert into customers (sex, first_name, last_name, phone_number, membership_id) values ('MALE', 'Christoforo', 'Floyde', '2875947838', 3);
insert into customers (sex, first_name, last_name, phone_number, membership_id) values ('MALE', 'Celka', 'Fidgett', '2565452069', 1);
insert into customers (sex, first_name, last_name, phone_number, membership_id) values ('OTHER', 'Lyman', 'Winsome', '3431531803', 5);
insert into customers (sex, first_name, last_name, phone_number, membership_id) values ('FEMALE', 'Morgen', 'Goodey', '9345745078', 4);
insert into customers (sex, first_name, last_name, phone_number, membership_id) values ('FEMALE', 'Vicki', 'Braitling', '1896472820', 5);
insert into customers (sex, first_name, last_name, phone_number, membership_id) values ('OTHER', 'Miguelita', 'Grimme', '6006341027', 4);
insert into customers (sex, first_name, last_name, phone_number, membership_id) values ('MALE', 'Madlen', 'Craiker', '7165935688', 4);

-- 033_insert_into_customer_accounts.sql
INSERT INTO customer_accounts (username, total_points, account_status, latest_ordered_at, customer_id) values ('customer1', 0, 'ACTIVE', convert(datetime, '21/11/2023', 103), 1);
INSERT INTO customer_accounts (username, total_points, account_status, latest_ordered_at, customer_id) values ('customer3', 20, 'ACTIVE', convert(datetime, '1/11/2023', 103), 3);
INSERT INTO customer_accounts (username, total_points, account_status, latest_ordered_at, customer_id) values ('customer4', 50, 'ACTIVE', convert(datetime, '20/11/2023', 103), 4);
INSERT INTO customer_accounts (username, total_points, account_status, latest_ordered_at, customer_id) values ('customer2', 100, 'INACTIVE', convert(datetime, '01/01/2017', 103), 2);

-- 034_insert_into_stores.sql
ALTER TABLE stores 
NOCHECK CONSTRAINT fk_manager_employee
INSERT INTO stores(manager_username, store_name, address, store_number, opened_time, closed_time, opened_date, month_revenue, no_employees) values ('employee1', 'Store 1', '...', '0910101020', '8:00', '22:00', '1-28-2021', 0, 0);
INSERT INTO stores(manager_username, store_name, address, store_number, opened_time, closed_time, opened_date, month_revenue, no_employees) values ('employee2', 'Store 2', '...', '0910101021', '8:00', '22:00', '7-28-2021', 0, 0);

-- 035_insert_into_employee_accounts.sql
INSERT INTO employee_accounts (username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id) values ('employee1', 10000000, '...', convert(datetime, '20/10/1986', 103), 'MANAGER', 'Vitoria', 'Rainsden', 'MALE', '1-30-2021', '111111111', 'FULLTIME', 1);
INSERT INTO employee_accounts (username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id) values ('employee2', 10000000, '...', convert(datetime, '15/7/1992', 103), 'MANAGER', 'Cindi', 'Liddon', 'MALE', '1-30-2021', '111111112', 'FULLTIME', 2);
INSERT INTO employee_accounts (username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id) values ('employee3', 8000000, '...', convert(datetime, '24/10/2002', 103), 'SHIPPER', 'Lisetta', 'Americi', 'FEMALE', '3-30-2021', '111111113', 'PARTTIME', 1);
INSERT INTO employee_accounts (username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id) values ('employee4', 10000000, '...', convert(datetime, '10/11/2000', 103), 'EMPLOYEE', 'Cindi', 'Rainsden', 'MALE', '4-30-2021', '111111114', 'FULLTIME', 2);
INSERT INTO employee_accounts (username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id) values ('employee5', 8000000, '...', convert(datetime, '12/11/2002', 103), 'EMPLOEE', 'Husein', 'Hosier', 'FEMALE', '1-30-2021', '111111115', 'PARTTIME', 1);
INSERT INTO employee_accounts (username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id) values ('employee6', 10000000, '...', convert(datetime, '7/4/2000', 103), 'SHIPPER', 'Saunderson', 'Rainsden', 'MALE', '1-30-2021', '111111116', 'FULLTIME', 2);

ALTER TABLE stores 
CHECK CONSTRAINT fk_manager_employee

-- 036_insert_vouchers.sql
INSERT INTO vouchers (description, voucher_name, started_at, status, promotional_amount, total_applied_amount, period) values ('...', 'Monthly voucher', '11-01-2023', 0, 20000, 100000, 30);

-- 037_insert_orders.sql
-- user_1
INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (200000, 20000, 20000, '11-10-2023 07:00');
INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (50000, 0, 5000, '11-15-2023 08:00');
INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (90000, 0, 9000, '11-16-2023 09:00');

-- user_2
INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (500000, 20000, 125000, '11-17-2023 10:00');
INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (200000, 20000, 50000, '11-18-2023 11:00');

-- user_3
INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (300000, 0, 30000, '11-09-2023 12:00');
INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (200000, 0, 20000, '11-10-2023 13:00');

-- user_4
INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (300000, 0, 30000, '11-08-2023 14:00');
INSERT INTO orders (total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at) values (200000, 0, 20000, '11-10-2023 17:00');

-- 038_insert_online_orders.sql
INSERT INTO online_orders 	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
				VALUES		(1, 'DONE', 0, '...', '11-10-2023 10:00', 'customer1', 'employee5', 'employee3', 0);
INSERT INTO online_orders 	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
				VALUES		(4, 'DONE', 0, '...', '11-17-2023 14:00', 'customer2', 'employee5', 'employee3', 0);
INSERT INTO online_orders 	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
				VALUES		(5, 'DONE', 0, '...', '11-18-2023 13:00', 'customer2', 'employee5', 'employee3', 0);
INSERT INTO online_orders 	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
				VALUES		(7, 'DONE', 0, '...', '11-10-2023 10:00', 'customer3', 'employee4', 'employee6', 0);

-- 039_insert_directly_orders.sql
INSERT INTO directly_orders (order_id, change, customer_payment, customer_id, export_emp_username) 
				VALUES		(2, 40000, 200000, 1, 'employee5');
INSERT INTO directly_orders (order_id, change, customer_payment, customer_id, export_emp_username) 
				VALUES		(3, 0, 50000, 1, 'employee5');
INSERT INTO directly_orders (order_id, change, customer_payment, customer_id, export_emp_username) 
				VALUES		(6, 100000, 400000, 3, 'employee4');
INSERT INTO directly_orders (order_id, change, customer_payment, customer_id, export_emp_username) 
				VALUES		(8, 0, 300000, 4, 'employee4');
INSERT INTO directly_orders (order_id, change, customer_payment, customer_id, export_emp_username) 
				VALUES		(9, 0, 200000, 4, 'employee4');

-- 040_insert_order_items.sql
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(1, 2, 50000, 4);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(2, 2, 50000, 1);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(3, 18, 45000, 1);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(3, 19, 45000, 1);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(4, 17, 45000, 3);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(4, 19, 45000, 3);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(4, 11, 45000, 3);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(4, 9, 45000, 1);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(4, 2, 50000, 1);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(5, 2, 50000, 4);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(6, 2, 50000, 3);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(6, 23, 50000, 3);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(7, 23, 50000, 2);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(7, 2, 50000, 2);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(8, 2, 50000, 3);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(8, 23, 50000, 1);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(8, 24, 50000, 1);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(8, 25, 50000, 1);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(9, 23, 50000, 2);
INSERT INTO order_items (order_id, item_id, actual_price, quantity)
				VALUES		(9, 2, 50000, 2);


-- Mockup data for procedure 2 that return top employees in sales
-- Mock-up data for Months table
INSERT INTO Months (month, year) VALUES
	(1, 2023), (2, 2023), (3, 2023), (4, 2023),
	(5, 2023), (6, 2023), (7, 2023), (8, 2023),
	(9, 2023), (10, 2023), (11, 2023), (12, 2023);

-- Mock-up data for Shifts table
INSERT INTO shifts ("month", "year", started_at, ended_at, "day") VALUES
    (11, 2023, '05:00:00', '11:00:00', 8),
    (11, 2023, '11:00:00', '17:00:00', 8),
    (11, 2023, '17:00:00', '23:00:00', 8),
	(11, 2023, '05:00:00', '11:00:00', 9),
    (11, 2023, '11:00:00', '17:00:00', 9),
    (11, 2023, '17:00:00', '23:00:00', 9),
	(11, 2023, '05:00:00', '11:00:00', 10),
    (11, 2023, '11:00:00', '17:00:00', 10),
    (11, 2023, '17:00:00', '23:00:00', 10),
	(11, 2023, '05:00:00', '11:00:00', 15),
    (11, 2023, '11:00:00', '17:00:00', 15),
    (11, 2023, '17:00:00', '23:00:00', 15),
	(11, 2023, '05:00:00', '11:00:00', 16),
    (11, 2023, '11:00:00', '17:00:00', 16),
    (11, 2023, '17:00:00', '23:00:00', 16),
	(11, 2023, '05:00:00', '11:00:00', 17),
    (11, 2023, '11:00:00', '17:00:00', 17),
    (11, 2023, '17:00:00', '23:00:00', 17),
	(11, 2023, '05:00:00', '11:00:00', 18),
    (11, 2023, '11:00:00', '17:00:00', 18),
    (11, 2023, '17:00:00', '23:00:00', 18);

INSERT INTO employee_shifts (username, shift_id, "month", "year") VALUES
    -- 08/11
	('employee1', 1, 11, 2023), ('employee2', 1, 11, 2023), 
	('employee3', 2, 11, 2023), ('employee4', 2, 11, 2023),
	('employee5', 3, 11, 2023), ('employee6', 3, 11, 2023),

	-- 09/11
	('employee1', 4, 11, 2023), ('employee2', 4, 11, 2023), 
	('employee3', 5, 11, 2023), ('employee4', 5, 11, 2023),
	('employee5', 6, 11, 2023), ('employee6', 6, 11, 2023),

	-- 10/11
	('employee1', 7, 11, 2023), ('employee2', 7, 11, 2023), 
	('employee3', 8, 11, 2023), ('employee4', 8, 11, 2023),
	('employee5', 9, 11, 2023), ('employee6', 9, 11, 2023),

	-- 15/11
	('employee1', 10, 11, 2023), ('employee2', 10, 11, 2023), 
	('employee3', 11, 11, 2023), ('employee4', 11, 11, 2023),
	('employee5', 12, 11, 2023), ('employee6', 12, 11, 2023),

	-- 16/11
	('employee1', 13, 11, 2023), ('employee2', 13, 11, 2023), 
	('employee3', 14, 11, 2023), ('employee4', 14, 11, 2023),
	('employee5', 15, 11, 2023), ('employee6', 15, 11, 2023),

	-- 17/11
	('employee1', 16, 11, 2023), ('employee2', 16, 11, 2023), 
	('employee3', 17, 11, 2023), ('employee4', 17, 11, 2023),
	('employee5', 18, 11, 2023), ('employee6', 18, 11, 2023),

	-- 18/11
	('employee1', 19, 11, 2023), ('employee2', 19, 11, 2023), 
	('employee3', 20, 11, 2023), ('employee4', 20, 11, 2023),
	('employee5', 21, 11, 2023), ('employee6', 21, 11, 2023)
    ;

