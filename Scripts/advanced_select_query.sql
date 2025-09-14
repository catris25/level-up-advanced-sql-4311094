-- 1
-- with cte as (select strftime("%Y", soldDate) as soldYear, salesAmount
-- from sales)
-- select soldYear, sum(salesAmount) as annualTotal
-- from cte
-- group by soldYear

-- 2
-- show the amount of sales per employee 
-- for each month in 2021

-- select e.firstName, e.lastName, 
--   sum(case when strftime('%m', s.soldDate) = '01'
--     then salesAmount end) as Jan,
--   sum(case when strftime('%m', s.soldDate) = '02'
--     then salesAmount end) as Feb,
--   sum(case when strftime('%m', s.soldDate) = '03'
--     then salesAmount end) as Mar,
--   sum(case when strftime('%m', s.soldDate) = '04'
--     then salesAmount end) as Apr,
--   sum(case when strftime('%m', s.soldDate) = '05'
--     then salesAmount end) as May,
--   sum(case when strftime('%m', s.soldDate) = '06'
--     then salesAmount end) as Jun,
--   sum(case when strftime('%m', s.soldDate) = '07'
--     then salesAmount end) as Jul,
--   sum(case when strftime('%m', s.soldDate) = '08'
--     then salesAmount end) as Aug,
--   sum(case when strftime('%m', s.soldDate) = '09'
--     then salesAmount end) as Sep,
--   sum(case when strftime('%m', s.soldDate) = '10'
--     then salesAmount end) as Oct,
--   sum(case when strftime('%m', s.soldDate) = '11'
--     then salesAmount end) as Nov,
--   sum(case when strftime('%m', s.soldDate) = '12'
--     then salesAmount end) as Dec
-- from sales s 
-- inner join employee e
-- on e.employeeId = s.employeeId
-- where s.soldDate>= date('2021-01-01') 
--   and s.soldDate < date('2022-01-01')
-- group by e.firstName, e.lastName
-- order by e.lastName

-- 3
-- Find all sales where the car purchased was electric

SELECT s.soldDate, s.salesAmount, i.colour, i.year
from sales s
join inventory i 
on s.inventoryId = i.inventoryId
where i.modelId in 
(SELECT modelId from model
where EngineType = 'Electric')
