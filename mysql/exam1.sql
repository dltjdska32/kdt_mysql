show databases;

use exam;

create table dept(
	deptno integer not null,
    dname varchar(14),
    loc varchar(13),
    primary key (deptno)
);

create table emp(
	empno integer not null primary key,
    ename varchar(10),
    job varchar(9),
    mrg int,
    hiredate date,
    sal integer,
    comm integer,
    deptno integer,
    foreign key (deptno)
    references dept(deptno)
);

show tables;
desc emp;

insert into dept(deptno, dname,loc) values(10, 'accounting', 'newyork');
insert into dept(deptno, dname,loc) values(20, 'research', 'dallas');
insert into dept(deptno, dname,loc) values(30, 'sales', 'chicago');
insert into dept(deptno, dname,loc) values(40, 'operations', 'boston');

insert into emp values(7369, 'smith', 'clerk', 7902, '1980-12-17 00:00:00', 800, null, 20);
insert into emp values(7499, 'allen', 'salesman', 7698, '1981-02-20 00:00:00', 1600, 300, 30);
insert into emp values(7521, 'ward', 'salesman', 7698, '1981-02-22 00:00:00', 1250, 500, 30);
insert into emp values(7566, 'jones', 'manager', 7839, '1981-04-02 00:00:00', 2975, null, 20);

select * from dept;
select * from emp;

-- 참조키 에 50의 값이 없기때문에 오류 발생
-- insert into emp values(7654, 'martin', 'salesman', 7698, '1981-09-28 00:00:00', 1250, 1400, 50);

select ename, loc from emp, dept where emp.deptno = dept.deptno;

alter table dept add managername varchar(13);

select * from dept;

update dept set managername = "messi" where deptno=10;
update dept set managername = "son" where deptno=20;
update dept set managername = "Kim" where deptno=30;