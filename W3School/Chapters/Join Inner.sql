SELECT
    customerid,
    customername
FROM
    customers
WHERE customerid IN (1,2,3,4,5,6,7)
ORDER BY customerid
;

SELECT
    customerid,
    orderid,
    shipperID
FROM
    orders
WHERE customerid IN (1,2,3,4,5,6,7)
ORDER BY customerid
;

SELECT
    TOP 12
    customers.customerid,
    customers.customername,
    orders.orderid
FROM
    customers
    FULL JOIN orders ON customers.customerid=orders.customerid
ORDER BY customers.customerid
;

SELECT
    TOP 12
    Customers.Customerid,
    Customers.CustomerName,
    Orders.OrderID
FROM
    Customers
    FULL JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.Customerid;