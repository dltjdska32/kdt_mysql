show databases;

use madangdb;

show tables;


-- 셀프 조인을 위한 예제 테이블
create table emp_table (
	emp varchar(4), 
    manager varchar(4),
    phoneNum varchar(12)
);

insert into emp_table values("대표", null, '0000');
insert into emp_table values("영업이사","대표", "1111");
insert into emp_table values("관리이사","대표", '2222');
insert into emp_table values("정보이사","대표", "3333");
insert into emp_table values("영업과장","영업이사", "1111-1");
insert into emp_table values("경리부장", "관리이사", '2222-1');
insert into emp_table values("인사부장","관리이사", "2222-2");
insert into emp_table values("개발팀장","정보이사", "3333-1");
insert into emp_table values("개발주임","정보이사", "3333-1-1");

select * from emp_table;

-- 직원 테이블에서 바로 직속상관의 전화번호를 알수없음.
-- 직원테이블에서 직원의 직속 상관의 전화번호를 알아보기위해 <셀프조인>을 통해 알아볼수있음
-- 자기자신과 자기자신을 조인하여 직속상관(manager)의 번호를 알아볼수있음
select *
	from  emp_table a join emp_table b 
    on a.manager = b.emp;


select a.emp as "직원", a.manager as "직속상관" , b.phoneNum "직속상관 번호" 
	from  emp_table a join emp_table b 
    on a.manager = b.emp;



