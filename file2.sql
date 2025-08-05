WITH dept_locations AS (
  SELECT d.department_id, d.location_id
  FROM HR.DEPARTMENTS d
),
emp_locations AS (
  SELECT e.employee_id, dl.location_id
  FROM HR.EMPLOYEES e
    JOIN dept_locations dl ON e.department_id = dl.department_id
),
location_counts AS (
  SELECT location_id, COUNT(employee_id) AS employee_count
  FROM emp_locations
  GROUP BY location_id
)
SELECT l.location_id, l.city,
  NVL(lc.employee_count, 0) AS employee_count
FROM HR.LOCATIONS l
    LEFT JOIN location_counts lc ON l.location_id = lc.location_id;
