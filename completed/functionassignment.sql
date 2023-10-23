/*
drop function if exists f1;
delimiter $
create function f1() returns int
deterministic
BEGIN
declare z int;
select max(studentID) + 1 into z from student_new;
return z; 
end $
delimiter ;

*/

drop function if exists f1;
delimiter $
create FUNCTION f1(x int) returns int
deterministic
BEGIN
set @z='';

select sum(marks) into @z from student_qualifications sq where studentid in
 (select studentID from student_qualifications where name=10 and name=12 or name='be')
 and name!='DIP' and studentID=x group by studentid;
 return @z;
end $
delimiter ;