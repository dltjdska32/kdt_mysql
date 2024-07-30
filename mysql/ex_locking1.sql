start transaction;
use madangdb;
select * from book where bookid = 1;

update book set price = 7100 where bookid=1;

select * from book where bookid = 1;

commit;