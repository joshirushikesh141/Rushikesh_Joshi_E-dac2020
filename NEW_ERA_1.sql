CREATE DATABASE NEW_ERA_1;
USE NEW_ERA_1;

Create table EMP ( 
					EMPNO numeric(4) not null,
					ENAME varchar(30) not null,
                    JOB varchar(10),
                    MGR numeric(4),
                    HIREDATE date,
                    SAL numeric(7,2),
                    DEPTNO numeric(2)
				); 
                
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1002 , 'Ashish', 'SALESMAN',1003 , '2013-02-18',  750,  30 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10);
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1005 , 'Sachin', 'ANALYST', 1006 ,  '2019-02-18', 3000, 10 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1006,  'Pooja',  'MANAGER'  ,     null    , '2000-02-18' ,6000, 10 );

Create table dept (
					dno numeric(4) not null,
                    dname varchar(10) not null,
                    area varchar(30)
				  );
                  
Insert into dept(dno,dname,area) values(10,'Store','Mumbai');
Insert into dept(dno,dname,area) values(20,'Purchase','Mumbai');
Insert into dept(dno,dname,area) values(30,'Store', 'Delhi');
Insert into dept(dno,dname,area) values(40,'Marketing','Pune');
Insert into dept(dno,dname,area) values(50,'Finance','Delhi');
Insert into dept(dno,dname,area) values(60,'Accounts','Mumbai');

DROP PROCEDURE Q8;
-- 1.	Write a Procedure that accepts values of two non-zero numbers using IN parameter 
-- and perform addition, subtraction, multiplication, division and print.
-- ADDITION SUBSTRACTION MULTIPLICATION DIVISION

DELIMITER ##
CREATE PROCEDURE Q1(IN NUM1 INT, IN NUM2 INT)
BEGIN
DECLARE SUM,DIFF,MUL,DIVISION INT;

SET SUM = NUM1 + NUM2;
SET DIFF = NUM1 - NUM2;
SET MUL = NUM1 * NUM2;
SET DIVISION = NUM1 / NUM2;

SELECT SUM,DIFF,MUL,DIVISION;
END ##

CALL Q1(20,10);

-- 2.	Write a Procedure to print the string in REVERSE order. Take the input using IN parameter. (Ex .Database , o/p :esabatad)
-- REVERSE A STRING

DELIMITER ##
CREATE PROCEDURE Q2(IN STR CHAR(10))
BEGIN
SELECT REVERSE(STR);
END ##

CALL Q2("RUSHIKESH");
CALL Q2("RUSHABH");


-- OR
 
delimiter &&
create procedure Reverse_String_IN(INOUT Str_name varchar(50))
BEGIN

select REVERSE(Str_Name);

 END &&
 
 set @X = "Roshani" ;
 call Reverse_String_IN(@X) ;
 select @X ;
 
 set @Y = 'Mrunal';
 call Reverse_String_IN(@Y) ;
 select @Y ;


-- 3.	Write a Procedure to display top 5 employee based on highest salary and display employee number, employee name and salary.

DELIMITER ##
CREATE PROCEDURE Q3()
BEGIN
SELECT EMPNO, ENAME, SAL FROM EMP ORDER BY SAL DESC LIMIT 5;
END ##

CALL Q3();

-- 4.	Write a Procedure to create table emp_test with e_id integer, e_name varchar(10), e_joining_date date as columns

DELIMITER ##
CREATE PROCEDURE Q4()
BEGIN
CREATE TABLE emp_test (
						e_id integer,
                        e_name varchar(10),
                        e_joining_date date
					  );
SELECT * FROM emp_test;
END ##

CALL Q4();

-- 5.	Write a Procedure to add a department row in the DEPT table with the following values for columns
-- deptno  vaue 60,Dname  value should be  ‘Education’, area value should be Pune. 

DELIMITER ##
CREATE PROCEDURE Q5()
BEGIN
INSERT INTO DEPT VALUES(60,"EDUCATION","PUNE");
SELECT DISTINCT * FROM DEPT;
END ##

CALL Q5();

-- 6.	Write a program that declares an integer variable called num, assigns a value to it and print,
-- the value of the variable itself, its square, and its cube.

DELIMITER $$
CREATE PROCEDURE Q6()
BEGIN
DECLARE NUM,SQUARE,NUM_CUBE INT;
SET NUM=10;
SET SQUARE = NUM * NUM;
SET NUM_CUBE =NUM*NUM*NUM; 
SELECT NUM,SQUARE,NUM_CUBE;
END $$

CALL Q6();

-- OR

DELIMITER $$
CREATE PROCEDURE QN6(IN NUM1 INT,OUT NUM2 INT,OUT SQUARE2 INT,OUT NUM_CUBE2 INT)
BEGIN
DECLARE NUM2,SQUARE2,NUM_CUBE2 INT;
SET NUM2=NUM1;
SET SQUARE2 = NUM2 * NUM2;
SET NUM_CUBE2 =NUM2*NUM2*NUM2; 
END $$

CALL QN6(10,@NUM2,@SQUARE2,@NUM_CUBE2);
CALL QN6(20,@NUM2,@SQUARE2,@NUM_CUBE2);
CALL QN6(30,@NUM2,@SQUARE2,@NUM_CUBE2);
 
-- 7.	Write a program that declares an integer variable assign a value to it and display it using OUT parameter.

DELIMITER &&
CREATE PROCEDURE Q7(OUT VAR INT)
BEGIN
DECLARE VAR INT;
SET VAR=50;
SELECT VAR;
END &&

CALL Q7(@VAR);


-- 8.	Write a program that demonstrates the usage of IN and OUT parameters.

DELIMITER !!

CREATE PROCEDURE Q8(IN A INT,IN B INT, OUT X INT, OUT Y INT)
BEGIN
DECLARE SUM,DIFF INT;
SET SUM= A + B;
SET DIFF= A - B;
SELECT SUM INTO X;
SELECT DIFF INTO Y;
-- OR
-- SET X = SUM;
-- SET Y = DIFF;
END !!

CALL Q8(20,40,@X,@Y);
SELECT @X,@Y;