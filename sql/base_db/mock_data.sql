-- 026_insert_ingredients.sql
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('milk');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('sugar');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('flour');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('vanilla extract');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('cocoa powder');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('eggs');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('butter');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('whipped cream');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('strawberries');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('lemon juice');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('mint leaves');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('chocolate chips');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('condensed milk');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('coffee');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('rum');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('caramel sauce');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('nutella');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('coconut flakes');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('ice cream');
INSERT INTO ingredients
	(ingredient_name)
VALUES
	('raspberries');

-- 027_insert_categories.sql
INSERT INTO categories
VALUES
	('smoothie');
INSERT INTO categories
VALUES
	('coffee');
INSERT INTO categories
VALUES
	('juice');
INSERT INTO categories
VALUES
	('tea');
INSERT INTO categories
VALUES
	('desert');

-- 028_insert_items.sql
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Capuchino', '...', '...', 45000, 2);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Lover Coffee', '...', '...', 50000, 2);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Magical Coffee', '...', '...', 45000, 2);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Egg Coffee', '...', '...', 45000, 2);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Hot Ice Coffee', '...', '...', 45000, 2);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Weasel Coffee', '...', '...', 45000, 2);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Chocolate Coffee', '...', '...', 45000, 2);

INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Chocolate Matba', '...', '...', 45000, 1);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Happy Liquid', '...', '...', 45000, 1);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Coolest Smoothie', '...', '...', 45000, 1);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Its Green Inside Smoothie', '...', '...', 45000, 1);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Banana Smoothie', '...', '...', 45000, 1);

INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Detox Juice', '...', '...', 45000, 3);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Dragon Fruit Juice', '...', '...', 45000, 3);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Grape Juice', '...', '...', 45000, 3);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Orange Juice', '...', '...', 45000, 3);

INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Lemon Peach Tea', '...', '...', 45000, 4);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Victory Tea', '...', '...', 45000, 4);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Lucky Tea', '...', '...', 45000, 4);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Chrysanthemum', '...', '...', 45000, 4);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Honey Tea', '...', '...', 45000, 4);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Bubble Tea', '...', '...', 45000, 4);

INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Berry Pudding', '...', '...', 50000, 5);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Fruit Yogurt', '...', '...', 50000, 5);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Lovely Donut', '...', '...', 50000, 5);
INSERT INTO items
	(item_name, description, instruction, base_price, category_id)
VALUES
	('Macarons', '...', '...', 50000, 5);


-- 029_insert_into_menus.sql
INSERT INTO menus
	(menu_name, period, started_at)
VALUES
	('Normal Menu', 0, convert(datetime, '01/01/2000', 103))

-- 030_insert_into_accounts.sql
INSERT INTO accounts
	(username, password)
VALUES
	('employee1', 'password1');
INSERT INTO accounts
	(username, password)
VALUES
	('employee2', 'password2');
INSERT INTO accounts
	(username, password)
VALUES
	('employee3', 'password3');
INSERT INTO accounts
	(username, password)
VALUES
	('employee4', 'password4');
INSERT INTO accounts
	(username, password)
VALUES
	('employee5', 'password5');
INSERT INTO accounts
	(username, password)
VALUES
	('employee6', 'password6');

INSERT INTO accounts
	(username, password)
VALUES
	('customer1', 'password1');
INSERT INTO accounts
	(username, password)
VALUES
	('customer2', 'password2');
INSERT INTO accounts
	(username, password)
VALUES
	('customer3', 'password3');
INSERT INTO accounts
	(username, password)
VALUES
	('customer4', 'password4');

-- 031_insert_into_memberships.sql
INSERT INTO memberships
	(description, membership_type, discount_percent)
VALUES
	('...', 'BRONZE', 5);
INSERT INTO memberships
	(description, membership_type, discount_percent)
VALUES
	('...', 'SILVER', 7);
INSERT INTO memberships
	(description, membership_type, discount_percent)
VALUES
	('...', 'GOLD', 10);
INSERT INTO memberships
	(description, membership_type, discount_percent)
VALUES
	('...', 'DIAMOND', 15);
INSERT INTO memberships
	(description, membership_type, discount_percent)
VALUES
	('...', 'VIP', 25);

-- 032_insert_into_customers.sql
INSERT INTO customers
	(sex, first_name, last_name, phone_number, membership_id)
VALUES
	('FEMALE', 'Adan', 'McConway', '5957591109', 3);
