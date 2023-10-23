/*drop procedure if exists p1;
delimiter $
create procedure p1(s varchar(20))
begin 
declare s1 varchar(10);
declare x int;
set x = 1;

lbl:LOOP
select substr(s,x,1);
set x = x + 1;
if x > length(s) then
leave lbl;
end if;
end loop lbl;
end $
delimiter ;

*/

/*
drop procedure if exists pro2;
delimiter $
CREATE procedure pro2(s varchar(20))
begin
declare x int;
set x = 0;
set @z = '';
lbl:LOOP
set x = x + 1;
if x = 1 then
set @z := CONCAT(@z, substr(s,x,1));
ELSE
set @z := CONCAT(@z, ',', substr(s,x,1));
end if;
if x > length(s)-1 THEN
leave lbl;
end if;
end LOOP lbl;
end $
delimiter ;
*/

/*
drop procedure if exists pro2;
delimiter $
CREATE procedure pro2(s varchar(20))
begin
declare x int;
set x := 1;
set @num :="";
set @ch := "";
lbl:LOOP

if (substr(s, x, 1) >= '0' and substr(s, x, 1) <= '9') THEN
set @num := CONCAT(@num, '', SUBSTR(s,x,1));
ELSE
set @ch := CONCAT(@ch, '', SUBSTR(s,x,1));

end if;
set x := x + 1;
if x > length(s) THEN
leave lbl;
end if;
end LOOP lbl;
end $
delimiter ;


drop procedure if EXISTS pro2; 
delimiter $
CREATE procedure pro2(name varchar(20),job varchar(20))
begin
declare z int;
set @x =name;
set @y =job;
set @z := concat(substr(@x, 1, 1), '(', substr(@x,2,length(@x)), ')', ' is ', @y);
end $
delimiter ;


drop procedure if EXISTS pro2; 
delimiter $
CREATE procedure pro2()
begin
declare z1 int;
set @z=" ";
loop 
   set @x=concat("select ename from emp where empno=",z1);
   prepare k from @x;
   execute k;
   set z1=z1+1;
  
   set @z := concat(substr(@x, 1, 1), '(', substr(@x,2,length(@x)), ')', ' is ', @y);
 

   set z2=select count(ename) from emp;
   if z2> then  
end loop ;
end $
delimiter ;



drop procedure if exists pro2;
delimiter $
create procedure pro2(str varchar(20))
BEGIN
declare x int;
set @up = "";
set @low = "";
set x:= 0;
lbl:loop
if(ASCII(substr(str, x, 1)) >= 97 and ASCII(substr(str, x, 1)) <= 123) THEN
set @low := concat(@low, substr(str,x,1));
ELSE
set @up := concat(@up, substr(str,x,1));
end if;

set x = x + 1; 
if x > length(str) THEN
Leave lbl;
end if;
end loop lbl;
end $
delimiter ;





drop procedure if exists pro2;
delimiter $
create procedure pro2(str varchar(20))
BEGIN
declare x, count1, count2, count3 int;

set @vowel = "";
set @digit = "";
set @white = "";

set x:= 0;
set count1 := 0;
set count2 := 0;
set count3 := 0;

lbl:loop

if(ASCII(substr(str, x, 1)) in ('a', 'e', 'i', 'o', 'u')) THEN
set count1 := count1+1;
set @vowel := concat(@vowel, substr(str,x,1));

ELSE IF(substr(str, x, 1) between 0 and 9) then
set count2 = count2+1;
set @digit := concat(@digit, substr(str,x,1));

ELSE 
set count3 := count3 + 1;
set @white := concat(@white, substr(str, x, 1));

end if;

set x := x + 1; 
if x > length(str) THEN
Leave lbl;

set @v := concat(@vowel, ' ', length(@vowel));
set @d := concat(@digit, ' ', length(@digit));
set @w := concat(@white, ' ', length(@white));

end if;
end loop lbl;
end $
delimiter ;





drop PROCEDURE if exists pro1;

delimiter .

create PROCEDURE pro1(str1 varchar(50))

begin

declare x int;
set x=1;
set @digits=0;
set @vow=0;
set @spaces=0;

l:loop

if substr(str1,x,1)='a' or substr(str1,x,1)='e' or substr(str1,x,1)='i' or substr(str1,x,1)='o' or substr(str1,x,1)='u' THEN
set @vow=@vow+1;
end if;

if SUBSTR(str1,x,1)>='0' and SUBSTR(str1,x,1)<='9' THEN
set @digits=@digits+1;
end if;

if SUBSTR(str1,x,1)=' ' then set @spaces=@spaces+1;
end if;

set x=x+1;
if x>length(str1) then leave l;
end if;
end loop l;
end .

delimiter ;


drop procedure if exists pro1;
delimiter .
create procedure pro1(str1 varchar(30))
begin
declare x int;
set x := 1;
set @input := ''; 

lbl:loop

if (ASCII(substr(str1, x , 1)) >= 97 and ASCII(substr(str1, x, 1)) <= 123) THEN
set @input = concat(@input, substr(str1, x, 1));
end if;

set x = x + 1;
if x>length(str1) then
leave lbl;
end if;


end loop lbl;
end .
delimiter ;




drop procedure if exists pro1;
delimiter @
create procedure pro1()
BEGIN

declare x int;
set x:= 1;

lbl:LOOP

if (mod(x,2) = 0) then
insert into r15 values ( concat(x, '	i is even'));
end if;

if (mod(x,2) = 1) then
insert into r15 values ( concat(x, '	i is odd'));
end if;

set x:= x + 1;
if x > 10 then leave lbl;
end if;
end loop lbl;

end @
delimiter ;





drop procedure if EXISTS pro1;
delimiter .
create procedure pro1()
BEGIN
declare _ename, _job varchar(20);
declare sal1 int;

declare c1 cursor for select ename, job, sal from emp order by sal desc limit 5;
declare exit handler for 1329 select "EOF";

open c1;
lbl:LOOP
fetch from c1 into _ename, _job, sal1;

select _ename, _job, sal1;

end loop lbl;
close c1;
end .
delimiter ;




drop procedure if exists pro1;
delimiter .
create procedure pro1()

create cursor 




DROP TRIGGER IF EXISTS TR1;
DELIMITER $
create trigger tr1 before update on z for each row
BEGIN
insert into z1 values (old.c1, old.c2, old.c3, old.currentTime);

end $
delimiter ;


DROP TRIGGER IF EXISTS TR2;
DELIMITER $
create trigger tr1 before update on z for each row
BEGIN
insert into z1 values (old.c1, old.c2, old.c3, old.currentTime);

insert into z1 values (old.c1, old.c2, old.c3, old.currentTime);

end $
delimiter ;



drop procedure if exists pro2;
delimiter $
CREATE procedure pro2(s varchar(20))
begin
declare x int;
set x = 0;
set @z = '';

lbl:LOOP
set x = x + 1;
set @z := CONCAT(@z, substr(s,x,1),',');
if x > length(s) - 1 THEN
leave lbl;
end if;
end LOOP lbl;
end $
delimiter ;



drop PROCEDURE if exists pro1;

delimiter .

create PROCEDURE pro1(str1 varchar(50))

begin

declare x int;
set x=1;
set @digits=0;
set @vow=0;
set @spaces=0;

l:loop

if substr(str1,x,1)='a' or substr(str1,x,1)='e' or substr(str1,x,1)='i' or substr(str1,x,1)='o' or substr(str1,x,1)='u' THEN
set @vow=@vow+1;
end if;

if SUBSTR(str1,x,1)>='0' and SUBSTR(str1,x,1)<='9' THEN
set @digits=@digits+1;
ELSE IF SUBSTR(str1,x,1)=' ' then set @spaces=@spaces+1;
else
select "just for tp";
end if;

set x=x+1;
if x>length(str1) then leave l;
end if;
end loop l;
end .

delimiter ;


drop procedure if exists p1;
delimiter $
create procedure p1(v int)
begin  
DECLARE flag BOOL;
select true into flag from customers c where c.cnum=v;
if flag THEN
select c.cnum,cname,o.onum from customers c join orders o on c.cnum=o.cnum where o.cnum=v;
ELSE
select 'record not available';
end if;
end $
delimiter ;

*/
drop procedure if exists pro1;
delimiter $
CREATE procedure pro1( d1 date,d2 date)
begin
declare dt date;
declare x int;
set @cnt:=0;
set x=0;
lb: LOOP
 set dt:=date(d1)+ interval x day;
 if (dayofweek(dt)=1) then
 set @cnt:=@cnt+1;
 end if;
 set x=x+1;
 if (datediff(dt,d2) = 0) THEN
   leave lb;
 end if;
end loop lb;
end $
delimiter ;


