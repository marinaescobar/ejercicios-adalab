USE tienda;

-- Ejercicio 1. Calcula el numero de clientes por cada ciudad
SELECT COUNT(customer_number) AS NumeroClientes , city AS Ciudad
FROM customers
GROUP BY city;

-- Ejercicio 2. Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor número de clientes
SELECT city AS CiudadMayorNumClientes
FROM customers AS C1
GROUP BY city
HAVING COUNT(customer_number) >= ALL (
    SELECT COUNT(customer_number) 
    FROM customers AS C2
    GROUP BY city
);

-- Ejercicio 3. Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las clientes asignadas a la ciudad con mayor numero de clientas
SELECT customer_number , contact_first_name , contact_last_name
FROM customers AS C0
WHERE city IN (
	SELECT city AS CiudadMayorNumClientes
	FROM customers AS C1
	GROUP BY city
	HAVING COUNT(customer_number) >= ALL (
		SELECT COUNT(customer_number) 
		FROM customers AS C2
		GROUP BY city)
);

-- Ejercicio 4. Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. 
-- Para ello selecciona employeeNumber como 'Numero empleado', firstName como 'Nombre empleado' y lastName como 'Apellido Empleado'
SELECT employee_number AS "Numero empleado", first_name AS "Nombre empleado", last_name AS "Apellido empleado"
FROM employees AS Em
WHERE Em.employee_number IN (
	SELECT sales_rep_employee_number
    FROM customers AS Cu
    WHERE sales_rep_employee_number IS NOT NULL
);