show databases;

use madangdb;

show tables;

select * from book;
select * from customer;
select * from orders;


--  테스트용 대용량 데이터를 생성하고싶을 때 cross join을 사용하여 생성가능.
-- 카티지안 곱과 같음
create table cross_join_b_c
	select * from book cross join customer;

 
select count(*) from book;  --  12개 데이터 
select count(*) from customer; -- 5개 데이터 

-- 크로스 조인을 통해 총 60개의 데이터 생성 12 * 5
select count(*) from cross_join_b_c;

select * from cross_join_b_c;