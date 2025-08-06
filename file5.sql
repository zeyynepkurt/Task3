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
),
char_parts AS (
  SELECT 
    department_name,
    SUBSTR(department_name, LENGTH(department_name) - level + 1, 1) AS chr,
    level AS position
  FROM departments_without_employees
  CONNECT BY level <= LENGTH(department_name)
    AND PRIOR department_name = department_name
    AND PRIOR DBMS_RANDOM.VALUE IS NOT NULL
),
reversed_names AS (
  SELECT 
    department_name,
    LISTAGG(chr, '') WITHIN GROUP (ORDER BY position) AS reversed_name
  FROM char_parts
  GROUP BY department_name
)
SELECT * FROM reversed_names;


