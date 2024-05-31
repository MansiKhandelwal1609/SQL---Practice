use isha;
-- data manipulation language 
-- delete --> delete data only
delete from xyz ;  -- we can recover data from delete command 
select * from xyz;
delete from xyz ; 

-- update (dml)-- > every dml operation is recoverable

select * from t2;
update t2 set name="ram";
-- DDL ==> create , drop and truncate , alter 
show tables;
drop table xyz; 
-- drop deletes data and schema both / we cannot retrieve data 

truncate t2 ; 
-- truncate ==>  drops data andtable and then recreate the structure of table   ==> looks like delete but is not like that / we cannot retrieve the data 
select * from t2;

use sakila;
select * from actor;
create table o1 
as select * from actor;
select * from o1;

create table o2 as select actor_id , first_name from actor;
select * from o2;

create table o3 as select actor_id as id  , first_name as name from actor;
select * from o3;


-- alter command 
-- group concat function 
-- what is transaction why it is necesary to maintain it  and we manage it using tcl ? 
