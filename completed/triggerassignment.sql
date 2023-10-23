/*
drop trigger if exists tr1;
delimiter $
create trigger tr1 after insert on insertedStudent for each ROW
BEGIN 
insert into log1 values(new.id, 'record inserted');

end $
delimiter ;


drop trigger if exists tr1;
delimiter $
create trigger tr1 after insert on student for each ROW
BEGIN
insert into student_log values(new.id, new.namefirst, new.namelast, new.dob, new.emailid);

end $
delimiter ;


drop trigger if exists tr1;
delimiter $
create trigger tr1 before update on student for each ROW
BEGIN
insert into student_log values(new.id, new.namefirst, new.namelast, new.dob, new.emailid);

end $
delimiter ;



drop trigger if exists tr1;
delimiter $
create trigger tr1 after delete on student for each ROW
BEGIN
insert into student_log values(old.id, old.namefirst, old.namelast, old.dob, old.emailid);

end $
delimiter ;
*/

drop trigger if exists tr1;
delimiter $
create trigger tr1 after insert on student for each ROW
BEGIN

if dayname(now()) = 'Monday' THEN
signal sqlstate '42000' set message_text = 'you cannot insert record on Monday';
end if;
end $
delimiter ;