/*drop procedure if exists adduser;
delimiter $
create procedure adduser(in c1 varchar(20),in c2 varchar(20),in c3 varchar(20))
begin
create table login(username varchar(20) ,password varchar(10) , email varchar(20));
insert into login values(c1,c2,c3);
end$
delimiter ;
*/

/*
drop procedure if exists checkuser;
delimiter $
create procedure checkuser(in c1 varchar(20))
BEGIN
declare flag bool;
select true into flag from login where email=c1;
if flag then
  select username,password from login where email=c1;
ELSE
   insert into log(CURRENT_DATE1, current_time1, message) values('1999-01-10','10:32:12','gfsfdshd');
end IF;
end $
delimiter ;
*/

/*
drop PROCEDURE IF EXISTS getQualification;
delimiter $
CREATE PROCEDURE getQualification(studentID int)
BEGIN
DECLARE flag BOOL;
select true into flag from student s where s.id=studentID;
if flag THEN
 select * from student s join student_qualifications sq on s.id=sq.studentid where s.id=studentID;
ELSE
 select "student not found";
end if;
end $
delimiter ;
*/

/*
drop procedure if exists addstudent;
delimiter $
create procedure addstudent(id int,phn int,add1 varchar(20))
begin 
 insert into student(id) values(id);
 insert into student_phone(id,studentid,number) values(51,id,phn);
 insert into student_address(id,studentid,address) values(50,id,add1);
end$
delimiter ;
*/




drop procedure if exists addqualification;
delimiter $
create procedure addqualification(iid int,qua varchar(10),out msg varchar(100))
begin 
declare flag bool;

select true into flag from student s where iid=s.ID;
if flag then 
insert into student_qualifications(id,studentid,name) values(90,iid,qua);
set msg := 'record inserted';  
ELSE
set msg := 'record not found';
end if;
end $
delimiter ;


