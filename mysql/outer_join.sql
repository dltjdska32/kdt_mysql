show databases;

use madangdb;

show tables;

select * from book;
select * from customer;
select * from orders;

-- 내부조인을 할 경우 custid가 5인 박세리가 나오지 않음.
select o.custid, o.bookid, c.name as "이름", c.address as "주소" from orders o join customer c on o.custid = c.custid;


-- 외부조인을 하면 custid가 5인 박세리가 나옴. order테이블에는 박세리가 없기 때문.
-- 만약 order 테이블에 없는 박세리도 출력하고 싶다면 아우터 조인을 통해서 출력가능.
-- right outrer join 을통해 customer을 기준으로 조인
select o.custid, o.bookid, c.name as "이름", c.address as "주소" 
from orders o right outer join customer c on o.custid = c.custid order by o.custid;