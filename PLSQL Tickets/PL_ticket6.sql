/*Ticket 7: List Employees in Department
Procedure: list_employees_in_dept 

Summary: Construct a procedure list_employees_in_dept that prints the names of all employees
in a given department using an explicit cursor. 
If the department has no employees, output a message indicating that no employees were found.*/

CREATE OR REPLACE PROCEDURE list_employees_in_dept(
    p_dept_id employees.dept_id%TYPE
)IS

CURSOR emp_cursor IS SELECT emp_name FROM employees WHERE dept_id=p_dept_id;
v_found BOOLEAN:= FALSE;
v_emp_name employees.emp_name%TYPE;
BEGIN
    OPEN emp_cursor;
        LOOP
            FETCH emp_cursor INTO v_emp_name;
            EXIT WHEN emp_cursor%NOTFOUND;
            v_found:=TRUE;   
            DBMS_OUTPUT.PUT_LINE(v_emp_name);

        END LOOP;
    CLOSE emp_cursor;
    IF NOT v_found THEN 
    DBMS_OUTPUT.PUT_LINE('no employees were found');
    END IF;
END;
/

BEGIN
    list_employees_in_dept(9);
END;
/

