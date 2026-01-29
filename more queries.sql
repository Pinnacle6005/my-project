use ordersdb;
-- Find total revenue generated from each city and state.
select sum(quantity*costpercookie) as Totalrevenue, city, state
from orders
group by city, state
order by Totalrevenue;
-- Find orders from customers in California (AL).
select orderID, ordertotal, customername, city, state
from orders
where state = 'AL';
-- Find orders from customers in California, New York, or Texas.
select orderID, ordertotal, state, city
from orders
where state IN ('CA', 'NY', 'TX');
-- Finds all customers whose name contains "Shop".
select customerId, customername 
from orders
where customername like '%shop%';
-- What is the Top 5 Most Expensive Orders
select orderid, ordertotal, customername
from orders
order by ordertotal desc
limit 5;
-- Calculate the total revenue per customer and sorts from highest to lowest.
select sum(quantity*costpercookie) as Totalrevenue, customername
from orders
group by customername
order by totalrevenue desc
-- Find orders over $2,000 from California or New York.
select ordertotal, state, city
from orders
where State = 'CA' or State = 'NY'
and ordertotal >2000;
