CREATE DATABASE ASSIGNMENT1;
USE ASSIGNMENT1;
-- drop database ASSIGNMENT1;

-- 1)	Create the table Member, Books and Issue
-- without any constraints as mentioned in the schema description above.

CREATE TABLE MEMBER(
						Member_Id	Numeric(5) unique,
						Member_Name	Varchar(30),
						Member_address	Varchar(50),
						Acc_Open_Date	Date,
						Membership_type	Varchar(20),
						Penalty_Amount	Numeric(7)
					);
CREATE TABLE BOOK(
						Book_No	Numeric(6),
						Book_Name VarChar(30),
						Author_name	Varchar(30),
						Cost Numeric(7),
						Category Char(10)
				);
CREATE TABLE ISSUE(
						Lib_Issue_Id Numeric(10),
						Book_No	Numeric(6),
						Member_Id	Numeric(5),
						Issue_Date	Date,
						Return_date	Date
				);
/*------------------------------------------------------------------------------------*/
-- 2)	View the structure of the tables.

desc MEMBER;
desc BOOK;
desc ISSUE;

select* from member;
select* from book;
select* from issue;

/*------------------------------------------------------------------------------------*/
-- 3)	Delete/Drop the column Penalty_Amount from Member
alter table MEMBER drop column Penalty_Amount2;
set sql_safe_updates =0;

-- 3.1)	add the column Penalty_Amount2 from Member
alter table MEMBER add column Penalty_Amount2 numeric(10);

-- 3.2) add primery key member_id
alter table MEMBER add primary key (Member_Id);


/*------------------------------------------------------------------------------------*/
-- 4)	Insert following data in table Member:

insert into MEMBER values(1,"Richa Sharma","Pune","2020-12-05","Lifetime");
insert into MEMBER values(2,"Garima Sen","Pune","2020-12-10","Annual");

insert into BOOK values(101,"Let us C","Denis Ritchie",450,"System");
insert into BOOK values(101,"Let us C","Denis Ritchie",450,"System");
insert into BOOK values(101,"Let us C","Denis Ritchie",450,"System");

