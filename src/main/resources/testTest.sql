/*Билет № 14. Есть таблица employee с колонками name, department, salary.
  Вывести максимальную и среднюю зарплату (salary) по каждому отделу,
  имеющему больше одного сотрудника */
CREATE TABLE Employees
(
    first_name    VARCHAR2(20),
    salary        NUMBER(8,2),
    department_id NUMBER(4)
);

SELECT department_id,
       ROUND(AVG(salary)) avg_salary,
       MAX(salary)        max_salary_on_departments
FROM employees
where DEPARTMENT_ID is not null
GROUP BY department_id
UNION
SELECT null as            department_id,
       ROUND(AVG(salary)) avg_salary,
       MAX(salary)        max_salary_on_departments
FROM employees

/* Выведите в одну строчку: максимальную и среднюю зарплату,
количество сотрудников и количество отделов, в которых состоят сотрудники.
Все значения вычисляем по всем сотрудникам таблицы employees */
SELECT MAX(salary),
       AVG(salary),
       COUNT(DISTINCT department_id)
FROM employees;