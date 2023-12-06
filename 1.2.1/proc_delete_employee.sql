-- Remove Employee account procedure --

CREATE OR ALTER PROCEDURE RemoveEmployeeAccount
@username varchar(20),
@count int = 0
AS 
BEGIN 
	SELECT @count = COUNT(*) FROM employee_accounts WHERE username = @username AND status != 0
	if @count = 0
	BEGIN 
		RAISERROR('Cant find employee username', 16, 1);
	END
	ELSE
	BEGIN
		UPDATE employee_accounts 
			SET	status = 0
		WHERE username = @username	
	END
END

-- TEST SQL -- 

-- EXEC RemoveEmployeeAccount 'nguyen.truong5';

------------------------------------------------