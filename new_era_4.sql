USE new_era_4;
/* Write a Procedure that displays names and salaries of all Analysts recorded in the “emp” table by making use of a cursor.  */

delimiter &&
create procedure disp_name_sal()
begin
declare highest_sal int ;
declare Ename21 varchar(50) ;
declare display cursor for select Ename,sal from emp ;
open display ;
fetch display into Ename21,highest_sal ;
select  Ename,sal from emp where job = 'Analyst' ;
close display ;
end &&

call disp_name_sal() ;

/* 2.	Write a Procedure to display top 5 employees based on highest salary and display employee number, employee name and salary using Cursor. */
drop procedure disp_top5 ;
delimiter &&
create procedure disp_top5()
begin
declare sal1 int ;
declare Ename21 varchar(50) ;
declare empno1 int ;
declare display cursor for select empno,Ename,sal from emp ;
open display ;
fetch display into empno1,Ename21,sal1 ;
select empno, Ename,sal from emp  order by sal desc limit 5 ;
close display ;
end &&
delimiter ;
call disp_top5() ;



/*3 .Write  a procedure to display the concatenated first_name and last_name from “emp” table using cursors handle the  errors with Exit handler */

drop procedure frist_Last_Name;
delimiter &&
create procedure frist_Last_Name()
begin
declare firstname varchar(50);
declare lastname varchar(50) ;
declare finished integer default 0;
declare fullname varchar(50);
declare display cursor for select ename from emp ;
declare exit handler for NOT FOUND set finished = 1 ;
open display ;
	getname : LOOP
		fetch display into firstname;
		if(finished = 1 ) then
        set fullname = concat (firstname," ",lastname);
			leave getname;
		end if ;
        select "error handled";
	end LOOP getname;
close display ;
end &&
delimiter ;
select * from emp ;
call frist_Last_Name();



/*	4.	Write a procedure which select all the data from employee table and display the data of 
employee where employee name is ‘Manish’ using cursors. */

drop procedure emp_details;
delimiter &&
create procedure emp_details()
begin
declare empno int;
declare empname varchar(30);
declare emp_job varchar(20);
declare emp_mgr decimal(4,0);
declare emp_hiredate date;
declare emp_sal decimal(7,2);
declare dept_no decimal(2,0);

declare display cursor for select * from emp ;
open display ;
fetch display into empno,empname,emp_job,emp_mgr,emp_hiredate,emp_sal,dept_no ;
select * from emp where ename = 'Manish' ;
close display ;
end &&

call emp_details();


/*5. Write a procedure which select delete the data from employee table if emp sal is less than 10000  using cursor and handle the  Sqlexception with continue handler */

drop procedure details;
delimiter &&
create procedure details()
begin
declare empno int;
declare empname varchar(30);
declare emp_job varchar(20);
declare emp_mgr decimal(4,0);
declare emp_hiredate date;
declare emp_sal decimal(7,2);
declare dept_no decimal(2,0);
declare finished integer default 0;

declare display cursor for select * from emp ;
declare continue handler for SQLException set finished = 1 ;

open display ;
	-- getsal : LOOP
		fetch display into empno,empname,emp_job,emp_mgr,emp_hiredate,emp_sal,dept_no;
		/*if(finished = 1 ) then*/
             delete from emp where sal < 1000;
			-- leave getsal;
		-- end if ;
        -- select 'error handled';
	-- end LOOP getsal;
close display ;
end &&
delimiter ;

select * from emp; 
call details();








