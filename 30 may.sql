use sakila;
create table ut1(id int);
insert into ut1 values(10),(20),(20),(30),(30),(40),(40);

-- second highest
select max(id) from ut1 where
id<(select max(id) from ut1 ); 

select * from ut1 order by id desc limit 2,1; -- 2nd way to find 2nd max but least preferred method

-- 2nd min
select min(id) from ut1 where
id>(select min(id) from ut1 ); 

-- 3rd min
select min(id) from ut1 where
id>(select min(id) from ut1 where
id>(select min(id) from ut1 ));

-- ddl command 
create database isha;
use isha;
-- int = 4 byte == 2^^32
create table xyz(id int);
insert into xyz values (2147483647);
insert into xyz values (2147483648);-- out of range 

-- unsigned int --> no -ve values 
-- big int -- 2^^64 --> 8 byte
-- tinyint --> 2^^8 --> 1 byte
-- smallint -->2^^16 -->  2 byte
-- mediumint --> 2^^24 --> 3byte

-- boolean store the value in tiny int 

-- string data --> char , varchar
-- varchar(20) = 20 byte   -- use the leftover size in some other ways
-- char(20) = 20 byte --> "raj" --> stores in whole 20 byte 

create table t1(name varchar(20));
insert into t1 values("aman");

create table t2(name varchar(3));
insert into t2 values("a");
insert into t2 values("a                       "); -- if there is widespaces in last take widespaces till 3 spaces and trim the rest
select name , length(name) from t2;

select name , length(name) from t1;

-- date datatype
 create table u1(dob date);
 insert into u1 values ("2024-01-19");
 select * from u1;
 

 create table u2(dob date,dtime time, dob1 datetime);
 insert into u2 values ("2024-01-19","10:25:12",now());
 select * from u2;
 
 -- timestamp --> can store upto data till 2038
 
 
 







