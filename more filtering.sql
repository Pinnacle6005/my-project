create database supermarket;
use supermarket;
-- 1️. Find Transactions Above the Average Sale Amount
SELECT Invoice_ID, Product_line, Total_sales
from supermarket_sales
where total_sales > (select avg(total_sales) from supermarket_sales)

-- 2️. Find the Product Line with the Highest Average Rating
SELECT Product_line, AVG(Rating) as Avg_Rating
from supermarket_sales
group by Product_line
Having Avg(Rating) = (
SELECT MAX(Avg_Rating) from (SELECT Product_line, AVG(Rating) as Avg_Rating
from supermarket_sales
group by Product_line) as rating_table);

-- Find the Most Popular Payment Method
SELECT Payment, count(*) as payment_count from supermarket_sales
group by payment
having Count(*) = (SELECT MAX(payment_count) from 
(select Payment, Count(*) as payment_count from supermarket_sales group by payment) as payment_table);

-- Find Branch That Generated More Revenue Than the Average Branch
SELECT Branch, Sum(Total_sales) as Revenue
from supermarket_sales
GROUP BY branch
having sum(Total_sales) > (SELECT AVG(Revenue) from (SELECT Branch, Sum(Total_sales) as Revenue
from supermarket_sales
GROUP BY branch) as revenue_table
);
-- Find the Day with the highest sales.
Select date_format(STR_TO_DATE(date, '%d/%m/%Y'), '%D') as Day, sum(Total_sales) as sales_total
from supermarket_sales 
group by Day
having sum(total_sales) = (select max(sales_total) from
(Select date_format(STR_TO_DATE(date, '%d/%m/%Y'), '%D') as Day, sum(Total_sales) as sales_total
from supermarket_sales 
group by Day) as highest_total_sales)
;
SELECT Date, sum(Total_sales) as sales_total
from supermarket_sales 
group by date
having sum(total_sales) = (select max(sales_total) from
(SELECT Date, sum(Total_sales) as sales_total
from supermarket_sales 
group by date) as highest_total_sales)
;
-- Find the Customer Type That Spends the Most on Average
-- Find the most frequent customer type in each branch
Select branch, customer_type, count(customer_type) as type_count from supermarket_sales
group by branch, customer_type
having count(customer_type) = (select max(type_count) from (Select branch, customer_type, count(customer_type) as type_count from supermarket_sales
group by branch, customer_type) as max_count
where max_count.branch = supermarket_sales.branch);

select * from supermarket.supermarket_sales;
select distinct branch from supermarket_sales;
select distinct payment from supermarket_sales;

-- Find the month with the highest total sales
Select MONTH(STR_TO_DATE(date, '%d/%m/%Y')) as month, sum(total_sales) as sales_total from supermarket_sales
Group by month
Having sum(total_sales) = (select max(sales_total) from (Select MONTH(STR_TO_DATE(date, '%d/%m/%Y')) as month, sum(total_sales) as sales_total from supermarket_sales
Group by month) as max_sales);

Select date_format(STR_TO_DATE(date, '%d/%m/%Y'), '%M') as month, sum(total_sales) as sales_total 
from supermarket_sales
Group by month
Having sum(total_sales) = (select max(sales_total) from (Select Date_Format(STR_TO_DATE(date, '%d/%m/%Y'), '%M') as month, sum(total_sales) as sales_total from supermarket_sales
Group by month) as max_sales);




-- Find the month with the highest total sales



