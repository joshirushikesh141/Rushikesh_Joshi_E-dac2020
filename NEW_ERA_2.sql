create database NEW_ERA_2;
use NEW_ERA_2;
drop database NEW_ERA_2;
set SQL_SAFE_UPDATES =0;

Create table EMP ( EMPNO numeric(4) not null,
				   ENAME varchar(30) not null, 
                   JOB varchar(10), 
                   MGR numeric(4), 
                   HIREDATE date, 
                   SAL numeric(7,2), 
                   DEPTNO numeric(2) ); 
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1002 , 'Ashish', 'SALESMAN',1003 , '2013-02-18',  750,  30 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10);
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1005 , 'Sachin', 'ANALYST', 1006 ,  '2019-02-18', 3000, 10 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1006,  'Pooja',  'MANAGER', null, '2000-02-18' ,6000, 10 );
select * from EMP; 

Create table Dept (dno numeric(4) not null, 
				   dname varchar(10) not null,
                   area varchar(30));
Insert into Dept(dno,dname,area) values(10,'Store','Mumbai');
Insert into Dept(dno,dname,area) values(20,'Purchase','Mumbai');
Insert into Dept(dno,dname,area) values(30,'Store', 'Delhi');
Insert into Dept(dno,dname,area) values(40,'Marketing','Pune');
Insert into Dept(dno,dname,area) values(50,'Finance','Delhi');
Insert into Dept(dno,dname,area) values(60,'Accounts','Mumbai');
select * from Dept;

/* 1.	Write function that accepts a positive number from a user and displays its factorial on the screen. */

delimiter ##
create function factorial(pno int) returns int
deterministic
begin
declare factout int default 1;
		while pno >= 1
        do
			set factout = factout * pno;
            set pno = pno - 1;
		end while;
        return factout;
end ##
delimiter ;
select factorial (3);

/* 2. Write a function that accepts a positive number ‘n’ and displays whether that number is a Prime number or not. */
drop function Primenumber;
delimiter ##

create function Primenumber (n int) returns varchar(30)
deterministic
begin
declare i int;
declare num int;
declare count int;
declare result varchar(30);

set i=2;
set num=n;
set count = 0;

		while (i<=num)
        do
			if (num % i = 0) then
					set count = count + 1;
			end if;
					set i = i + 1;
			end while ;

			if count = 1 then
				set result = "Prime Number";
			else
				set result = "Not a Prime Number";
			end if;
            return result;
end ##
delimiter ;

select Primenumber(4);


/* 3.	Write a function to Convert an inputed number of inches into yards, feet, and inches.
	For example, 124 inches equals 3 yards, 1 foot, and 4 inches. */

delimiter //
create function Conversion(num decimal(3,0)) returns varchar(100)
DETERMINISTIC
BEGIN

declare  yards,feet , inches , n decimal(3,0);
set n = num;
set yards = n / 36;
set n = n % 36;
set feet = n / 12;
set n = n % 12;
set inches = n;

return concat(num,'inches equals,', yards ,' yards,', feet ,' foot,', inches,'inches.');
END //

select Conversion(124); 

/* 4.	Write a function to update salary of the employees of specified dept by 10%. Take dept no as parameter. */

DROP function Update_Salary;
delimiter &&
create function Update_Salary(dept_no int) returns int
DETERMINISTIC
BEGIN
declare num int;
set num = dept_no;
update EMP set sal = sal + (sal* 0.1) where deptno = num;
return 1;
END &&

set sql_safe_updates =0;
select Update_Salary(30);


/* 5.	Create a function named USER_ANNUAL_COMP that has a parameter p_eno for passing on the values of  an employee number of the employee and p_comp for passing the compansation. In the function calculates and returns the annual compensation of the employee by using the following formula.
annual_compensation =  (p_sal+p_comm)*12
If the salary or commission value is NULL then zero should be substituted for it.  Give a call to USER_ANNUAL_COMP.*/


drop function USER_ANNUAL_COMP ;
delimiter $$
create function USER_ANNUAL_COMP(p_eno  int, p_comp int)
returns int
deterministic 
BEGIN
declare annual_compensation long;
declare p_sal int ;
SET p_sal= (SELECT sal FROM EMP WHERE empno=p_eno) ;

IF (p_sal = null OR p_comp = null) THEN
		set annual_compensation = 0 ;
	ELSE
		set annual_compensation = (p_sal+p_comp)*12 ;
END IF;
return annual_compensation;
end $$ 

select USER_ANNUAL_COMP(1006,50);

/* 6.	Create a procedure called USER_QUERY_EMP that accepts three parameters. 
		Parameter p_myeno is of IN parameter mode which provides the empno value. 
		The other two parameters p_myjob and p_mysal are of OUT mode.
		The procedure retrieves the salary and job of an employee with the provided employee number and assigns those to the two OUT parameters respectively.
		The procedure should raise the error if the empno does not exist in the EMP table by displaying an appropriate message.*/
        
drop procedure  USER_QUERY_EMP; 
delimiter //
create procedure USER_QUERY_EMP(IN p_myeno int, OUT p_myjob varchar(10), OUT p_mysal int) 

BEGIN
declare PRESENT_ENO int;
 set PRESENT_ENO = (select COUNT(*) from EMP where empno=p_myeno);
 
 IF (PRESENT_ENO=0) then
    select "EMLOYEE NOT EXIST";
    else
     select job,salary into p_myjob ,p_mysal from EMP where empno=p_myeno;
    end IF;
 END //
 
CALL  USER_QUERY_EMP(1001,@J, @S);
SELECT @J,@s ;


/* 7.	Create a procedure to print the inputted string in reverse order. If  inputted string is null display an appropriate message */

delimiter &&
create procedure REVERSE_STRINGIN(INOUT STR_NAME varchar(50))
BEGIN

IF (isNull(STR_NAME)) THEN
    select "EMLOYEE NOT EXIST";
    else
     select Reverse(STR_NAME) into STR_NAME ;
    END IF;
 END &&
 
 SET @X = "Roshani" ;
 CALL REVERSE_STRINGIN(@X) ;
 SELECT @X ;
 
 
 set@y = null ;
 CALL REVERSE_STRINGIN(@y) ;
 SELECT @y ;

 
 
/*	 8.	Create a procedure named ‘tabledetails’ which gives all the details of a particular table stored in database */

drop PROCEDURE tabledetails ;
delimiter &&
CREATE PROCEDURE tabledetails(INout STR_NAME varchar(50))
BEGIN
   SET @z = CONCAT('Select * from information_schema.tables WHERE table_name = ','\'',STR_NAME,'\'');
    Prepare stmt from @z;
    EXECUTE stmt;
    
	if(table_name = STR_NAME)then
		select * from STR_NAME ;
	else
        select "no output" ;
	end if ;
END &&

set @x = 'emp' ;
call tabledetails(@x) ;
select @x ;
 
