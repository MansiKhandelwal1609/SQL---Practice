use sakila;
select * from payment;

-- subquery  : query within a query 
select amount from payment where payment_id=1;
select * from payment where amount=2.99;
-- jo sbse pehle chahiye usko hi subquery banan h 

select * from payment 
where amount= (select amount from payment where payment_id=3);


select amount from payment where rental_id=573;
select * from payment 
where amount= 0.99;

select * from payment 
where amount= (select amount from payment where rental_id=573);

-- no of columns in subquery = no of columns outside of subquery in comparison

-- i need to get those users whose staff id = the staff id of payment id 10 
select staff_id from payment where payment_id=10;
select * from payment 
where staff_id=2;

select * from payment 
where staff_id= (select staff_id from payment where payment_id=10);


-- i need to get the payment id , staff id and amt and payment date where the month = month of payment id 5
select month(payment_date) from payment where payment_id=5;
select payment_id, staff_id , amount , payment_date from payment 
where month(payment_date)=6;
select payment_id, staff_id , amount , payment_date from payment 
where month(payment_date)=(select month(payment_date) from payment where payment_id=5);


select payment_id , amount from payment where payment_id in (2,3);
select * from payment 
where amount=(select  amount from payment where payment_id in (2,3));

-- single row subquery returns only 1 row
-- if subquery is multi row then we cant use =,<, > directly , we can use in , any and all

select * from payment 
where amount in (select  amount from payment where payment_id in (2,3));

select * from payment 
where amount  not in (select  amount from payment where payment_id in (2,3));

select * from payment 
where amount=any(select  amount from payment where payment_id in (2,3));

-- >any --> compare with the minimum value of result set or subquery
select * from payment 
where amount>any(select  amount from payment where payment_id in (2,3));

select * from payment 
where amount>=any(select  amount from payment where payment_id in (2,3));

-- <any --> compare with maximum alue of result set
select * from payment 
where amount<any(select  amount from payment where payment_id in (2,3));

select * from payment 
where amount<=any(select  amount from payment where payment_id in (2,3));

-- =all doesnt exist
-- <all--> less than min value of result set
-- > all --> greater than max value 