create database Assignment_2;
use Assignment_2;
create table Publishers(
						Pid int PRIMARY KEY,
						Pname varchar(30),
                        Email varchar(50) unique,
                        PhoneNo varchar(20)
                        );

create table Authors(
					 Auid int PRIMARY KEY,
					 AName varchar(30),
                     PhoneNo numeric(20),
                     Email varchar(30)
					);

create table Subject(
					 Subid int PRIMARY KEY,
					 SubName varchar(30)
					);

create table Title(
					Title_ID int PRIMARY KEY,
					Title varchar(30),
					Pub_Date date
				  );

create table TitleAuthors( 
							Auid int,
							Title_ID int,
							Importance Numeric(10),
							constraint TitleAuthors_Auid_fk foreign key (Auid) references Authors (Auid),
							constraint Title_id_fk foreign key (Title_ID) references Title (Title_ID)
						  ); 


insert into Publishers values(1,'WILEY','WDT@vsnl.net',91-11-23242666);
insert into Publishers values(2,'McGRAW-HILL','feedback@mheducation.com',91-11-00244442);
insert into Publishers values(3,'TECHMEDIA','books@techmedia.com', 91-11-21000456);
insert into Publishers values(4,'WROX','info@wrox.com',91-11-34666662);

insert into Authors values(101,'Daniel Bell',null,'danielbell@yahoo.com');
insert into Authors values(102,'James Goodwill',null,'goodwill12@hotmail.com');
insert into Authors values(103,'Stephen Walter',null,'stephen@hotmail.com');
insert into Authors values(104,'Davaid Hunter',null,'hunter@gmail.com');
insert into Authors values(105,'Kevin Loney',null,'kevin@oracle.com');
insert into Authors values(106,'ED. Romans',null,'roman@gmail.com');

insert into Subject values('ORA','Oracle Database');
insert into Subject values('JAVA','Java Language');
insert into Subject values('JEE','Java Enterprise Edition');
insert into Subject values('VB','Visual Basic.net');
insert into Subject values('ASP','ASP.net');

insert into Title values(1001,'ASP.net unleashed','2005-04-02',540,1);
insert into Title values(1002,'Oracle Complete Ref.','2005-05-01',575,3);
insert into Title values(1003,'Mastering EJB','2005-02-03',475,2);
insert into Title values(1004,'JAVA Complete Ref.','2005-03-04',499,1);
insert into Title values(1005,'Pro.VB.net','2005-06-04',450,4);

insert into TitleAuthors values(104,1001,1);
insert into TitleAuthors values(105,1002,1);
insert into TitleAuthors values(106,1003,1);
insert into TitleAuthors values(101,1004,1);
insert into TitleAuthors values(103,1005,1);
insert into TitleAuthors values(102,1005,2);

select SubName from Subject where SubName = 'Oracle Database';
select SubName from Subject where subname like 'J%'; 
select SubName from Subject where SubName like '%.net%';
select AName from Authors where AName like '%er';
select Pname from Publishers where Pname like '%hill%';
select Title from Title where Price < 500;
select Title from Title where Pub_Date = '2005-03-04';
select SubName from subject where Subid = 'JAVA' OR Subid ='JEE';
select AName from Authors where Auid > 103;
select * from Title where Title_id = 1001 OR Price > 400; 
select * from Publishers where Pname = 'TECHMEDIA' OR Pname ='WROX';
select avg(importance) from TitleAuthors;
select max(price) from Title;
select sum(price) from Title;



create table Employee(empid int,Emp_Name varchar(30));

insert into Employee values(1,'Rushikesh Joshi');
insert into Employee values(2,'Roshani Deoghare');
insert into Employee values(4,'Rushabh Bhoyar');
insert into Employee values(3,'Rupali Kale');


alter table Employee add primary key (empid);
alter table Employee add dept_id int NOT NULL;
alter table Employee modify Emp_Name varchar(30);
update Employee set Emp_Name = 'Radhika Joshi' where empid = 4;
update Employee set Emp_Name = 'Rudrani Ajanakar' where empid = 3;
truncate table employee;

create table Employee1(
					   Empid int Not NULL UNIQUE,
					   Emp_Name varchar(30),
                       Salary float(7,3)
					  );
                       
insert into Employee1 values(101,'Riya',1234.57);
insert into Employee1 values(102,'Monika',1530.23);
insert into Employee1 values(103,'Amol',1652.76);
insert into Employee1 values(104,'Bhushan',1775.15);

desc Employee1;
select * from Employee1;

select round(1234.567,2) as Employee1;
select round(1530.019,2) as Employee1;

select ceil(1530.019) as Employee1;
select ceil(1775.156) as Employee1;

select ceiling(1652.786) as Employee1;
Select ceiling(1234.567) as Employee1;

select floor(1530.019) as Employee1;
select floor(1652.786) as Employee1;

select sign(-15);
select sign(240);

select mod( 17,5);
select 23 mod 7;
select 15 % 4;

select sqrt(256);
select sqrt(64);

select power(12,2);
select power(23,2);

select truncate(1234.576,2);
select truncate(1557.123,1);

select character_length("CDAC Kharghar") as LengthOfString;
select concat("CDAC Kharghar") as ConcatenatedString;
select concat_ws("-", "Welcome", "to", "CDAC","Mumbai");
select reverse("Hello Friends");

select curdate();
select current_date();
select current_time();
select current_timestamp();
select curtime();

/*
DBT Assignment
Following are the questions on Publishers, Authors, Titles and titleauthors tables:-
*********************************************************
1. List pnam e, phone, email from Publishers.
2. List aname, phone from Authors.
3. List titleid, title, pubdate from Titles.
4. List auid, titleid, importance from titleauthors.
*************************(like)***************************
1. select subject name "oracle" from subjects table.
2. select subject name starts whith 'j'.
3. select subject name which contains ".net" .
4. select author name ends whith 'er'.
5. select publishers name which contains "hill".
******************(relational operator)***********************
1. select title from title table having price less than 500.
2. select title from title table published before '3 april'.
3. select subject name from subject having id as 'java' or 'jee'.
4. seelct author name from author table id greater than '103'.
5. select all from title having titleid as 101 or price > 400.
**********************(IN operator)*************************
6.select all from publishers table  where publisher name is ('TECHMEDIA', 'WROX');
******************(aggregate function)**********************
1. select maximum price from titles table.
2. select average importance from titleauthors. 
3. select number of records from author table.
4. select sum of prices of all books.
********************(date)********************************
1. select title from title table where month is 'Apr'.
2. select year from system date.
3. select month from system date.
4. select last day of month when 'java' book published.
**********************(DML)*******************************
create table Employee with emp_id (number),emp_name(char(50)) and insert some value.
1. Add one column name 'dept_id ' in table name 'Employee';
2. Change the datatype of column 'char' from tablename 'Employee' to 'varchar2'.
3. update name of employee to 'Scott'
4. truncate the table.
**********************************************************
Table=> Emp
SAL(float(7,3))
------------------
1234.567
1530.019
1652.786
1775.156
Perform :
1. round
2. truncate 
3. ceil
4. floor
5. sign(-15)
6. mod
7. sqrt
8. power
*****************************************************************
1. perform all string function on string "CDAC juhu".
2. perform different date and time functions. 
*****************************End**********************************
*/
