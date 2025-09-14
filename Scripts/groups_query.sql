-- 1
-- select e.employeeId, e.firstName, e.lastName, count(e.employeeId) as carsSold
-- from employee e
-- join sales s 
-- on e.employeeId = s.employeeId
-- group by e.employeeId, e.firstName, e.lastName
-- order by carsSold desc

-- select e.employeeId, e.firstName, e.lastName, count(*) as carsSold
-- from sales s
-- inner join employee e
-- on s.employeeId = e.employeeId
-- group by e.employeeId, e.firstName, e.lastName
-- order by carsSold desc

-- 2
-- select e.employeeId, e.firstName, e.lastName, 
-- max(s.salesAmount) as mostExpensive,
-- min(s.salesAmount) as leastExpensive
-- from sales s
-- join employee e
-- on s.employeeId = e.employeeId
-- where s.soldDate BETWEEN date('2023-01-01') and date('2023-12-01')
-- group by e.employeeId, e.firstName, e.lastName

-- 3
select e.employeeId, count(s.employeeId) as carsSold,
min(s.salesAmount) as leastExpensive,
max(s.salesAmount) as mostExpensive
from employee e 
join sales s
on e.employeeId = s.employeeId
where s.soldDate between date('2023-01-01') and date('2023-12-01')
GROUP by e.employeeId
having count(s.employeeId) > 5