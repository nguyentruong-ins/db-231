-- 001_add_ingredients_table.sql
create table ingredients (
	id int identity(1,1) primary key,
	ingredient_name varchar(255) not null
);

-- 002_add_categories_table.sql
create table categories (
	id int identity(1,1) primary key,
	category_name varchar(255) not null
);

-- 003_add_items_table.sql
create table items (
	id int identity(1,1) primary key,
	item_name varchar(255) not null,
	description varchar(500),
	instruction varchar(255),
	base_price money not null,
	category_id int,
	constraint fk_item_category foreign key	(category_id) references categories(id)
);

-- 004_add_item_has_ingredients_table.sql
create table item_has_ingredients(
	id int identity(1,1) primary key,
	item_id int not null,
	ingredient_id int not null,
	quantity smallint,
	unit char(20),
	constraint fk_item_ingredient_1 foreign key (item_id) references items(id),
	constraint fk_item_ingredient_2 foreign key (ingredient_id) references ingredients(id)
);

-- 005_add_item_has_toppings.sql
create table item_has_toppings(
	id int identity(1,1) primary key,
	item_id int not null,
	topped_item_id int not null,
	constraint fk_item_topping foreign key (item_id) references items(id),
	constraint fk_item_topped foreign key (topped_item_id) references items(id)
);

-- 006_add_menu_table.sql
create table menus(
	id int identity(1,1) primary key,
	menu_name varchar(255) not null,
	period int,
	started_at datetime2 not null,
);

-- 007_add_orders_table.sql
create table orders(
	id int identity(1,1) primary key,
	total_amount money not null,
	discount_amount_by_voucher money,
	discount_amount_by_membership money,
	ordered_at datetime2
);

-- 008_add_voucher_table.sql
create table vouchers(
	id int identity(1,1) primary key,
	description varchar(500),
	voucher_name varchar(255),
	started_at datetime2,
	status bit default 0,
	promotional_amount money not null,
	total_applied_amount money not null,
	period int
);

-- 009_add_memberships_table.sql
create table memberships(
	id int identity(1,1) primary key,
	description varchar(255),
	membership_type varchar(50),
	discount_percent tinyint not null
);

-- 010_add_customers_table.sql
create table customers(
	id int identity(1,1) primary key,
	sex varchar(20),
	last_name varchar(255),
	first_name varchar(255) not null,
	phone_number varchar(10),
	membership_id int,
	constraint fk_customer_membership foreign key (membership_id) references memberships(id)
);

-- 011_add_customer_addresses_table.sql
create table customer_addresses(
	id int identity(1,1),
	customer_id int not null,
	number int,
	street varchar(255),
	district varchar(255),
	constraint pk_customer_address primary key (id, customer_id, number, street, district),
	constraint fk_customer_address foreign key (customer_id) references customers(id)
);

-- 012_add_months_table.sql
create table months(
	id int identity(1,1) primary key,
	month tinyint not null,
	year smallint not null,
	constraint uq_month_year_id unique (month, year)
);

-- 013_add_shifts_table.sql
create table shifts(
	id int identity(1,1) primary key,
	"month" tinyint,
	"year" smallint,
	started_at time check (started_at >= '05:00:00'),
	ended_at time check (ended_at <= '23:00:00'),
	"day" tinyint,
	constraint fk_shift_month foreign key (month, year) references months(month, year),
	constraint uq_shift_month_year unique (id, month, year)
);

-- 014_add_accounts_table.sql
create table accounts(
	id int identity(1,1) primary key,
	username varchar(255) not null,
	password varchar(255),
	constraint uq_username unique (username)
);

-- 015_add_customer_accounts_table.sql
create table customer_accounts(
	id int identity(1,1) primary key,
	username varchar(255) not null,
	total_points int not null default 0,
	account_status varchar(10) not null default 'active',
	latest_ordered_at datetime2,
	customer_id int,
	constraint fk_customer_base_account foreign key (username) references accounts(username),
	constraint fk_customer_id foreign key (customer_id) references customers(id),
	constraint uq_username_customer unique (username)
);

