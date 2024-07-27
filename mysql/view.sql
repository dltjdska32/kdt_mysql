show databases;

use madangdb;



select orderid, saleprice from orders where saleprice <= (select avg(saleprice) from orders);

select orderid, custid, saleprice from orders od1 where 
saleprice > (select avg(saleprice) from orders od2 where od1.custid = od2.custid);


create view vw_Orders (orderid, custid, name, bookid, bookname, saleprice, orderdate)
as select od.orderid, od.custid, cs.name, od.bookid, bk.bookname, od.saleprice, od.orderdate
from Orders od, customer cs, book bk where od.custid= cs.custid and od.bookid=bk.bookid;                               




create index ix_book on book(bookname);

show index from book;
create index ix_book2 on book(publisher, price);

drop index ix_book2 on book;


select * from book where publisher="대한미디어" and price >= 30000;