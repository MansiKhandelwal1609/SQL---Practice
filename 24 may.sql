-- groupby -> aggregate function 
--  multirow function

use sakila;
select * from address;
select count(address_id) from address;
select count(address2) from address;

select count(*) from address;  -- * takes the primary key as column
select count(distinct (district)) from address;

select count(address_id) from address;
select sum(address_id) from address;

select * from address where district="QLD";
select count( *) from address where district="QLD";
select count( *) from address where district="Alberta";

select district,count(*) from address group by district;

select district,count(*) , sum(city_id)from address group by district;

-- column mentioned not in groupby or any aggregation function we can not use that directly

select * from payment;
select customer_id  from payment group by customer_id;
select customer_id ,count(*) from payment group by customer_id;

-- alias 
select customer_id ,count(*) as total from payment group by customer_id;

select customer_id ,count(*) as total from payment group by customer_id order by total ;
select customer_id ,count(*) as total from payment 
group by customer_id order by total desc;

select customer_id ,sum(amount) as total  from payment
group by customer_id order by total desc;

select customer_id ,sum(amount) as total  from payment
group by customer_id ;

-- where --> filter on the data present in data --> group by se pehle likhna h   
-- having clause --> filter on aggregate function  --> group by k bad m likhna h 
select customer_id ,sum(amount) as total  from payment
group by customer_id having total>100;

select customer_id ,sum(amount)from payment
where customer_id>5 group by customer_id 
having sum(amount)>100;

-- where clause m aggregate function m filter nhi krskte

select * from payment;

select customer_id,staff_id,sum(amount) from payment 
where customer_id=1 and staff_id=1;

select customer_id,staff_id,sum(amount) from payment 
where customer_id=1 and staff_id=2;

select customer_id,staff_id from payment 
group by customer_id,staff_id;

select customer_id,staff_id,sum(amount) from payment 
group by customer_id,staff_id;

select * from payment;

-- get the avg value for each amt whose payment id>10
-- get the total number of amt for each month of payment of payment date for may , june and july 
select payment_id , avg(amount)  from payment 
where payment_id>10 group by amount;

select sum(amount),monthname(payment_date) as month1 from payment
group by month1 ; 

