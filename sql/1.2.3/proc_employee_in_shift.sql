CREATE OR ALTER PROCEDURE GetEmployeesByShiftId
    @shiftId INT
AS
BEGIN
    WITH EmployeesInAShift AS (
        SELECT 
			ea.id,
            ea.first_name, 
			ea.last_name,
			ea.sex
        FROM
            employee_shifts es
			JOIN employee_accounts ea ON es.username = ea.username
        WHERE
            es.shift_id = @shiftId
    )

    SELECT *
    FROM EmployeesInAShift;
END;

-- EXEC GetEmployeesByShiftId 9;