INSERT INTO customers
	(sex, first_name, last_name, phone_number, membership_id)
VALUES
	('FEMALE', 'Janina', 'McLewd', '4651383549', 5);
INSERT INTO customers
	(sex, first_name, last_name, phone_number, membership_id)
VALUES
	('FEMALE', 'Fiorenze', 'Boij', '6717187461', 3);
INSERT INTO customers
	(sex, first_name, last_name, phone_number, membership_id)
VALUES
	('MALE', 'Christoforo', 'Floyde', '2875947838', 3);
INSERT INTO customers
	(sex, first_name, last_name, phone_number, membership_id)
VALUES
	('MALE', 'Celka', 'Fidgett', '2565452069', 1);
INSERT INTO customers
	(sex, first_name, last_name, phone_number, membership_id)
VALUES
	('OTHER', 'Lyman', 'Winsome', '3431531803', 5);
INSERT INTO customers
	(sex, first_name, last_name, phone_number, membership_id)
VALUES
	('FEMALE', 'Morgen', 'Goodey', '9345745078', 4);
INSERT INTO customers
	(sex, first_name, last_name, phone_number, membership_id)
VALUES
	('FEMALE', 'Vicki', 'Braitling', '1896472820', 5);
INSERT INTO customers
	(sex, first_name, last_name, phone_number, membership_id)
VALUES
	('OTHER', 'Miguelita', 'Grimme', '6006341027', 4);
INSERT INTO customers
	(sex, first_name, last_name, phone_number, membership_id)
VALUES
	('MALE', 'Madlen', 'Craiker', '7165935688', 4);

-- 033_insert_into_customer_accounts.sql
INSERT INTO customer_accounts
	(username, total_points, account_status, latest_ordered_at, customer_id)
VALUES
	('customer1', 0, 'ACTIVE', convert(datetime, '21/11/2023', 103), 1);
INSERT INTO customer_accounts
	(username, total_points, account_status, latest_ordered_at, customer_id)
VALUES
	('customer3', 20, 'ACTIVE', convert(datetime, '1/11/2023', 103), 3);
INSERT INTO customer_accounts
	(username, total_points, account_status, latest_ordered_at, customer_id)
VALUES
	('customer4', 50, 'ACTIVE', convert(datetime, '20/11/2023', 103), 4);
INSERT INTO customer_accounts
	(username, total_points, account_status, latest_ordered_at, customer_id)
VALUES
	('customer2', 100, 'INACTIVE', convert(datetime, '01/01/2017', 103), 2);

-- 034_insert_into_stores.sql
ALTER TABLE stores 
NOCHECK CONSTRAINT fk_manager_employee
INSERT INTO stores
	(manager_username, store_name, address, store_number, opened_time, closed_time, opened_date, month_revenue, no_employees)
values
	('employee1', 'Store 1', '123 Main St', '0910101020', '8:00', '22:00', '1-01-2021', 0, 5);
INSERT INTO stores
	(manager_username, store_name, address, store_number, opened_time, closed_time, opened_date, month_revenue, no_employees)
values
	('employee6', 'Store 2', '456 Elm St', '0910101021', '8:00', '22:00', '2-01-2021', 0, 5);
INSERT INTO stores
	(manager_username, store_name, address, store_number, opened_time, closed_time, opened_date, month_revenue, no_employees)
VALUES
	('employee11', 'Store 3', '789 Oak St', '0910101022', '7:30', '21:00', '3-01-2021', 0, 4);
INSERT INTO stores
	(manager_username, store_name, address, store_number, opened_time, closed_time, opened_date, month_revenue, no_employees)
VALUES
	('employee15', 'Store 4', '321 Maple Ave', '0910101023', '7:30', '21:30', '4-01-2021', 0, 3);
INSERT INTO stores
	(manager_username, store_name, address, store_number, opened_time, closed_time, opened_date, month_revenue, no_employees)
VALUES
	('employee19', 'Store 5', '654 Pine St', '0910101024', '7:00', '21:00', '5-01-2021', 0, 3);

-- 035_insert_into_employee_accounts.sql
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
values
	('employee1', 12000000, '123 Main St', convert(datetime, '20/10/1986', 103), 'MANAGER', 'Vitoria', 'Rainsden', 'MALE', '1-30-2021', '111111111', 'FULLTIME', 1);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
values
	('employee2', 10000000, '456 Elm St', convert(datetime, '15/7/1992', 103), 'EMPLOYEE', 'Cindi', 'Liddon', 'MALE', '1-30-2021', '111111112', 'FULLTIME', 1);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
