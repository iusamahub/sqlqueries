/*
drop PROCEDURE IF EXISTS pro1;
delimiter $
create procedure pro1()
BEGIN
declare deptno int;
declare dname1, loc1, pwd1, startedon1 varchar(20);


declare c1 cursor for select * from dept;
declare exit handler for 1329 SELECT "EOF";

open c1;
lbl:LOOP
fetch c1 into deptno, dname1, loc1, pwd1, startedon1;
select deptno, dname1, loc1, pwd1, startedon1;
end loop lbl;
close c1;
end $
delimiter ;
*/

drop procedure if exists pro2;
delimiter $
CREATE procedure pro2(in x int)
 b1:BEGIN
   declare flag BOOL;
   select DISTINCT true into flag from emp where deptno = x;
   if flag THEN
      b2:BEGIN
         declare _ename, _job,_dname,_loc varchar(20);
         declare _sal, _deptno int;
         declare c1 cursor for select ename, job, sal, emp.deptno, dname, loc from emp join dept on emp.deptno=dept.deptno where emp.deptno=x;
		 open c1;
         
		 lbl:LOOP
           fetch from c1 into _ename, _job, _sal, _deptno, _dname, _loc;
           select _ename, _job, _sal, _deptno, _dname, _loc;
         end LOOP lbl;
         close c1;
    end b2;
  ELSE
  select "Invalid dept no.";
  end if;
end b1 $
delimiter ;