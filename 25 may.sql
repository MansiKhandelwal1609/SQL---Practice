-- creating table and joins 
create database testing;
use testing;
create table product (pid int , pname varchar(20) ,oid int);
insert into product values(1,"tv",100),(2,"mobile",300);

create table orders (oid int , city varchar(20));
insert into orders values(100,"jaipur"),(200,"goa"),(300,"hp"); 

select * from product;
select * from orders;

select pid,pname from product;

select * from product
join orders; -- cross join

-- method 1
select pid,pname,city, orders.oid from product
join orders
where (product.oid=orders.oid); -- inner join 

-- method 2
select pid,pname,city, orders.oid from product
join orders
using(oid); -- use when column nae in both table is same 

-- method 3
select pid,pname,city, orders.oid from product
inner join orders on (product.oid=orders.oid);

select pid,pname,city, orders.oid from product
right join orders on (product.oid=orders.oid);

-- natural join --> esa join jo inner ki trh perform krega or condition kch bhi nhi dete

select pid,pname ,city 
from product natural join orders;

-- if column name is same in both tables then natural join act as inner join 
-- if column name is not same in both tables then natural join act as cross join 

create table employee(eid int , ename  varchar(20), mid int);
insert into employee values(10,'tushar',null),(20,'aman',30),(30,'mayank',10),(40,'ujjwal',20);

select * from employee;
select emp.eid,emp.ename ,emp.mid ,mgr.eid as manager_id ,mgr.ename as manager_name
from employee as emp join employee as mgr 
where emp.mid = mgr.eid;  -- self join

create table worker(eid int , ename  varchar(20), mid int, salary int);
insert into worker values(10,'tushar',null,100),(20,'aman',30,400),(30,'mayank',10,50),(40,'ujjwal',20,200);

select * from worker;
-- i need to get empid , ename and the mgr name only for those user where the salary of emp >salary of mgr 
select w.eid, w.ename, m.ename as manager_name ,m.salary as m_sal,w.salary as w_sal from worker as w 
join worker as m where w.mid= m.eid and w.salary > m.salary ;

use sakila;
select * from actor;
select * from film_actor;

-- 3 table inner join 
select a.actor_id , a.first_name , a.last_name , fm.film_id ,f.title from actor as a 
join film_actor as fm 
join film as f
where a.actor_id = fm.actor_id 
and fm.film_id = f.film_id;


select a.actor_id ,concat('Done',' ', count(fm.film_id),' ','movies')  from actor as a 
join film_actor as fm 
where a.actor_id = fm.actor_id
group by actor_id; 

