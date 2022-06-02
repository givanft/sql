SELECT
    customerid,
    orderid,
    orderdate
FROM
    orders
WHERE customerid IN (1,2,3,4,5,6,7)
ORDER BY customerid
;

SELECT
    customerid,
    customername,
    contactname,
    country
FROM
    customers
WHERE customerid IN (1,2,3,4,5,6,7)
ORDER BY CustomerID
;

SELECT
    customers.customerid,
    customers.customername,
    orders.orderid,
    orders.orderdate
FROM
    orders
    INNER JOIN customers ON orders.customerid=customers.CustomerID
WHERE customers.customerid IN (1,2,3,4,5,6,7)
ORDER BY customers.customerid
;