values
	('employee3', 8000000, '789 Oak St', convert(datetime, '24/10/2002', 103), 'SHIPPER', 'Lisetta', 'Americi', 'FEMALE', '3-30-2021', '111111113', 'PARTTIME', 1);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
values
	('employee4', 10000000, '321 Maple Ave', convert(datetime, '10/11/2000', 103), 'EMPLOYEE', 'Cindi', 'Rainsden', 'MALE', '4-30-2021', '111111114', 'FULLTIME', 1);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
values
	('employee5', 8000000, '654 Pine St', convert(datetime, '12/11/2002', 103), 'EMPLOEE', 'Husein', 'Hosier', 'FEMALE', '5-30-2021', '111111115', 'PARTTIME', 1);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
values
	('employee6', 14000000, '987 Oak St', convert(datetime, '7/4/2000', 103), 'MANAGER', 'Saunderson', 'Rainsden', 'MALE', '6-30-2021', '222222222', 'FULLTIME', 2);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee7', 8000000, '123 Main St', CONVERT(DATETIME, '12/05/1990', 103), 'EMPLOYEE', 'John', 'Smith', 'MALE', '2-15-2021', '222222223', 'FULLTIME', 2);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee8', 7000000, '456 Elm St', CONVERT(DATETIME, '03/08/1993', 103), 'EMPLOYEE', 'Emily', 'Johnson', 'FEMALE', '3-20-2021', '222222224', 'PARTTIME', 2);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee9', 9000000, '789 Oak St', CONVERT(DATETIME, '05/12/1995', 103), 'SHIPPER', 'David', 'Williams', 'MALE', '4-10-2021', '222222225', 'FULLTIME', 2);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee10', 6000000, '321 Maple Ave', CONVERT(DATETIME, '09/03/1998', 103), 'EMPLOYEE', 'Emma', 'Brown', 'FEMALE', '5-05-2021', '222222226', 'PARTTIME', 2);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee11', 15000000, '654 Pine St', CONVERT(DATETIME, '22/11/2000', 103), 'MANAGER', 'Daniel', 'Jones', 'MALE', '6-25-2021', '333333333', 'FULLTIME', 3);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee12', 8000000, '789 Oak St', CONVERT(DATETIME, '01/05/1991', 103), 'SHIPPER', 'Olivia', 'Taylor', 'FEMALE', '7-10-2021', '333333334', 'PARTTIME', 3);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee13', 10000000, '123 Main St', CONVERT(DATETIME, '15/4/1994', 103), 'EMPLOYEE', 'Michael', 'Anderson', 'MALE', '8-20-2021', '333333335', 'FULLTIME', 3);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee14', 7000000, '456 Elm St', CONVERT(DATETIME, '28/7/1997', 103), 'EMPLOYEE', 'Sophia', 'Martinez', 'FEMALE', '9-05-2021', '333333336', 'PARTTIME', 3);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee15', 11000000, '789 Oak St', CONVERT(DATETIME, '10/10/1999', 103), 'MANAGER', 'Matthew', 'Garcia', 'MALE', '10-15-2021', '444444444', 'FULLTIME', 4);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee16', 6000000, '321 Maple Ave', CONVERT(DATETIME, '01/12/1992', 103), 'SHIPPER', 'James', 'Lee', 'MALE', '11-01-2021', '444444445', 'PARTTIME', 4);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee17', 8000000, '123 Main St', CONVERT(DATETIME, '25/04/1993', 103), 'EMPLOYEE', 'Ava', 'Lopez', 'FEMALE', '12-10-2021', '444444446', 'FULLTIME', 4);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee18', 7000000, '456 Elm St', CONVERT(DATETIME, '18/08/1995', 103), 'SHIPPER', 'Jacob', 'Hernandez', 'MALE', '01-15-2022', '555555555', 'PARTTIME', 5);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee19', 13000000, '789 Oak St', CONVERT(DATETIME, '11/03/1998', 103), 'MANAGER', 'Mia', 'Gonzalez', 'FEMALE', '02-28-2022', '555555556', 'FULLTIME', 5);
INSERT INTO employee_accounts
	(username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id)
VALUES
	('employee20', 6000000, '321 Maple Ave', CONVERT(DATETIME, '16/03/2001', 103), 'EMPLOYEE', 'Liam', 'Rodriguez', 'MALE', '03-10-2022', '555555557', 'PARTTIME', 5);
