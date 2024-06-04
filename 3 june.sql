-- Data Control Language 
-- Authorization 
-- Authentication 


-- user ==> username   password

create user bob12 identified by 'bob';  
select * from mysql.user;

select current_user();

show grants for 'bob12' ;  -- tells the permissions user is having

create user 'sammy'@'192.16.10.%' identified by 'password';  -- create user through ip address 
select * from mysql.user;

grant all privileges on sakila.* to bob12;  -- to give permisions to bob12

alter user 'bob12' identified by 'regex'; -- pass change

alter user 'bob12' account lock; -- to lock the user

alter user 'bob12' account unlock; -- to unlock the user

-- roles is simply a group 
-- group ==> collection of user-- in mysql group is named as role

-- creating role

create role sales;
-- grant privileges 
grant select on sakila.* to sales;
create user ' aman' identified by "aman";
show grants for aman;
-- adding in the role sales
grant sales to aman;
show grants for aman;

set default role all to aman; -- to assign role

use sakila;
create table emp (id int , name varchar(10));
insert into emp values(1,'ram');

create user "ram" identified by "ram" ;
grant select(id) on sakila.emp to ram;

grant select(name),update(name) on sakila.emp to ram;

drop user sam;

show grants for ram;
drop user sakila;