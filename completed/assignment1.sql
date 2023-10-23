create table COURSE
    -> ;

 desc course;


 create table student(id int primary key, namefirst varchar(45),namelast varchar(45),DOB date, email varchar(1024));


 desc student;

 create table student_phone(id int primary key,studentID int, number varchar(45), isActive bool, constarint fk_sid foreign key(studentid) references student(id));


 desc student_phone;

 create student_address(id int primary key, studentID int unique not null,address varchar(128), constraint fk_said foreign key(studentid) references student(id));


 desc student_address;

 create table faculty(id int primary key, namefirst varchar(45),namelast varchar(45),DOB date, emailID varchar(128));


 create table faculty_phone(id int primary key, namefirst varchar(45),namelast varchar(45),DOB date, emailID varchar(128)foreign key (facultyid)refernces faculty(id);


 desc faculty_phone;


 create table faculty_address(id int primary key, facultyID int unique not null, address varchar(128), foreign key (facultyid) references faculty(id));

 desc faculty_address
    -> ;


 create table modules(id int primary key, name varchar(128),duration int);

 desc modules
    -> ;


 create table course_modules(id int primary key, courseID int, moduleID int, foreign key(courseid) references course(id), foreign key(moduleid) references modules(id));




 create table student_qualifications(id int primary key, studentID int, name varchar(100), college varchar(100), university varchar(100), marks varchar(100), year int, foreign key(studentid) references student(id));


 create table faculty_qualifications(id int primary key, facultyID int, name varchar(100), college varchar(100), university varchar(100), marks varchar(100), year int, foreign key(facultyid) references faculty(id));


 
 create table course_batch(id int primary key, name varchar(100), courseId int, starton date, endson date, capacity int, foreign key(courseid) references course(id));


 create table batch_students(id int primary key, batchid int,foreign key(bacthid) references course_batch(id), studentid int, foreign key(studentid) references student(id));

 create table batch_students(id int primary key, batchid int,foreign key(batchid) references course_batch(id), studentid int, foreign key(studentid) references student(id));

 create table student_cards(id int primary key, studentid int, name varchar(100),isActive bool, foreign key(studentid) references student(id));


 create table student_order(id int primary key, studentid int, date date, amount int, foreign key(studentid) references student(id));