ALTER TABLE stores 
CHECK CONSTRAINT fk_manager_employee

-- 036_insert_vouchers.sql
INSERT INTO vouchers
	(description, voucher_name, started_at, status, promotional_amount, total_applied_amount, period)
VALUES
	('...', 'Monthly voucher', '11-01-2023', 0, 20000, 100000, 30);

-- 037_insert_orders.sql
-- user_1
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(200000, 20000, 20000, '11-10-2023 07:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(50000, 0, 5000, '11-15-2023 08:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(90000, 0, 9000, '11-16-2023 09:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(100000, 0, 10000, '11-17-2023 10:00');


-- user_2
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(500000, 20000, 125000, '11-17-2023 10:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(200000, 20000, 50000, '11-18-2023 11:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(100000, 0, 10000, '11-13-2023 12:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(50000, 0, 5000, '11-12-2023 13:00');

-- user_3
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(300000, 0, 30000, '11-09-2023 12:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(200000, 0, 20000, '11-10-2023 13:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(100000, 0, 10000, '11-11-2023 14:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(50000, 0, 5000, '11-12-2023 15:00');


-- user_4
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(500000, 0, 50000, '11-08-2023 14:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(200000, 0, 20000, '11-10-2023 17:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(100000, 0, 10000, '11-10-2023 18:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(50000, 0, 5000, '11-10-2023 19:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(50000, 0, 5000, '11-11-2023 20:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(50000, 0, 5000, '11-12-2023 21:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(50000, 0, 5000, '11-17-2023 22:00');
INSERT INTO orders
	(total_amount, discount_amount_by_voucher, discount_amount_by_membership, ordered_at)
VALUES
	(50000, 0, 5000, '11-18-2023 21:00');


-- 038_insert_online_orders.sql
INSERT INTO online_orders
	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
VALUES
	(1, 'DONE', 0, '...', '11-10-2023 10:00', 'customer1', 'employee2', 'employee7', 0);
INSERT INTO online_orders
	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
VALUES
	(4, 'DONE', 0, '...', '11-17-2023 14:00', 'customer2', 'employee2', 'employee7', 0);
INSERT INTO online_orders
	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
VALUES
	(5, 'DONE', 0, '...', '11-18-2023 13:00', 'customer2', 'employee1', 'employee7', 0);
INSERT INTO online_orders
	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
VALUES
	(7, 'DONE', 0, '...', '11-10-2023 10:00', 'customer3', 'employee8', 'employee3', 0);
INSERT INTO online_orders
	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
VALUES
	(10, 'DONE', 0, '...', '11-10-2023 10:00', 'customer4', 'employee8', 'employee3', 0);
INSERT INTO online_orders
	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
VALUES
	(11, 'DONE', 0, '...', '11-10-2023 10:00', 'customer2', 'employee3', 'employee4', 0);
INSERT INTO online_orders
	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
VALUES
	(12, 'DONE', 0, '...', '11-10-2023 10:00', 'customer1', 'employee4', 'employee3', 0);
INSERT INTO online_orders
	(order_id, status, shipping_fee, shipping_address, predicted_arrived_time, customer_account_username, export_employee_username, shipping_employee_username, discount_amount_by_point)
VALUES
	(13, 'DONE', 0, '...', '11-10-2023 10:00', 'customer3', 'employee8', 'employee3', 0);


-- 039_insert_directly_orders.sql
INSERT INTO directly_orders
	(order_id, change, customer_payment, customer_id, export_emp_username)
VALUES
	(2, 50000, 100000, 1, 'employee7');
INSERT INTO directly_orders
	(order_id, change, customer_payment, customer_id, export_emp_username)
VALUES
	(3, 10000, 100000, 1, 'employee1');
INSERT INTO directly_orders
	(order_id, change, customer_payment, customer_id, export_emp_username)
VALUES
	(6, 300000, 500000, 3, 'employee4');
INSERT INTO directly_orders
	(order_id, change, customer_payment, customer_id, export_emp_username)
VALUES
	(8, 0, 50000, 4, 'employee3');
INSERT INTO directly_orders
	(order_id, change, customer_payment, customer_id, export_emp_username)
VALUES
	(9, 200000, 500000, 6, 'employee4');
INSERT INTO directly_orders
	(order_id, change, customer_payment, customer_id, export_emp_username)
VALUES
	(14, 0, 200000, 5, 'employee9');
INSERT INTO directly_orders
	(order_id, change, customer_payment, customer_id, export_emp_username)
VALUES
	(15, 100000, 200000, 2, 'employee6');
INSERT INTO directly_orders
	(order_id, change, customer_payment, customer_id, export_emp_username)
VALUES
	(16, 0, 50000, 4, 'employee5');
INSERT INTO directly_orders
	(order_id, change, customer_payment, customer_id, export_emp_username)
VALUES
	(17, 0, 50000, 7, 'employee5');
INSERT INTO directly_orders
	(order_id, change, customer_payment, customer_id, export_emp_username)
VALUES
	(18, 0, 50000, 8, 'employee6');
INSERT INTO directly_orders
	(order_id, change, customer_payment, customer_id, export_emp_username)
VALUES
	(19, 0, 50000, 9, 'employee9');
INSERT INTO directly_orders
	(order_id, change, customer_payment, customer_id, export_emp_username)
VALUES
	(20, 0, 50000, 4, 'employee6');

-- 040_insert_order_items.sql
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(1, 2, 50000, 4);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(2, 2, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(3, 18, 45000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(3, 19, 45000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(4, 23, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(4, 24, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(5, 17, 45000, 3);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(5, 19, 45000, 3);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(5, 11, 45000, 3);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(5, 9, 45000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(5, 2, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(6, 24, 50000, 4);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(7, 23, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(7, 24, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(8, 25, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(9, 23, 50000, 2);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(9, 24, 50000, 2);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(9, 25, 50000, 2);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(10, 23, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(10, 24, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(10, 25, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(10, 26, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(11, 23, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(11, 24, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(12, 25, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(13, 26, 50000, 1),
	(13, 3, 45000, 1),
	(13, 4, 45000, 1),
	(13, 5, 45000, 1),
	(13, 6, 45000, 1),
	(13, 7, 45000, 1),
	(13, 8, 45000, 1),
	(13, 9, 45000, 1),
	(13, 10, 45000, 1),
	(13, 11, 45000, 1),
	(13, 12, 45000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(14, 23, 50000, 1),
	(14, 24, 50000, 1),
	(14, 25, 50000, 1),
	(14, 26, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(15, 23, 50000, 1),
	(15, 26, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(16, 23, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(17, 24, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(18, 25, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(19, 26, 50000, 1);
INSERT INTO order_items
	(order_id, item_id, actual_price, quantity)
VALUES
	(20, 26, 50000, 1);

-- Mockup data for procedure 2 that return top employees in sales
-- Mock-up data for Months table
INSERT INTO Months
	(month, year)
VALUES
	(1, 2023),
	(2, 2023),
	(3, 2023),
	(4, 2023),
	(5, 2023),
	(6, 2023),
	(7, 2023),
	(8, 2023),
	(9, 2023),
	(10, 2023),
	(11, 2023),
	(12, 2023);

-- Mock-up data for Shifts table
INSERT INTO shifts
	("month", "year", started_at, ended_at, "day")
VALUES
	(11, 2023, '05:00:00', '11:00:00', 8),
	(11, 2023, '11:00:00', '17:00:00', 8),
	(11, 2023, '17:00:00', '23:00:00', 8),
	(11, 2023, '05:00:00', '11:00:00', 9),
	(11, 2023, '11:00:00', '17:00:00', 9),
	(11, 2023, '17:00:00', '23:00:00', 9),
	(11, 2023, '05:00:00', '11:00:00', 10),
	(11, 2023, '11:00:00', '17:00:00', 10),
	(11, 2023, '17:00:00', '23:00:00', 10),
	(11, 2023, '05:00:00', '11:00:00', 11),
	(11, 2023, '11:00:00', '17:00:00', 11),
	(11, 2023, '17:00:00', '23:00:00', 11),
	(11, 2023, '05:00:00', '11:00:00', 12),
	(11, 2023, '11:00:00', '17:00:00', 12),
	(11, 2023, '17:00:00', '23:00:00', 12),
	(11, 2023, '05:00:00', '11:00:00', 13),
	(11, 2023, '11:00:00', '17:00:00', 13),
	(11, 2023, '17:00:00', '23:00:00', 13),
	(11, 2023, '05:00:00', '11:00:00', 14),
	(11, 2023, '11:00:00', '17:00:00', 14),
	(11, 2023, '17:00:00', '23:00:00', 14),
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

INSERT INTO employee_shifts
	(username, shift_id, "month", "year")
VALUES
	-- 08/11
	('employee1', 1, 11, 2023),
	('employee2', 1, 11, 2023),
	('employee7', 1, 11, 2023),
	('employee3', 2, 11, 2023),
	('employee4', 2, 11, 2023),
	('employee8', 2, 11, 2023),
	('employee5', 3, 11, 2023),
	('employee6', 3, 11, 2023),
	('employee9', 3, 11, 2023),

	-- 09/11
	('employee1', 4, 11, 2023),
	('employee2', 4, 11, 2023),
	('employee7', 4, 11, 2023),
	('employee3', 5, 11, 2023),
	('employee4', 5, 11, 2023),
	('employee8', 5, 11, 2023),
	('employee5', 6, 11, 2023),
	('employee6', 6, 11, 2023),
	('employee9', 6, 11, 2023),

	-- 10/11
	('employee1', 7, 11, 2023),
	('employee2', 7, 11, 2023),
	('employee7', 7, 11, 2023),
	('employee3', 8, 11, 2023),
	('employee4', 8, 11, 2023),
	('employee8', 8, 11, 2023),
	('employee5', 9, 11, 2023),
	('employee6', 9, 11, 2023),
	('employee9', 9, 11, 2023),

	-- 11/11
	('employee1', 10, 11, 2023),
	('employee2', 10, 11, 2023),
	('employee7', 10, 11, 2023),
	('employee3', 11, 11, 2023),
	('employee4', 11, 11, 2023),
	('employee8', 11, 11, 2023),
	('employee5', 12, 11, 2023),
	('employee6', 12, 11, 2023),
	('employee9', 12, 11, 2023),

	-- 12/11
	('employee1', 13, 11, 2023),
	('employee2', 13, 11, 2023),
	('employee7', 13, 11, 2023),
	('employee3', 14, 11, 2023),
	('employee4', 14, 11, 2023),
	('employee8', 14, 11, 2023),
	('employee5', 15, 11, 2023),
	('employee6', 15, 11, 2023),
	('employee9', 15, 11, 2023),

	-- 13/11
	('employee1', 16, 11, 2023),
	('employee2', 16, 11, 2023),
	('employee7', 16, 11, 2023),
	('employee3', 17, 11, 2023),
	('employee4', 17, 11, 2023),
	('employee8', 17, 11, 2023),
	('employee5', 18, 11, 2023),
	('employee6', 18, 11, 2023),
	('employee9', 18, 11, 2023),

	-- 14/11
	('employee1', 19, 11, 2023),
	('employee2', 19, 11, 2023),
	('employee7', 19, 11, 2023),
	('employee3', 20, 11, 2023),
	('employee4', 20, 11, 2023),
	('employee8', 20, 11, 2023),
	('employee5', 21, 11, 2023),
	('employee6', 21, 11, 2023),
	('employee9', 21, 11, 2023),

	-- 15/11
	('employee1', 22, 11, 2023),
	('employee2', 22, 11, 2023),
	('employee7', 22, 11, 2023),
	('employee3', 23, 11, 2023),
	('employee4', 23, 11, 2023),
	('employee8', 23, 11, 2023),
	('employee5', 24, 11, 2023),
	('employee6', 24, 11, 2023),
	('employee9', 24, 11, 2023),

	-- 16/11
	('employee1', 25, 11, 2023),
	('employee2', 25, 11, 2023),
	('employee7', 25, 11, 2023),
	('employee3', 26, 11, 2023),
	('employee4', 26, 11, 2023),
	('employee8', 26, 11, 2023),
	('employee5', 27, 11, 2023),
	('employee6', 27, 11, 2023),
	('employee9', 27, 11, 2023),
	-- 17/11
	('employee1', 28, 11, 2023),
	('employee2', 28, 11, 2023),
	('employee7', 28, 11, 2023),
	('employee3', 29, 11, 2023),
	('employee4', 29, 11, 2023),
	('employee8', 29, 11, 2023),
	('employee5', 30, 11, 2023),
	('employee6', 30, 11, 2023),
	('employee9', 30, 11, 2023),

	-- 18/11
	('employee1', 31, 11, 2023),
	('employee2', 31, 11, 2023),
	('employee7', 31, 11, 2023),
	('employee3', 32, 11, 2023),
	('employee4', 32, 11, 2023),
	('employee8', 32, 11, 2023),
	('employee5', 33, 11, 2023),
	('employee6', 33, 11, 2023),
	('employee9', 33, 11, 2023);

