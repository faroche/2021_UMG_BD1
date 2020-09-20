CREATE TABLE table_a
(data_a INT)

CREATE TABLE table_b
(data_b INT)

INSERT INTO table_a
VALUES (1),(2),(3),(4)

INSERT INTO table_b
VALUES (5),(1),(6),(2)

SET NOCOUNT ON
--INNER JOIN
PRINT 'INNER JOIN'
SELECT ta.dato_a, tb.dato_b
FROM table_a ta
INNER JOIN table_b tb ON ta.dato_a = tb.dato_b

--LEFT JOIN / LEFT [OUTER] JOIN
PRINT 'LEFT JOIN'
SELECT ta.dato_a, tb.dato_b
FROM table_a ta
LEFT JOIN table_b tb ON ta.dato_a = tb.dato_b

--LEFT EXCLUDING JOIN
PRINT 'LEFT EXCLUDING JOIN'
SELECT ta.dato_a, tb.dato_b
FROM table_a ta
LEFT JOIN table_b tb ON ta.dato_a = tb.dato_b
WHERE tb.dato_b IS NULL

--RIGHT JOIN / RIGHT [OUTER] JOIN
PRINT 'RIGHT JOIN'
SELECT ta.dato_a, tb.dato_b
FROM table_a ta
RIGHT JOIN table_b tb ON ta.dato_a = tb.dato_b

--RIGHT EXCLUDING JOIN
PRINT 'RIGHT EXCLUDING JOIN'
SELECT ta.dato_a, tb.dato_b
FROM table_a ta
RIGHT JOIN table_b tb ON ta.dato_a = tb.dato_b
WHERE ta.dato_a IS NULL

--FULL JOIN / FULL [OUTER] JOIN
PRINT 'FULL JOIN'
SELECT ta.dato_a, tb.dato_b
FROM table_a ta
FULL JOIN table_b tb ON ta.dato_a = tb.dato_b
-- USING UNION
SELECT ta.dato_a, tb.dato_b
FROM table_a ta
LEFT JOIN table_b tb ON ta.dato_a = tb.dato_b
UNION 
SELECT ta.dato_a, tb.dato_b
FROM table_a ta
RIGHT JOIN table_b tb ON ta.dato_a = tb.dato_b

--CROSS JOIN 
PRINT 'CROSS JOIN'
SELECT ta.dato_a, tb.dato_b
FROM table_a ta
CROSS JOIN table_b tb

--OUTER EXCLUDING JOIN
PRINT 'OUTER EXCLUDING JOIN'
SELECT ta.dato_a, tb.dato_b
FROM table_a ta
FULL JOIN table_b tb ON ta.dato_a = tb.dato_b
WHERE ta.dato_a IS NULL OR tb.dato_b IS NULL

SET NOCOUNT OFF