USE tienda;

-- Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias "Apellidos"
SELECT contact_last_name AS Apellidos
FROM customers
UNION
SELECT last_name AS Apellidos
FROM employees;

-- Selecciona los nombres y apellidos que se encuentren en ambas tablas para employees y customers, con alias "Nombre" y "Apellidos"
SELECT contact_first_name AS Nombres , contact_last_name AS Apellidos
FROM customers
UNION
SELECT first_name AS Nombres , last_name AS Apellidos
FROM employees;

-- Selecciona todos los nombres y apellidos que se encuentren en ambas tablas para employees y customers, con alias "Nombre" y "Apellidos"
SELECT contact_first_name AS Nombres , contact_last_name AS Apellidos
FROM customers
UNION ALL
SELECT first_name AS Nombres , last_name AS Apellidos
FROM employees;

-- Selecciona employee_number como Numero empleado, first_name como Nombre Empleado y last_name como Apellido Empleado para los empleados con employee_number: 1002, 1076, 1088 y 1612
SELECT employee_number AS "Numero Empleado" , first_name AS "Nombre Empleado" , last_name AS "Apellido Empleado"
FROM employees
WHERE employee_number IN (1002, 1076, 1088 , 1612);

-- Queremos ver ahora la ciudad y los nombres de las empresas como Nombres de la Empresa de la tabla customers, que no estén en Ireland, France ni Germany
SELECT city AS Ciudad , customer_name AS "Nombre de la Empresa"
FROM customers
WHERE country NOT IN ("Ireland" , "France" , "Germany");

-- Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de customers que terminen en 'on'
SELECT city AS Ciudad , customer_name AS "Nombre de la Empresa"
FROM customers
WHERE city LIKE "%on";

-- Encuentra los campos nombre del cliente, ciudad, de aquellas ciudades de la tabla de customers que terminen en "on" y tengan una longitud de 4.
SELECT city AS Ciudad , customer_name AS "Nombre de la Empresa"
FROM customers
WHERE city LIKE "_ _on";

-- Encuentra el nombre del cliente, primera direccion y ciudad de aquellas ciudades que contengan el numero 3 en su dirección postal (o lo que es lo mismo, su primera direccion)
SELECT address_line1 AS "Primera direccion", city AS Ciudad
FROM customers
WHERE address_line1 LIKE "%3%";

-- Encuentra el nombre del cliente, primera direccion y ciudad de aquellas ciudades que contengan el numero 3 en su dirección postal (o lo que es lo mismo, su primera direccion) y que la ciudad no empiece por T
SELECT address_line1 AS "Primera direccion", city AS Ciudad
FROM customers
WHERE address_line1 LIKE "%3%"
AND city NOT LIKE "T%";

-- Selecciona, haciendo uso de expresiones regulares, los campos nombre del cliente, primera dirección y ciudad, pero sólo en el caso de que la dirección posea algún numero en dicho campo
SELECT customer_name AS "Nombre Cliente" , address_line1 AS "Primera direccion", city AS Ciudad
FROM customers
WHERE address_line1 REGEXP "[0-9]";

