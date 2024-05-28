use sakila;
select district from address
where address_id=6;

select * from address
where district=(select district from address
where address_id=6); -- single row subquery 

select district from address
where address_id in (6,7);

select * from address where district in (select district from address
where address_id in (6,7));