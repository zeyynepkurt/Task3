WITH ranked_employees AS (
  SELECT
    employee_id,
    first_name,
    last_name,
    department_id,
    salary,
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
  FROM HR.EMPLOYEES
)
SELECT
  employee_id,
  first_name,
  last_name,
  department_id,
  salary
FROM ranked_employees
WHERE salary_rank = 1;
