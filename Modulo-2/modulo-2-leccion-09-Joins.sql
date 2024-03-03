USE tienda;

-- Ejercicio 1: Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
CROSS JOIN customers
WHERE employees.employee_number =  customers.sales_rep_employee_number;

-- Ejercicio 2: Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
CROSS JOIN customers
WHERE employees.employee_number =  customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(customers.customer_number) > 8;

-- Ejercicio 3: Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
CROSS JOIN customers
WHERE employees.employee_number =  customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(customers.country) > 1;

-- Ejercicio 4: Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas usando INNER JOIN
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
INNER JOIN customers
ON employees.employee_number =  customers.sales_rep_employee_number;

-- Ejercicio 5: Selecciona el ID, nombre, apellidos de las empleadas para aquellas con más de 8 clientes usando INNER JOIN
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
INNER JOIN customers
ON employees.employee_number =  customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(customers.customer_number) > 8;

-- Ejercicio 6: Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
INNER JOIN customers
ON employees.employee_number =  customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(customers.country) > 1;

-- Ejercicio 7: Selecciona el nombre y apellidos de las empleadas y el ID de cliente asociado, si es que lo tienen
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
LEFT JOIN customers 
ON employees.employee_number = customers.sales_rep_employee_number;

-- Ejercicio 8: Selecciona el ID de todos los clientes, el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay)
SELECT customers.customer_number, employees.first_name, employees.last_name
FROM employees
RIGHT JOIN customers 
ON customers.sales_rep_employee_number = employees.employee_number;

-- Ejercicio 9: Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes usando LEFT JOIN
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
LEFT JOIN customers 
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(customers.sales_rep_employee_number) > 8;

-- Ejercicio 10: Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
RIGHT JOIN customers 
ON customers.sales_rep_employee_number = employees.employee_number
GROUP BY employees.employee_number
HAVING COUNT(customers.sales_rep_employee_number) > 8;

-- Ejercicio 11: Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
LEFT JOIN customers 
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(customers.country) > 1;

