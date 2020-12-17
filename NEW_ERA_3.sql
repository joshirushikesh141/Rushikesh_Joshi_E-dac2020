create database NEW_ERA_3;
use NEW_ERA_3;

create table Ord_master( Ord_no INT not null , 
						 Cust_cd char(20), 
						 status char(20));
ALTER table Ord_master ADD PRIMARY KEY (Ord_no);
drop table Ord_dtl;
create table Ord_dtl( Ord_no int ,
					  Prod_cd char(10), 
                      Qty int (10),
                      foreign key(Prod_cd) references Prod_master(Prod_cd));
                      
create table Prod_master(Prod_cd char(20) Primary key,
						 Prod_name char(30),
						 Qty_in_stock int(30),
						 Booked_qty int(30)
						 );
                          
INSERT INTO Ord_master VALUES(1,'C1','P');

INSERT INTO Ord_dtl VALUES(1,'P1',100);
INSERT INTO Ord_dtl VALUES(2,'P2',200);

INSERT INTO Prod_master VALUES('P1','FLOPPIES',10000,1000);
INSERT INTO Prod_master VALUES('P2','PRINTERS',5000,600);
INSERT INTO Prod_master VALUES('P3','MODEMS',3000,200);


/*1. Write a Before Insert trigger on Ord_dtl. Anytime a row is inserted in Ord_dtl, the
Booked_qty in Prod_master should be increased accordingly.*/

DELIMITER $$
create trigger Ques1
before insert
on Ord_dtl
for each row
BEGIN
update Prod_master set Booked_qty = Booked_qty + new.Qty where Prod_cd = new.Prod_cd;
END $$
delimiter ;
insert into Ord_dtl value(1,'P3',300);
select * from Ord_dtl;
select * from Prod_master;

/*2. Write a Before Delete trigger on Ord_dtl. Anytime a row is deleted from Ord_dtl, the
Booked_qty in Prod_master should be decreased accordingly.*/

delimiter &&
create trigger Ques2
before delete 
on Ord_dtl
for each row
BEGIN 
update Prod_master set Booked_qty = Booked_qty - old.Qty where Prod_cd = old.Prod_cd;
END &&
select * from Ord_dtl;
delete from Ord_dtl where Prod_cd = 'P3';
select * from Prod_master;

/* 3. write A trigger to update the total salary of a department in dept_sal  table  when an employee is added or removed from  emp table .
Create table dept_sal (dept_no, tota_salary) – this table contains the total of salaries of employees working into that particular department.*/

create table dept_sal( dept_no int, total_salary int);

insert into dept_sal values (10,2000);
insert into dept_sal values(20,8000);
select * from dept_sal;

drop trigger Ques3;
delimiter ##
create trigger Ques3
after insert 
on EMP
for each row
BEGIN
update dept_sal set total_salary = total_salary + new.sal where dept_no = new.dept_no;
END ##

insert into assignment_6.EMP values(1007,'Rushikesh','Java Developer',1003,'2019-02=21',8000,30);

delimiter $$
create trigger Ques4 
after delete
on EMP
for each row
BEGIN
UPDATE DEPT_SAL SET tota_salary=tota_salary - OLD.SAL WHERE DEPT_NO=OLD.DEPTNO;
END $$