use madangdb;

drop procedure if exists insertBook;
drop procedure if exists averageprice;
drop procedure if exists bookInsertOrUpdate;

-- book 한개의 튜플을 삽입
delimiter //
create procedure insertBook(
	IN mybookid INTEGER,
    IN mybookname VARCHAR(40),
    IN mypublisher VARCHAR(40),
    IN myprice INTEGER)
BEGIN
	INSERT INTO Book(bookid, bookname, publisher, price)
    VALUES(mybookid, mybookname, mypublisher, myprice);
END;
//
delimiter;


delimiter // 
create procedure bookInsertOrUpdate(
	mybookid INTEGER,
    mybookname varchar(40),
    mypublisher varchar(40),
    myprice int)
begin
	declare mycount integer;
    select count(*) into mycount from book
		where bookname like mybookname;
if mycount != 0 then
	set sql_safe_updates=0; -- delete update연산에 필요한 설정
    update book set price = myprice
		where bookname like mybookname;
else 
	insert into book(bookid, bookname, publisher, price)
		values(mybookid, mybookname, mypublisher, myprice);
    end if;
end;
//
delimiter;




delimiter //
create procedure averageprice(
	out averageVal integer,
    out sumVal integer)
begin 
	select avg(price) into averageVal
    from book
    where price is not null;
    select sum(price) into sumVal
    from book;
end;
//

