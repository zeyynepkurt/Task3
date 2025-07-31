WITH salary_ranked AS (
  SELECT 
    employee_id,
    first_name,
    last_name,
    department_id,
    salary,
    MAX(salary) OVER (PARTITION BY department_id) AS max_dept_salary
  FROM HR.EMPLOYEES
)
SELECT 
  employee_id,
  first_name,
  last_name,
  department_id,
  salary
FROM salary_ranked
WHERE salary = max_dept_salary;
