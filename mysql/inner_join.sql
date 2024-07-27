show databases;

use madangdb;

show tables;

select * from book;
select * from customer;
select * from orders;

-- 내부 조인 
select * from orders o join book b on o.bookid = b.bookid;

-- 조인하여 특정 칼럼만 뽑아옴
-- book id의 경우 order의 bookid를 가져올지 book 의 bookid를 가져올지 선택해야함.
select o.bookid, saleprice, bookname, publisher from orders o join book b on o.bookid = b.bookid where b.bookid = 10;