-- 016_add_order_vouchers_table.sql
create table order_vouchers (
	id int identity(1,1) primary key,
	order_id int,
	voucher_id int,
	constraint uq_order_voucher unique (order_id),
	constraint fk_voucher_order foreign key (order_id) references orders(id),
	constraint fk_voucher_id foreign key (voucher_id) references vouchers(id)
);

-- 017_add_menu_items_table.sql
create table menu_items(
	id int identity(1,1) primary key,
	item_id int,
	menu_id int,
	price int,
	constraint uq_item_menu unique (item_id, menu_id),
	constraint fk_menu_item_id foreign key (item_id) references items(id),
	constraint fk_meny_id foreign key (menu_id) references menus(id)
);

-- 018_add_order_items_table.sql
create table order_items(
	id int identity(1,1) primary key,
	order_id int,
	item_id int,
	actual_price int,
	quantity int,
	constraint uq_item_order unique (order_id, item_id),
	constraint fk_order_id foreign key (order_id) references orders(id),
	constraint fk_order_item_id foreign key (item_id) references items(id)
);

-- 019_add_employee_accounts_table.sql
create table employee_accounts(
	id int identity(1,1) primary key,
	username varchar(255),
	salary money,
	address varchar(255),
	dob datetime2,
	account_type varchar(100),
	last_name varchar(255),
	first_name varchar(255),
	sex varchar(20),
	started_date datetime2,
	ssn varchar(9),
	employee_type varchar(20),
	store_id int,
	status bit default 1,
	constraint uq_username_employee_account unique (username),
	constraint uq_employee_ssn unique (ssn)
);

-- 020_add_stores_table.sql
create table stores(
	id int identity(1,1) primary key,
	manager_username varchar(255),
	store_name varchar(255),
	address varchar(255),
	store_number varchar(10),
	opened_time time check (opened_time >= '5:30:00'),
	closed_time time check (closed_time <= '23:30:00'),
	opened_date date,
	month_revenue money,
	no_employees smallint,
	constraint fk_manager_employee foreign key (manager_username) references employee_accounts(username)
);

-- 021_add_foreign_key_to_store_for_account.sql
alter table employee_accounts
add constraint fk_store_id foreign key (store_id) references stores(id);


-- 022_add_employee_shifts_table.sql
create table employee_shifts(
	id int identity(1,1) primary key,
	username varchar(255),
	shift_id int,
	"month" tinyint,
	"year" smallint,
	constraint fk_shift_emp_username foreign key (username) references employee_accounts(username),
	constraint uq_username_shift_month_year unique (username, shift_id, month, year),
	constraint fk_employee_shift foreign key (shift_id, month, year) references shifts(id, month, year)
);

-- 023_add-employee_numbers_table.sql
create table employee_numbers(
	id int identity(1,1) primary key,
	employee_username varchar(255),
	number varchar(10),
	constraint fk_emp_nums foreign key (employee_username) references accounts(username),
	constraint uq_employee_number unique (employee_username, number)
);

-- 024_add_directly_orders_table.sql
create table directly_orders(
	id int identity(1,1) primary key,
	order_id int,
	"change" money,
	customer_payment money,
	customer_id int,
	export_emp_username varchar(255),
	constraint fk_directly_order_id foreign key (order_id) references orders(id),
	constraint fk_directly_order_customer_id foreign key (customer_id) references customers(id),
	constraint fk_directly_oder_export_emp foreign key (export_emp_username) references employee_accounts(username)
);

-- 025_add_online_orders_table.sql
create table online_orders(
	id int identity(1,1) primary key,
	order_id int,
	status varchar(20),
	shipping_fee money,
	shipping_address varchar(255),
	predicted_arrived_time datetime2,
	customer_account_username varchar(255),
	export_employee_username varchar(255),
	shipping_employee_username varchar(255),
	discount_amount_by_point money,
	constraint fk_online_order_id foreign key (order_id) references orders(id),
	constraint fk_online_order_customer foreign key (customer_account_username) references customer_accounts(username),
	constraint fk_online_order_export_emp foreign key (export_employee_username) references employee_accounts(username),
	constraint fk_online_order_ship_emp foreign key (shipping_employee_username) references employee_accounts(username),
	constraint uq_online_order unique (order_id)
);