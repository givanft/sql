SELECT
    TOP 13
    customerid,
    customername
FROM
    customers
ORDER BY customerid
;

SELECT
    TOP 21
    customerid,
    orderid
FROM
    orders
ORDER BY customerid
;

SELECT
    TOP 24
    customers.customerid,
    customers.customername,
    orders.orderid
FROM
    customers
    LEFT JOIN orders ON customers.customerid=orders.customerid
    --RIGHT JOIN orders ON customers.customerid=orders.customerid
ORDER BY customers.customerid
;
