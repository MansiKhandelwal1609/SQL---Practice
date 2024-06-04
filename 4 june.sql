use sakila;
drop table emp;
create table employees(id int primary key auto_increment , dept varchar(20),salary int);

insert into employees(dept, salary) values("hr",200),
("hr",300),("hr",100),
("marketing",70),("marketing",50),
("marketing",200),("marketing",400),
("dsa",150),("dsa",120),
("dsa",40),("dsa",90),("dsa",500);

select * from employees;

select id , dept, salary avg(salary) from employees;

-- we cannot use aggregate function directly 

select id , dept, salary ,(select avg(salary) from employees) from employees;

select dept , avg(salary) from employees group by dept;

-- windows function/analytical function -- a way to apply aggregate function on each row or set of rows 

select id , dept, salary , avg(salary) over() from employees;


select id , dept, salary , max(salary) over() from employees;

select id , dept, salary , avg(salary) over(),avg(salary) over (partition by dept) from employees;

select id , dept, salary , sum(salary) over(),sum(salary) over (partition by dept) from employees;

select id , dept, salary , sum(salary) over(),sum(salary) over (order by salary) from employees;  -- gives rolling sum or cumulative sum

select id , dept, salary , 
sum(salary) over (partition by dept order by salary)
 from employees;                            -- gives rolling sum of each dept 
 
 -- rank , dense _rank() -- gives ranking to the row
 
 select id , dept , salary 
 ,rank() over(order by salary) from employees;
 
 -- if values are same then distribute rank but skips the numbers of ranks in how many rank is distributed 
 
  select id , dept , salary 
 ,dense_rank() over(order by salary) from employees;  -- if ranks are same then ranks are not skipped in dense_rank
 
  select id , dept , salary 
 ,rank() over(partition by dept order by salary ) from employees;   -- ranking given by salary in the dept
 
  select id , dept , salary 
 ,dense_rank() over(partition by dept order by salary ) from employees;
 
 
  select id , dept , salary 
 ,row_number() over(partition by dept order by salary ) from employees ;  -- gives every row a unique number it has nothing to do with ranking
 
 -- using the windows  function n highest salary from the data
 -- Whta is the use of ntile 
 
  select id , dept , salary 
 ,rank() over( order by salary desc ) as rank1 from employees  ;
 
 -- index 
 -- views