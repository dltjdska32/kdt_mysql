use madangdb;
show tables;

select * from book;

start transaction;

insert into book values ( 99, "데이터 베이스", "한빛", 25000);

select bookname "bookname1" from book where bookid=99;
savepoint a;

update book set bookname="데이터베이스 개론" where bookid=99;
select bookname "bookname2" from book where bookid=99;
savepoint b;

update book set bookname = "데이터 베이스 개론 및 실습" where bookid=99;
select bookname "bookname3" from book where bookid = 99;
rollback to b;
select bookname "bookname4" from book where bookid= 99;
commit;