-- constraint
-- rules --> to avoid invalid data
-- primary key
-- foreign key 
-- not null
-- default 
-- unique key
-- index

use sakila;
create table raj(id int , name varchar(20));
insert into raj values(10,"aman");
insert into raj values(13);
insert into raj(id) values(13);
select * from raj;

create table raj2(id int , name varchar(20) not null);
insert into raj2 values(10,"aman");
insert into raj2 values(13);
insert into raj2(id,name) values(14,null);
select * from raj2 ;

drop table raj2;
create table raj2(id int default 100 , name varchar(20) not null);
insert into raj2 values(10,"aman");
insert into raj2(name) values("aditya");
select * from raj2;

create table raj3(id int unique  , name varchar(20) );
insert into raj3 values(10,"aman");
insert into raj3 values(11,"aman");
select * from raj3;

create table raj4(id int check(id between 2 and 5) );
insert into raj4 values(2);
insert into raj4 values(5);
insert into raj4 values(6);
select * from raj4;

-- unique can have multiple null values 
insert into raj3 values(null,"aman");

create table house(house_id int,pp int,sp int ,email varchar(20) unique ,check(sp>pp));
select * from house;
insert into house values(10,100,200,"abc");

create table house2(house_id int,pp int,sp int ,email varchar(20) unique ,constraint db_table_sprice_chk check(sp>pp));
select * from house2;
insert into house values(10,200,100,"abc");

-- primary key -- unique identifier of each and every record
-- unique
-- not null
-- only one primary key in 1 table 
-- primary can be a single column or can be a combination of columns

create table isha (id int primary key);
insert into isha values(10);
insert into isha values(10);
select * from isha;

-- foreign key -- regulation 
-- cross validation --> parent table     child table 
-- if have to work in child table then data should be in parent table also
drop table person;
create table person(pid int primary key, pname varchar(20) );
insert into person values(1,"tushar");

create table orders(oid int , city varchar(20), pid int ,
foreign key (pid) references person(pid));

insert into orders values (101,"jaipur",20);

insert into orders values (101,"jaipur",1);
select * from orders;

-- dif between super key , candidate key and compose key 
-- read the options present in foreign key --> on delete  , on update , on delete cascade , on delete set null , on delete set default 
