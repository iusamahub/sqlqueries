/*drop procedure if exists pr1;
delimiter $
create procedure pr1()
begin 
  set @z = 1;
  select @z;
end $
delimiter ;


drop procedure if exists pr1;
delimiter $
create procedure pr1()
begin 
  set @z=select 'hello world';
end $
delimiter ;


drop procedure if exists pr1;
delimiter $
create procedure pr1()
BEGIN
 declare x int;
 declare  y int;
 set x=10,y=20;
 select x+y sum;
end$
delimiter ;
*/

/*
drop procedure if exists pr1;
delimiter $
create procedure pr1(x int,y int)
begin 
 select x+y;
end$
delimiter ;

drop procedure if exists pr1;
delimiter $
create procedure pr1(x int,y int)
begin 
  set @z= x+y;
 select @z;
end$
delimiter ;
*/
/*
drop procedure if exists pr1;
delimiter $
create  procedure pr1(in x int,in y int,out z int)
begin 
set z=x+y;
end $
delimiter ;


drop procedure if exists pr1;
delimiter $
create procedure pr1( x int)
begin 
declare y int;
declare z int;
set y=(select count(*) from emp);
set z=y-1;
select row_number() over()r1,ename,job,sal from emp limit z,1;
end$
delimiter ;


drop procedure if exists pr1;
delimiter $
create procedure pr1( x int)
begin
select row_number() over()r1,ename,job,sal from emp limit x;
end$
delimiter ;

dynamic table


drop procedure if exists pr1;
delimiter $
create procedure pr1(_tname varchar(20))
begin 
create table _tname(c1 int,c2 int);//error
end $
delimiter ;

drop procedure if exists pr1;
delimiter $
create procedure pr1(_tname varchar(20))
begin 
set @x=create table _tname(c1 int,c2 int);//error
select @x;
end $
delimiter ;
*/
/*
drop procedure if exists pr1;
delimiter $
create procedure pr1(_tname varchar(20))
begin 
set @x=concat("create table ", _tname," (c1 int,c2 int)");
prepare z from @x;
execute z;
end $
delimiter ;


drop procedure if exists pr1;
delimiter $
create procedure pr1(_tname varchar(20))
begin 
set @x=concat("select * from ", _tname);
prepare z from @x;
execute z;
end $
delimiter ;


FUNCTION
*/

/*
DROP FUNCTION IF EXISTS F1;
delimiter $
create function f1(x int, y int) returns int
deterministic
BEGIN
declare z int;
set z:=x+y;
return z;
end $
delimiter ;
*/

/*
DROP FUNCTION IF EXISTS F1;
delimiter $
create function f1(x int, y int) returns int
deterministic
BEGIN
declare z int;
set z:=  ifnull(x,null) + ifnull(y,0);
return z;
end $
delimiter ;
*/
/*
DROP FUNCTION IF EXISTS F1;
delimiter $
create function f1() returns int
deterministic
BEGIN
declare z int;
select max(c2) + 1 into z from dynamic1;
return z;
end $
delimiter ;


TRIGGERS


drop procedure if exists p1
delimiter $
create procedure p1()
begin 
select max(sal) into @z from emp;
end$
delimiter ;

drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on d for each row 
begin 
  call p1();
 end$
 delimiter ;

drop procedure if exists adduser;
delimiter $
create procedure adduser(in c1 varchar(20),in c2 varchar(20),in c3 varchar(20))
begin
create table login(username varchar(20) ,password varchar(10) , email varchar(20));
insert into login values(c1,c2,c3);
end$
delimiter ;
select s.id,s.namefirst,namelast,sq.marks,sq.name from student s join student_qualifications sq on s.id=sq.studentID where sq.marks > all (select sq.marks from student_qualifications sq where sq.name in (10,12) and s.id=sq.studentid ) and sq.name='be';



drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on account for each row
begin

    set new.accountno = ('sa/23-000',f1());
	insert into account1 values(f1(),new.accountno,'s');
	
end if;
end $
delimiter ;


drop function if exists f1;
delimiter $
create function f1() returns int
begin
declare x int;
set @a='';
if new.account_type = 's' then
	set @a:=(select (max(substr(accountno, 10,1)) + 1) from account1);
	return z;
end $
delimiter ;
*/


drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on account for each ROW
begin
declare a int;
if new.account_type = 's' THEN
	set a := (select max(substr(accountno,10,1))+1 from account);
	if a is null then
		set new.accountno = 'sa/23-0001';
	ELSE
		set new.accountno = concat('sa/23-000', a);
	end if;
end if;
end $
delimiter ;