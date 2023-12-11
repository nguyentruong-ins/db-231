--Trigger update no_employees in particular store
CREATE OR ALTER TRIGGER UpdateNoEmployees
ON dbo.employee_accounts
FOR INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	-- Update no_employee when store_id changed
	IF (SELECT COUNT(*) FROM INSERTED i, DELETED d WHERE i.store_id != d.store_id) > 0
	BEGIN
        UPDATE dbo.stores
        SET no_employees = no_employees + 1
		FROM dbo.stores t, inserted i
		WHERE i.store_id = t.id;
        
		UPDATE dbo.stores
        SET no_employees = no_employees - 1
		FROM dbo.stores t, deleted d
		WHERE d.store_id = t.id;
		PRINT('An employee changed store');
    END

    -- Increase no_employee when INSERTED
    ELSE IF (SELECT COUNT(*) FROM INSERTED WHERE status = 1) > 0
    BEGIN
        UPDATE dbo.stores
        SET no_employees = no_employees + 1
		FROM dbo.stores t, inserted i
		WHERE i.store_id = t.id;
        --WHERE id IN (SELECT store_id FROM INSERTED);
		PRINT('no_employee increased');
    END

    -- Decrease no_employee when UPDATE with status = 0
    ELSE IF (SELECT COUNT(*) FROM INSERTED WHERE status = 0) > 0
    BEGIN
        UPDATE dbo.stores
        SET no_employees = no_employees - 1
        FROM dbo.stores t, inserted i, deleted d
		WHERE i.store_id = t.id AND i.status = 0 AND d.status = 1;
		--WHERE id IN (SELECT store_id FROM UPDATED WHERE status = 0);
		PRINT('no_employee decreased');
    END
END;
GO

--Test trigger no_employee
INSERT INTO accounts (username, password) values ('employee7', 'password7');
INSERT INTO accounts (username, password) values ('employee8', 'password8');

INSERT INTO employee_accounts (username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id) values ('employee7', 11000000, '...', convert(datetime, '7/4/2000', 103), 'SHIPPER', 'Saunderson', 'Rainsden', 'MALE', '1-30-2021', '111111117', 'FULLTIME', 1);
INSERT INTO employee_accounts (username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id) values ('employee8', 11000000, '...', convert(datetime, '7/4/2000', 103), 'SHIPPER', 'Saunderson', 'Raiden', 'FEMALE', '1-30-2021', '111111118', 'FULLTIME', 2);
UPDATE employee_accounts (username, salary, address, dob, account_type, first_name, last_name, sex, started_date, ssn, employee_type, store_id) values ('employee8', 11000000, '...', convert(datetime, '7/4/2000', 103), 'SHIPPER', 'Saunderson', 'Raiden', 'FEMALE', '1-30-2021', '111111118', 'FULLTIME', 2);

UPDATE employee_accounts
SET store_id = 2
WHERE username = 'employee8'

