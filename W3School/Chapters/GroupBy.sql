--The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".

-- SELECT
--     *
-- FROM
--     customers;

-- --The following SQL statement lists the number of customers in each country, sorted high to low:
-- SELECT
--     count(customerid) AS "Count Customer's ID",
--     country
-- FROM
--     customers
-- GROUP BY Country
-- ORDER BY count(customerid) DESC
-- ;

--------------------------------
--GROUP BY With JOIN Example
-- SELECT
--     shipperid,
--     orderid
-- FROM
--     orders
-- ;

-- SELECT
--     shipperid,
--     shippername
-- FROM
--     shippers
-- ;

-- SELECT
--     Shippers.ShipperName,
--     COUNT(Orders.OrderID) AS NumberOfOrders
-- --    Orders.OrderID
-- FROM
--     Orders
--     LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
-- GROUP BY ShipperName;
-- ;

select * from customers;

select count(customerid) as CustomersCount,
country 
from customers
group by country
order by count(customerid) desc;