use madangdb;
drop table if exists book_log;

create table book_log(
	bookid_l integer,
    booname_l varchar(40),
    publisher_l varchar(40),
    price_l integer,
    inst_date datetime
    );
    
drop trigger if exists AfterInsertBook;
    
delimiter //
create trigger AfterInsertBook
	after insert on book for each row
begin
	declare average integer;
	insert into book_log
		values(new.bookid, new.bookname, new.publisher, new.price, sysdate());
End;
//
