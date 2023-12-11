-- 001_add_ingredients_table.sql
CREATE TABLE ingredients (
	id INT IDENTITY(1,1) PRIMARY KEY,
	ingredient_name VARCHAR(255) NOT NULL
);

-- 002_add_categories_table.sql
CREATE TABLE categories (
	id INT IDENTITY(1,1) PRIMARY KEY,
	category_name VARCHAR(255) NOT NULL
);

-- 003_add_items_table.sql
CREATE TABLE items (
	id INT IDENTITY(1,1) PRIMARY KEY,
	item_name VARCHAR(255) NOT NULL,
	description VARCHAR(500),
	instruction VARCHAR(255),
	base_price MONEY NOT NULL,
	category_id INT,
	CONSTRAINT fk_item_category FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- 004_add_item_has_ingredients_table.sql
CREATE TABLE item_has_ingredients(
	id INT IDENTITY(1,1) PRIMARY KEY,
	item_id INT NOT NULL,
	ingredient_id INT NOT NULL,
	quantity SMALLINT,
	unit char(20),
	CONSTRAINT fk_item_ingredient_1 FOREIGN KEY (item_id) REFERENCES items(id),
	CONSTRAINT fk_item_ingredient_2 FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);

-- 005_add_item_has_toppings.sql
CREATE TABLE item_has_toppings(
	id INT IDENTITY(1,1) PRIMARY KEY,
	item_id INT NOT NULL,
	topped_item_id INT NOT NULL,
	CONSTRAINT fk_item_topping FOREIGN KEY (item_id) REFERENCES items(id),
	CONSTRAINT fk_item_topped FOREIGN KEY (topped_item_id) REFERENCES items(id)
);

-- 006_add_menu_table.sql
CREATE TABLE menus(
	id INT IDENTITY(1,1) PRIMARY KEY,
	menu_name VARCHAR(255) NOT NULL,
	period INT,
	started_at DATETIME2 NOT NULL,
);

-- 007_add_orders_table.sql
CREATE TABLE orders(
	id INT IDENTITY(1,1) PRIMARY KEY,
	total_amount MONEY NOT NULL DEFAULT 0,
	discount_amount_by_voucher MONEY DEFAULT 0,
	discount_amount_by_membership MONEY DEFAULT 0,
	ordered_at DATETIME2 DEFAULT GETDATE()
);

-- 008_add_voucher_table.sql
CREATE TABLE vouchers(
	id INT IDENTITY(1,1) PRIMARY KEY,
	description VARCHAR(500),
	voucher_name VARCHAR(255),
	started_at DATETIME2,
	status BIT DEFAULT 0,
	promotional_amount MONEY NOT NULL,
	total_applied_amount MONEY NOT NULL,
	period INT
);

-- 009_add_memberships_table.sql
CREATE TABLE memberships(
	id INT IDENTITY(1,1) PRIMARY KEY,
	description VARCHAR(255),
	membership_type VARCHAR(50),
	discount_percent TINYINT NOT NULL
);

-- 010_add_customers_table.sql
CREATE TABLE customers(
	id INT IDENTITY(1,1) PRIMARY KEY,
	sex VARCHAR(20),
	last_name VARCHAR(255),
	first_name VARCHAR(255) NOT NULL,
	phone_number VARCHAR(10),
	membership_id INT,
	CONSTRAINT fk_customer_membership FOREIGN KEY (membership_id) REFERENCES memberships(id)
);

-- 011_add_customer_addresses_table.sql
CREATE TABLE customer_addresses(
	id INT IDENTITY(1,1),
	customer_id INT NOT NULL,
	number INT,
	street VARCHAR(255),
	district VARCHAR(255),
	CONSTRAINT pk_customer_address PRIMARY KEY (id, customer_id, number, street, district),
	CONSTRAINT fk_customer_address FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- 012_add_months_table.sql
CREATE TABLE months(
	id INT IDENTITY(1,1) PRIMARY KEY,
	month TINYINT NOT NULL,
	year SMALLINT NOT NULL,
	CONSTRAINT uq_month_year_id UNIQUE (month, year)
);

-- 013_add_shifts_table.sql
CREATE TABLE shifts(
	id INT IDENTITY(1,1) PRIMARY KEY,
	"month" TINYINT,
	"year" SMALLINT,
	started_at TIME CHECK (started_at >= '05:00:00'),
	ended_at TIME CHECK (ended_at <= '23:00:00'),
	"day" TINYINT,
	CONSTRAINT fk_shift_month FOREIGN KEY (month, year) REFERENCES months(month, year),
	CONSTRAINT uq_shift_month_year UNIQUE (id, month, year)
);

-- 014_add_accounts_table.sql
CREATE TABLE accounts(
	id INT IDENTITY(1,1) PRIMARY KEY,
	username VARCHAR(255) NOT NULL,
	password VARCHAR(255),
	CONSTRAINT uq_username UNIQUE (username)
);

-- 015_add_customer_accounts_table.sql
CREATE TABLE customer_accounts(
	id INT IDENTITY(1,1) PRIMARY KEY,
	username VARCHAR(255) NOT NULL,
	total_points INT NOT NULL DEFAULT 0,
	account_status VARCHAR(10) NOT NULL DEFAULT 'active',
	latest_ordered_at DATETIME2,
	customer_id INT,
	CONSTRAINT fk_customer_base_account FOREIGN KEY (username) REFERENCES accounts(username),
	CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(id),
	CONSTRAINT uq_username_customer UNIQUE (username)
);

-- 016_add_order_vouchers_table.sql
CREATE TABLE order_vouchers (
	id INT IDENTITY(1,1) PRIMARY KEY,
	order_id INT,
	voucher_id INT,
	CONSTRAINT uq_order_voucher UNIQUE (order_id),
	CONSTRAINT fk_voucher_order FOREIGN KEY (order_id) REFERENCES orders(id),
	CONSTRAINT fk_voucher_id FOREIGN KEY (voucher_id) REFERENCES vouchers(id)
);

-- 017_add_menu_items_table.sql
CREATE TABLE menu_items(
	id INT IDENTITY(1,1) PRIMARY KEY,
	item_id INT,
	menu_id INT,
	price INT,
	CONSTRAINT uq_item_menu UNIQUE (item_id, menu_id),
	CONSTRAINT fk_menu_item_id FOREIGN KEY (item_id) REFERENCES items(id),
	CONSTRAINT fk_meny_id FOREIGN KEY (menu_id) REFERENCES menus(id)
);

-- 018_add_order_items_table.sql
CREATE TABLE order_items(
	id INT IDENTITY(1,1) PRIMARY KEY,
	order_id INT,
	item_id INT,
	actual_price INT,
	quantity INT,
	CONSTRAINT uq_item_order UNIQUE (order_id, item_id),
	CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders(id),
	CONSTRAINT fk_order_item_id FOREIGN KEY (item_id) REFERENCES items(id)
);

-- 019_add_employee_accounts_table.sql
CREATE TABLE employee_accounts(
	id INT IDENTITY(1,1) PRIMARY KEY,
	username VARCHAR(255),
	salary MONEY,
	address VARCHAR(255),
	dob DATETIME2,
	account_type VARCHAR(100),
	last_name VARCHAR(255),
	first_name VARCHAR(255),
	sex VARCHAR(20),
	started_date DATETIME2,
	ssn VARCHAR(9),
	employee_type VARCHAR(20),
	store_id INT,
	status BIT DEFAULT 1,
	CONSTRAINT uq_username_employee_account UNIQUE (username),
	CONSTRAINT uq_employee_ssn UNIQUE (ssn)
);

-- 020_add_stores_table.sql
CREATE TABLE stores(
	id INT IDENTITY(1,1) PRIMARY KEY,
	manager_username VARCHAR(255),
	store_name VARCHAR(255),
	address VARCHAR(255),
	store_number VARCHAR(10),
	opened_time TIME CHECK (opened_time >= '5:30:00'),
	closed_time TIME CHECK (closed_time <= '23:30:00'),
	opened_date DATE,
	month_revenue MONEY,
	no_employees SMALLINT,
	CONSTRAINT fk_manager_employee FOREIGN KEY (manager_username) REFERENCES employee_accounts(username)
);

-- 021_add_foreign_key_to_store_for_account.sql
ALTER TABLE employee_accounts
ADD CONSTRAINT fk_store_id FOREIGN KEY (store_id) REFERENCES stores(id);


-- 022_add_employee_shifts_table.sql
CREATE TABLE employee_shifts(
	id INT IDENTITY(1,1) PRIMARY KEY,
	username VARCHAR(255),
	shift_id INT,
	"month" TINYINT,
	"year" SMALLINT,
	CONSTRAINT fk_shift_emp_username FOREIGN KEY (username) REFERENCES employee_accounts(username),
	CONSTRAINT uq_username_shift_month_year UNIQUE (username, shift_id, month, year),
	CONSTRAINT fk_employee_shift FOREIGN KEY (shift_id, month, year) REFERENCES shifts(id, month, year)
);

-- 023_add-employee_numbers_table.sql
CREATE TABLE employee_numbers(
	id INT IDENTITY(1,1) PRIMARY KEY,
	employee_username VARCHAR(255),
	number VARCHAR(10),
	CONSTRAINT fk_emp_nums FOREIGN KEY (employee_username) REFERENCES accounts(username),
	CONSTRAINT uq_employee_number UNIQUE (employee_username, number)
);

-- 024_add_directly_orders_table.sql
CREATE TABLE directly_orders(
	id INT IDENTITY(1,1) PRIMARY KEY,
	order_id INT,
	"change" MONEY,
	customer_payment MONEY,
	customer_id INT,
	export_emp_username VARCHAR(255),
	CONSTRAINT fk_directly_order_id FOREIGN KEY (order_id) REFERENCES orders(id),
	CONSTRAINT fk_directly_order_customer_id FOREIGN KEY (customer_id) REFERENCES customers(id),
	CONSTRAINT fk_directly_oder_export_emp FOREIGN KEY (export_emp_username) REFERENCES employee_accounts(username)
);

-- 025_add_online_orders_table.sql
CREATE TABLE online_orders(
	id INT IDENTITY(1,1) PRIMARY KEY,
	order_id INT,
	status VARCHAR(20),
	shipping_fee MONEY,
	shipping_address VARCHAR(255),
	predicted_arrived_time DATETIME2,
	customer_account_username VARCHAR(255),
	export_employee_username VARCHAR(255),
	shipping_employee_username VARCHAR(255),
	discount_amount_by_point MONEY,
	CONSTRAINT fk_online_order_id FOREIGN KEY (order_id) REFERENCES orders(id),
	CONSTRAINT fk_online_order_customer FOREIGN KEY (customer_account_username) REFERENCES customer_accounts(username),
	CONSTRAINT fk_online_order_export_emp FOREIGN KEY (export_employee_username) REFERENCES employee_accounts(username),
	CONSTRAINT fk_online_order_ship_emp FOREIGN KEY (shipping_employee_username) REFERENCES employee_accounts(username),
	CONSTRAINT uq_online_order UNIQUE (order_id)
);