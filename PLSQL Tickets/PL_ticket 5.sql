/*Ticket 6: Delete Employee
Procedure: delete_employee

Summary: Design a procedure delete_employee that deletes an employee based on the provided employee ID.
 After attempting deletion, the procedure must report whether an employee was successfully deleted or
 if no matching employee was found.*/

CREATE OR REPLACE PROCEDURE delete_employee(
    p_emp_id IN employees.emp_id%TYPE
)IS
BEGIN
    DELETE FROM employees WHERE emp_id = p_emp_id;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No matching employee was found.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee was successfully deleted.');
    END IF;
END;
/

BEGIN
    delete_employee(111);
END;
/