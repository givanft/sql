-- The UNION operator is used to combine the result-set of two or more SELECT statements.
--  Every SELECT statement within UNION must have the same number of columns
--  The columns must also have similar data types
--  The columns in every SELECT statement must also be in the same order

SELECT
    --TOP 10
    city
FROM
    customers
WHERE city LIKE 'b%'
ORDER BY city
;

SELECT
    --TOP 10
    city
FROM
    suppliers
WHERE city LIKE 'b%'
ORDER BY city
;

    SELECT
        --TOP 10
        City
    FROM
        Customers
    WHERE city LIKE 'b%'
UNION
--UNION ALL
    SELECT
        --TOP 10
        City
    FROM
        Suppliers
    WHERE city LIKE 'b%'
ORDER BY City
;