WITH all_departments AS (
  SELECT department_id, department_name
  FROM HR.DEPARTMENTS
),
departments_with_employees AS (
  SELECT DISTINCT department_id
  FROM HR.EMPLOYEES
),
departments_without_employees AS (
  SELECT ad.department_name
  FROM all_departments ad
  LEFT JOIN departments_with_employees dwe
    ON ad.department_id = dwe.department_id
  WHERE dwe.department_id IS NULL
)
SELECT 
  SUBSTR(department_name, 5, 1) AS fifth_letter
FROM departments_without_employees;
