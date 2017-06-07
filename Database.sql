# 175. Combine Two Tables
select p.FirstName, p.LastName, a.City, a.State
from Person p
left outer join Address a
on p.PersonId = a.PersonId


# 176. Second Highest Salary
select max(salary) as SecondHighestSalary from
Employee
where salary <
(select max(salary) from Employee)


#177. Nth Highest Salary
select distinct(salary)
from Employee em1
where (select count(distinct em2.salary) from Employee em2 where em2.salary > em1.salary)=(N-1)


CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select distinct(salary)
      from Employee em1
      where (select count(distinct em2.salary) from Employee em2 where em2.salary > em1.salary)=(N-1)
  );
END
