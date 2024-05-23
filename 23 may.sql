use sakila;
select database();
show tables;
describe actor;
desc actor;
desc sakila.actor;
-- comment
/** comment **/
-- select statement (DQL) 
select * from actor;
select actor_id , first_name from actor;
select actor_id , first_name , actor_id from actor;
select actor_id , first_name , actor_id+4 from actor;  -- broadcasting

-- where clause for conditions 
-- selection == specific id
-- projection == according to columns 
select * from actor where actor_id!=2;
select * from actor where actor_id<>2;

select actor_id , first_name from actor where actor_id<=2;

select actor_id , first_name from actor where first_name="NICK";

select actor_id from actor where first_name="NICK";

select * from actor where actor_id between 2 and 5; -- we have larger value at last

select * from actor where actor_id in (5,2);

select * from actor where actor_id not in (5,2,12);

select * from actor where first_name="ED";
-- specific pattern find karo (like operator)
select * from actor where first_name like "E%"; -- % --> 0 or more characters

select * from actor where first_name like "%E";

select * from actor where first_name like "%E%";

select * from actor where first_name like "_D"; -- _ --> only and only 1 character

select * from actor where first_name like "__%";
select * from actor where first_name like "__";

select actor_id ,first_name from actor where actor_id=2 or actor_id=4;

select actor_id ,first_name from actor where actor_id in (2,4);

select * from actor where actor_id =44 or first_name="NICK";

select * from actor;

select actor_id,first_name from actor where first_name in ("NICK","ED") and actor_id>=3;

select actor_id,first_name from actor where (first_name = "NICK"or first_name="ED") and actor_id>=3;

-- functions string==> output 
-- single row function  --> esa function jo hr ek row p work kre 

select first_name,lower(first_name) from actor;

-- dual table -- dummy table

select first_name,4 from actor;
select upper("abc") from dual;

select first_name , last_name ,concat(first_name,' ',last_name) from actor;

select first_name , last_name ,concat_ws(' ',first_name,last_name) from actor;

select *  from actor where concat_ws(' ',first_name,last_name)="ED CHASE";
select * from actor where first_name like concat("J","%");

-- substr (data,position,no of characters)
select first_name,substr(first_name,5) from actor; 

select first_name,substr(first_name,3,2) from actor; 

select first_name,substr(first_name,-5) from actor; 

-- instr 
select first_name,instr(first_name,"E") from actor; 
-- locate(what to late,where to locate , from where to start)
select first_name,locate("E",first_name,1) from actor; -- gives number of times the character present in str

-- length -- returns total number of bytes -- in english every letter is of 1 byte thats why gives correct answer 
select length("abcd") from dual;
select char_length("") from dual;

-- trim --> remove extra widespaces 

select '     abc   ' from dual;

select trim('     abc   ') from dual;

select trim(trailing 'x' from '     abcxxxx') from dual;
select trim(leading 'x' from 'xxxxabc') from dual;
select trim(both 'x' from 'xxxxabcxxxxxx') from dual;

select trim('x' from 'xxxxaxbxcxxxxxx') from dual;
-- rpad , lpad 

select rpad(9123456,10,'#') from dual;
select lpad(9123456,10,'#') from dual;

-- date time functions --> year , month ,quarter , week of year
select curdate() from dual;
select current_date() from dual;
select current_timestamp() from dual;
select now() from dual;

select adddate(now(),15) from dual;
select adddate(now(),interval 15 day) from dual;
select adddate(now(),interval 15 month) from dual;

select dayname( now() ) from dual;
select date_format( now(),"%" ) from dual;
select date_format( now(),"%m" ) from dual;
select date_format( now(),"%M" ) from dual;

-- numerical functions

select round(10.3) from dual; -- round off the number
select round(10.4214,1) from dual;
select round(10.4614,2) from dual;

select truncate(10.4214,2) from dual; -- dont round off just show upto given decimal positions 

select mod(11,2) from dual; -- give reminder

-- conditional 

use sakila;
select * from actor;

select if (True , 10,20) from dual;
select actor_id , first_name ,
if (actor_id=2,actor_id+10,actor_id) from actor;
select actor_id , first_name ,
if (actor_id=2,actor_id+10,
    if(actor_id=4,actor_id+20,actor_id)) 
       from actor;
    
-- case statement 

/*
select col,case expression/col
                when condition then what type of work
                
                end
			from table
*/

select actor_id,first_name,
	case actor_id
			when 2 then actor_id+10
	end
    from actor;
    
select actor_id,first_name,
	case actor_id
			when 2 then actor_id+10
	end "newcol"
    from actor;
    
    
select actor_id,first_name,
	case actor_id
			when 2 then actor_id+10
	else actor_id
	end  "newcol"
    from actor;
    
    select actor_id,first_name,
	case actor_id
			when 2 then actor_id+20
            when 3 then actor_id+30
            when 4 then actor_id+40
	else actor_id
	end  "newcol"
    from actor;
    
    
    
	select actor_id,first_name,
	case 
			when actor_id=2 then actor_id+20
            when actor_id=3 then actor_id+30
            when actor_id=4 then actor_id+40
	else actor_id
	end  "newcol"
    from actor;
    
    -- if a person has a id more than 5 add 10 to id ,if >15 add 25,if id>30 add 30 otherewise id +5
    
    select actor_id,first_name,
	case 
			when actor_id>5 and actor_id<=15 then actor_id+10
            when actor_id>15 and actor_id<=30 then actor_id+25
            when actor_id>30 then actor_id+30
	else actor_id+5
	end  "newcol"
    from actor;
    
    select actor_id,first_name,
	case 
			when actor_id>30 then actor_id+50
            when actor_id>15 then actor_id+25
            when actor_id>5 then actor_id+10
	else actor_id+5
	end  "newcol"
    from actor;
    
    -- groupby and why we use 
    -- distinct vs groupby
    -- where clause vs having clause