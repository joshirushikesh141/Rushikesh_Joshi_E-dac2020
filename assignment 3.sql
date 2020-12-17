create database assignment3;
use assignment3;

CREATE TABLE department(
							id integer,
							dept_no integer,
							dept_name varchar(50),
							CONSTRAINT dept_pk PRIMARY KEY(id)
						);

CREATE TABLE employee(
							  id         integer,
							  emp_name   varchar(100),
							  dept_id    integer,
							  CONSTRAINT emp_pk PRIMARY KEY (id),
							  CONSTRAINT emp_dept_fk FOREIGN KEY (dept_id) REFERENCES department(id)
						);
alter table employee add salary integer;
alter table employee add designation char(20);

INSERT INTO department values(1,10,'finance');
INSERT INTO department values(2,11,'training');
INSERT INTO department values(3,12,'marketing');

INSERT INTO employee values(1,'Arun',1,6000,'manager');
INSERT INTO employee values(2,'kiran',1,86000,'manager');
INSERT INTO employee values(3,'scott',1,7000,'developer');
INSERT INTO employee values(4,'max',2,8000,'tester');
INSERT INTO employee values(5,'king',2,90000,'DBA');


select sum(salary) from employee group by (dept_id) ;
select dept_id ,sum(salary) from employee where salary>7000 group by(dept_id);

select count(dept_id),sum(salary) from employee group by dept_id having  sum(salary)>7000;
select count(dept_id),sum(salary)from employee group by dept_id having sum(salary)<18000;

/*
Order by, group by,having
1)	create table Department with dept_id(integer),dept_name(varchar(50)).
dept_id will be foreign key in Employee table.

Employee table
---------------------------
empid	emp_name	dept_id	salary	 manager
1	Arun		1		8000	  4
2 	kiran		1		7000	  1	
3	Scott		1		3000	  1
4	Max		2		9000	
5	Jack		2		8000	  4
6	King				6000	  1

Department table
-------------
dept_id		dept_name
1		Finance
2		Training
3		Marketing

Apply not null,primary key and foreign key constraints.
***********order by
1. select all from authors sort ascending by author name.  ?????????
2. select all from publishers sort descending by publisher name.  ?????????
***********group by
1. select all data and sum of salary from employee and group according to deptid.
2. select deptid and sum of salary where salary is greater than 17000 and group by deptid.
*********having
1. select deptid and sum of salary where sum of salary is greater than 18000 and grup by deptid.  
2. select deptid and sum of salary where sum of salary is less than 20000 and grup by deptid.
*/