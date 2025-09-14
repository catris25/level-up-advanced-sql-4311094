-- SELECT * FROM sqlite_master WHERE type='table'
-- 1
-- SELECT e.firstName, e.lastName, e.title, m.firstName, m.lastName
-- from employee e
-- inner join employee m 
-- on e.managerId = m.employeeId

-- 2
-- select firstName, lastName from employee
-- where employeeId not in
-- (SELECT e.employeeId from employee e
-- join sales s on e.employeeId = s.employeeId)
-- and title = 'Sales Person'


-- 3 (but maybe wrong?)
-- select c.customerId, c.firstName, c.lastName, s.salesAmount
-- from customer c
-- FULL join sales s
-- on c.customerId = s.customerId

select c.customerId, c.firstName, c.lastName, s.salesAmount
from customer c
inner join sales s 
on c.customerId = s.customerId
UNION

select c.customerId, c.firstName, c.lastName, s.salesAmount
from customer c
left join sales s 
on c.customerId = s.customerId
where s.salesAmount is NULL
UNION

select c.customerId, c.firstName, c.lastName, s.salesAmount
from sales s
left join customer c
on c.customerId = s.customerId
where c.customerId is NULL
