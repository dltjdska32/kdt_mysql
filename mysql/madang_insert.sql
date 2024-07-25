use madangdb;

drop table newbook;
create table NewBook (
	bookid integer primary key,
    bookname varchar(20),
    publisher varchar(20),
    price integer
);

insert into newbook( bookid, bookname, publisher, price)
value (11, '스포츠 의학', '한솔의학서적', 90000);

insert into newbook
value (12, '스포츠 의학', '한솔의학서적', 50000);

insert into newbook( bookname, publisher, price,  bookid)
value ('스포츠 의학', '한솔의학서적', 90000,13);


insert into newbook (bookid) value (14); -- 프라이머리키 제외 null값이 들어갈수 있기때문에 bookid만 따로 값을 넣어줌 

alter table newbook modify bookname varchar(20) not null;

-- insert into newbook (bookid) value (14); -- 오류 발생 위에서 notnull로 변경했기때문에

alter table newbook modify price int default 1000; -- newbook의 가격을 디폴트값 1000원을 넣어줌.

insert into newbook(bookid, bookname) value (14, '골프 황재');



-- newbook테이블에 book테이블 값을 합침.

insert into newbook(bookid, bookname, publisher, price)
	select bookid, bookname, publisher, price
    from book