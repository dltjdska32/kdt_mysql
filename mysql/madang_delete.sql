use madangdb;

drop table newbook;
create table NewBook (
	bookid integer primary key auto_increment, -- id 자동 증가.
    bookname varchar(20),
    publisher varchar(20),
    price integer default 0
);

insert into newbook(bookname, publisher, price)
value ('골프황재', '우드출판사', 30000);

-- 프라이머리 키값이 자동증가여서 중복값을 계속 넣어도 됨.
insert into newbook(bookname, publisher, price)
	select bookname, publisher, price
    from book;
    
delete from newbook where bookname like "%축구%"; -- 축구가 들어가는 책이름 튜플 모두 삭제