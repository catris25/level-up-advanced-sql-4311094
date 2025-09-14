-- 1
-- Get a list of sales people and rank the car models
-- they have sold the most of

-- select e.employeeId, e.firstName, e.lastName, m.model, count(m.model) as numbersSold,
-- rank() over (PARTITION by s.employeeId order by count(m.model) desc) as rankModel
-- from sales s
-- join employee e
-- on e.employeeId = s.employeeId
-- join inventory i 
-- on i.inventoryId = s.inventoryId
-- join model m
-- on m.modelId = i.modelId
-- group by e.employeeId, e.firstName, e.lastName, m.model

-- 2
-- Generate a report that shows total sales per month
-- and annual running total

-- with cte as (select strftime('%Y', s.soldDate) as year,
-- strftime('%m', s.soldDate) as month, sum(s.salesAmount) as salesTotal
-- from sales s
-- group by year, month)
-- select year, month, salesTotal,
-- sum(salesTotal) over (PARTITION by year
-- order by year, month) as runningAnnualTotal
-- from cte
-- order by year, month


-- 3
-- Create a report showing the number of cars
-- sold this month and last month

-- select strftime('%Y-%m', soldDate) as yearMonth, count(*) as totalSales,
-- lag(count(*), 1, 0) over calMonth as lastMonthSales
-- from sales
-- group by yearMonth
-- window calMonth as (order by strftime('%Y-%m', soldDate))

select strftime('%Y-%m', soldDate) as yearMonth, count(*) as carsSold,
lag(count(*),1, 0) over calMonth as lastMonthCarsSold
from sales
group by yearMonth
window calMonth as (order by strftime('%Y-%m', soldDate))
order by yearMonth

