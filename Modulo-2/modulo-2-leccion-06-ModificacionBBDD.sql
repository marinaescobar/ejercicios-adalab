-- Crea una tabla
CREATE TABLE t1 (a INTEGER, b CHAR(10));

-- Cambia el nombre de una tabla
ALTER TABLE t1
RENAME TO t2;

-- Modifica el tipo de dato de una columna
ALTER TABLE t2
MODIFY COLUMN a TINYINT NOT NULL;

-- Cambia el nombre y tipo de dato de una columna
ALTER TABLE t2
CHANGE b c CHAR(20);

-- Añade una columna nueva
ALTER TABLE t2
ADD COLUMN d TIMESTAMP;

-- Elimina una columna
ALTER TABLE t2
DROP COLUMN c;

-- Crea una nueva tabla a partir de otra
CREATE TABLE IF NOT EXISTS t3 
SELECT * 
FROM t2;

-- Elimina una tabla
DROP TABLE IF EXISTS t2;

ALTER TABLE t3
RENAME TO t1;