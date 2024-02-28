USE tienda;

-- Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos
SELECT MIN(`customer_number`) AS `NumeroCMRMasBajo`
FROM customers;

-- Selecciona el limite de crédito medio para los clientes de España.
SELECT AVG(`credit_limit`) AS `LimiteCreditoMedio`, `country`
FROM customers
GROUP BY `country`
HAVING `country` = "Spain";

-- Selecciona el numero de clientes en Francia
SELECT COUNT(`customer_number`) AS `ClientesFrancia`
FROM customers
WHERE `country` = "France";

-- Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323
SELECT `customer_number` , MAX(`credit_limit`) AS `MaxCredito`, `sales_rep_employee_number`
FROM customers
GROUP BY `customer_number`
HAVING `sales_rep_employee_number` = 1323;

-- ¿Cuál es el número máximo de empleado de la tabla customers?
SELECT MAX(`sales_rep_employee_number`) AS `MaxNumEmpleado`
FROM customers;

-- Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, así como el número de clientes distintos que tiene cada uno
SELECT `sales_rep_employee_number` , COUNT(DISTINCT(`customer_number`)) AS `ClientesUnicos`
FROM customers
GROUP BY `sales_rep_employee_number`;

-- Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.
SELECT `sales_rep_employee_number` , COUNT(DISTINCT(`customer_number`)) AS `ClientesUnicos`
FROM customers
GROUP BY `sales_rep_employee_number`
HAVING `ClientesUnicos` > 7;

-- Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos
SELECT `sales_rep_employee_number`, COUNT(DISTINCT(`customer_number`)) AS `ClientesUnicos`,
CASE 
	WHEN COUNT(DISTINCT(`customer_number`)) > 7 THEN 'AltoRendimiento'
	ELSE ''
END AS `TipoRendimiento`
FROM customers
GROUP BY `sales_rep_employee_number`;

-- Selecciona el número de clientes en cada pais.
SELECT COUNT(`customer_number`) AS `ClientesPais` , `country`
FROM customers
GROUP BY `country`;

-- Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.
SELECT `country`
FROM customers
GROUP BY `country`
HAVING COUNT(DISTINCT(`city`)) > 3;

