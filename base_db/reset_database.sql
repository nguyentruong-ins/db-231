drop table if exists online_orders;
drop table if exists directly_orders;
drop table if exists employee_numbers;
drop table if exists employee_shifts;
	
if object_id('dbo.employee_accounts', 'u') is not null
    alter table employee_accounts
    drop constraint fk_store_id;

drop table if exists stores;
drop table if exists employee_accounts;
drop table if exists order_items;
drop table if exists menu_items;
drop table if exists order_vouchers;
drop table if exists customer_accounts;
drop table if exists accounts;
drop table if exists shifts;
drop table if exists months;
drop table if exists customer_addresses;
drop table if exists customers;
drop table if exists memberships;
drop table if exists vouchers;
drop table if exists orders;
drop table if exists menus;
drop table if exists item_has_toppings;
drop table if exists item_has_ingredients;
drop table if exists items;
drop table if exists categories;
drop table if exists ingredients;

DROP PROCEDURE IF EXISTS GetCustomersWithLargestTotalAmount;