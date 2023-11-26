if object_id('dbo.online_orders', 'u') is not null
	drop table online_orders;
	
if object_id('dbo.directly_orders', 'u') is not null
	drop table directly_orders;
	
if object_id('dbo.employee_numbers', 'u') is not null
	drop table employee_numbers;
	
if object_id('dbo.employee_shifts', 'u') is not null
	drop table employee_shifts;
	
alter table employee_accounts
drop constraint fk_store_id;

if object_id('dbo.stores', 'u') is not null
	drop table stores;

if object_id('dbo.employee_accounts', 'u') is not null
	drop table employee_accounts;
	
if object_id('dbo.order_items', 'u') is not null
	drop table order_items;

if object_id('dbo.menu_items', 'u') is not null
	drop table menu_items;

if object_id('dbo.order_vouchers', 'u') is not null
	drop table order_vouchers;

if object_id('dbo.customer_accounts', 'u') is not null
	drop table customer_accounts;

if object_id('dbo.accounts', 'u') is not null
	drop table accounts;

if object_id('dbo.shifts', 'u') is not null
	drop table shifts;

if object_id('dbo.months', 'u') is not null
	drop table months;

if object_id('dbo.customer_addresses', 'u') is not null
	drop table customer_addresses;

if object_id('dbo.customers', 'u') is not null
	drop table customers;

if object_id('dbo.memberships', 'u') is not null
	drop table memberships;

if object_id('dbo.vouchers', 'u') is not null
	drop table vouchers;

if object_id('dbo.orders', 'u') is not null
	drop table orders;

if object_id('dbo.menus', 'u') is not null
	drop table menus;

if object_id('dbo.item_has_toppings', 'u') is not null
	drop table item_has_toppings;

if object_id('dbo.item_has_ingredients', 'u') is not null
	drop table item_has_ingredients;

if object_id('dbo.items', 'u') is not null
	drop table items;

if object_id('dbo.categories', 'u') is not null
	drop table categories;

if object_id('dbo.ingredients', 'u') is not null
	drop table ingredients;
