-- Update Employee infor procedure -- 

CREATE OR ALTER PROCEDURE UpdateEmployeeAccount
@username varchar(255),
@new_password varchar(255) = NULL,
@new_salary money = NULL,
@new_dob datetime2 = NULL,
@new_employee_type varchar(20) = NULL,
@new_account_type varchar(100) = NULL,
@old_number varchar(10) = NULL,
@new_number varchar(10) = NULL,
@new_first_name varchar(255) = NULL,
@new_last_name varchar(255) = NULL,
@new_address varchar(255) = NULL,
@new_sex varchar(20) = NULL,
@new_started_date datetime2 = NULL,
@new_ssn varchar(9) = NULL,
@new_store_id int = NULL,
@new_status bit = NULL,
@age int = 0,
@count int = 0,
@isError bit = 0
AS 
BEGIN 
	-- Check age
	if @new_dob IS NOT NULL 
	BEGIN 
		SELECT @age=(CONVERT(int,CONVERT(char(8),GETDATE(),112)) - (CONVERT(char(8), @new_dob, 112)))/10000;
		if @age < 18
		BEGIN
			SET @isError = 1;			
			raiserror ('Employee age must larger than 18', 16, 1);	
		END
		
	END
	
	-- Check acocunt type
	if @new_employee_type IS NOT NULL
		if not (@new_employee_type = 'PARTTIME' or @new_employee_type = 'FULLTIME')
		BEGIN 
			SET @isError = 1;
			RAISERROR ('Employee type must be PARTTIME or FULLTIME', 16, 1);			
		END
		
	
	-- Check employee type
	if @new_account_type IS NOT NULL
		if not (@new_account_type = 'SHIPPER' or @new_account_type = 'MANAGER' or @new_account_type = 'EMPLOYEE')
		BEGIN 
			SET @isError = 1;
			RAISERROR ('Account type must be SHIPPER or MANAGER or EMPLOYEE', 16, 1);			
		END
		
		
	-- Check sex type
	if @new_sex IS NOT NULL
		if not (@new_sex = 'MALE' or @new_sex = 'FEMALE' or @new_sex = 'OTHER')
		BEGIN 
			SET @isError = 1;			
			RAISERROR ('Sex must be MALE, FEMALE or OTHER', 16, 1);
		END
		
	
	-- Check started date
	if @new_started_date IS NOT NULL
		if @new_started_date > GETDATE()
		BEGIN
			SET @isError = 1;			
			raiserror ('Started date must before current date', 16, 1);
		END
		
	
	if @new_ssn IS NOT NULL
	BEGIN
		SELECT @count = COUNT(*) from employee_accounts where ssn = @new_ssn and username != @username;
		if @count > 0
		BEGIN
			SET @isError = 1;			
			RAISERROR ('New ssn is duplicated', 16, 1);	
		END
		
	END
		
	
	if @new_number IS NOT NULL
	BEGIN
		SELECT @count = COUNT(*) from employee_numbers where number = @new_number and employee_username != @username;
		if @count > 0
		BEGIN
			SET @isError = 1;			
			RAISERROR ('New number is duplicated', 16, 1);	
		END
		
	END
	
	if @new_store_id IS NOT NULL
	BEGIN		
		SELECT @count = COUNT(*) from stores where id=@new_store_id 
		if @count = 0 
		BEGIN 
			SET @isError = 1;			
			RAISERROR ('Cant find store id', 16, 1);
		END
		
	END
	
	SELECT @count = COUNT(*) FROM accounts WHERE username = @username
	if @count = 0
	BEGIN 
		SET @isError = 1;
		RAISERROR('Cant find employee username', 16, 1);
	END
	
	if @isError != 1
	BEGIN		
		UPDATE employee_accounts SET 
			salary = ISNULL(@new_salary, salary),
			address = ISNULL(@new_address, address),
			dob = ISNULL(@new_dob, dob),
			account_type = ISNULL(@new_account_type, account_type),
			last_name = ISNULL(@new_last_name, last_name),
			first_name = ISNULL(@new_first_name, first_name),
			sex = ISNULL(@new_sex, sex),
			started_date = ISNULL(@new_started_date, started_date),
			ssn = ISNULL(@new_ssn, ssn),
			employee_type = ISNULL(@new_employee_type, employee_type),
			store_id = ISNULL(@new_store_id, store_id),
			status = ISNULL(@new_status, status)
		WHERE username = @username
		
		UPDATE employee_numbers SET 
			number = ISNULL(@new_number, number)
		WHERE number = @old_number AND employee_username = @username
		
		UPDATE accounts SET 
			password = ISNULL(@new_password, password)
		WHERE username = @username
	END
END

-- TEST SQL --

-- EXEC UpdateEmployeeAccount
-- @username = 'nguyen.truong', 
-- @new_password = '1234569999',
-- @new_salary = 1999999,
-- @new_dob = '2003/11/12',
-- @new_employee_type = 'FULLTIME',
-- @new_account_type = 'EMPLOYEE',
-- @old_number = '0945430559',
-- @new_number = '0945430444',
-- @new_first_name = 'Nguyen',
-- @new_last_name = 'Truong',
-- @new_sex = 'MALE',
-- @new_started_date = '2020/11/20',
-- @new_ssn = '0870003',
-- @new_address = 'Dorm A',
-- @new_store_id = 1;

------------------------------------------------