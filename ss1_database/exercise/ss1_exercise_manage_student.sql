create database exercise;
use exercise;

create table student(
id int not null primary key,
name varchar(45) not null,
age int not null,
country varchar(45) not null);

create table teacher(
id int not null primary key,
name varchar(45) not null,
age int not null,
country varchar(45) not null);

create table class(
id int not null primary key,
name varchar(45) not null);

insert into class value (1, 'C0722G1'),(2,'C0822G1'),(3, 'C0922G1');

select * from class;

insert into student (id,name,age,country)
value (2,'Nhân',32,'Việt Nam'),
	  (3,'nhân',31,'việt Nam'),
      (4,'Nhân',30,'Da nang'),
      (5,'Nhân',29,'Da nang');

select * from student;

update student
set name = 'Quốc' 
where id = 3;

delete from student where id = 5;