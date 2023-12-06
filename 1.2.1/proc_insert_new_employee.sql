-- INSERT New employee procedure --

CREATE OR ALTER PROCEDURE InsertNewEmployeeAccount
@username varchar(255),
@password varchar(255),
@salary money,
@dob datetime2,
@account_type varchar(100),
@employee_type varchar(20),
@last_name varchar(255),
@first_name varchar(255),
@sex varchar(20),
@number varchar(10),
@address varchar(255),
@started_date datetime2,
@ssn varchar(9),
@store_id int,
@count int = 0,
@age int=0,
@isError bit = 0
as
BEGIN
	-- check duplicated username
	SELECT @count=COUNT(*) from accounts where username=@username;
	if @count > 0
	BEGIN
		SET @isError = 1;
		raiserror ('Duplicated username', 16, 1);		
	END
	

	-- Check age
	SELECT @age=(CONVERT(int,CONVERT(char(8),GETDATE(),112)) - (CONVERT(char(8), @dob, 112)))/10000;
	if @age < 18
	BEGIN
		SET @isError = 1;
		raiserror ('Employee age must larger than 18', 16, 1);		
	END
	
	
	-- Check acocunt type
	if not (@employee_type = 'PARTTIME' or @employee_type = 'FULLTIME')
	BEGIN 
		SET @isError = 1;
		RAISERROR ('Employee type must be FULLTIME or PARTTIME', 16, 1);		
	END
	
	
	-- Check employee type
	if not (@account_type = 'SHIPPER' or @account_type = 'MANAGER' or @account_type = 'EMPLOYEE')
	BEGIN 	
		SET @isError = 1;	
		RAISERROR ('Account type must be SHIPPER or MANAGER or EMPLOYEE', 16, 1);
	END
	
		
	-- Check sex type
	if not (@sex = 'MALE' or @sex = 'FEMALE' or @sex = 'OTHER')
	BEGIN 
		SET @isError = 1;
		RAISERROR ('Sex must be MALE, FEMALE or OTHER', 16, 1);		
	END
	
	
	-- Check started date
	if @started_date > GETDATE()
	BEGIN
		SET @isError = 1;
		raiserror ('Started date must before current date', 16, 1);		
	END
	
	
	SELECT @count = COUNT(*) from employee_accounts where ssn = @ssn
	if @count > 0
	BEGIN 
		SET @isError = 1;
		RAISERROR ('Duplicated ssn', 16, 1);		
	END
	
	
	SELECT @count = COUNT(*) from employee_numbers where number=@number
	if @count > 0
	BEGIN 
		SET @isError = 1;
		RAISERROR ('Number is duplicated', 16, 1);		
	END
	
	
	SELECT @count = COUNT(*) from stores where id = @store_id 
	if @count = 0 
	BEGIN 
		SET @isError = 1;
		RAISERROR ('Cant find store id', 16, 1);		
	END
	
	if @isError = 0
	BEGIN
		INSERT INTO accounts VALUES (@username, @password);
		INSERT INTO employee_accounts (username, salary, address, dob, account_type, last_name, first_name, sex, started_date, ssn, employee_type, store_id)
								VALUES (@username, @salary, @address, @dob, @account_type, @last_name, @first_name, @sex, @started_date, @ssn, @employee_type, @store_id);
		INSERT INTO employee_numbers VALUES (@username, @number);		
	END
END

-- TEST SQL ---

-- EXEC InsertNewEmployeeAccount 
-- @username = 'nguyen.truong1', 
-- @password = '123456',
-- @salary = 10000000,
-- @dob = '2002/10/11',
-- @employee_type = 'FULLTIME',
-- @account_type = 'EMPLOYEE',
-- @number = '0945430551',
-- @first_name = 'Nguyen',
-- @last_name = 'Truong',
-- @sex = 'MALE',
-- @started_date = '2020/11/20',
-- @ssn = '0870002',
-- @address = 'Dorm A',
-- @store_id = 1;

------------------------------------------------