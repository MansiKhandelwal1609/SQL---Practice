-- views --> filtered format m virtual table

-- views --> not physically available
-- rely on riginal data
-- restriction
-- comples query stored in virtual format

# view 

use sakila;
select * from payment;
create view v_payment as 
select payment_id , customer_id from payment;

select * from v_payment;
create table raj123(id int , salary int);
insert into raj123 values(1,10000);

create view v_raj123 as 
select id from raj123;

select * from v_raj123;
-- normal view ==> ddl done on view also reflects on original 

create or replace view v_raj123 as 
select sum(salary) from raj123;
-- if we create a complex view we cannot update the  using ddl--> view like having agg function


select * from v_raj123;
insert into v_raj123 values(30000);



-- index -- to locate rows with positions 


create database test;
use test;

create table regex(id int primary key auto_increment,
name varchar(20) , salary int);

insert into regex values(1,"tushar",10),(2,"aman",20);
desc regex;

select * from regex;
insert into regex(name,salary) values ("aman",200);
commit;

show indexes from regex;

explain select * from regex where salary=20;

explain select * from regex;
select * from regex;

create index regex_name_ind on regex(name);
explain select * from regex where name="aman";

drop index regex_name_ind on regex;
show indexes from regex;

insert into regex(name,salary) values ("shivam",200),("tunish",600);
commit;
select * from regex;

create index regex_name on regex(name(2));

show indexes from regex;
explain select * from regex where name="tu%";