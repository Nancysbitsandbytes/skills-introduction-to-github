/* Ticket 8: Batch Raise Salaries by Department
Procedure: raise_salaries_by_dept

Summary: Create a procedure raise_salaries_by_dept that raises the salary of all employees in a specific department by a given percentage. 
The procedure must also print the number of employees whose salaries were updated.*/

CREATE OR REPLACE PROCEDURE raise_salaries_by_dept(
    p_dept_id employees.dept_id%TYPE,
    p_salary_pct NUMBER

)IS

BEGIN
    UPDATE employees SET salary=salary(1+p_salary_pct/100) WHERE dept_id=p_dept_id;

END;
/
