/*
drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on r for each ROW
BEGIN
if new.age < 18 THEN
signal sqlstate '42000' set message_text="Person not eligible for voting";
end if;
end $
delimiter ;
*/

drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on patient_prescription for each ROW
BEGIN
if new.pid not in(select pid from patient_registration) THEN
signal sqlstate '42000' set message_text="Person is not a registered patient";
end if;
end $
delimiter ;
