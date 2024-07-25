use madangdb;

delimiter // 
create procedure interest()
begin
	declare myInterest Integer default 0.0;
    declare price integer;
    declare endOfRow boolean default false;
    declare interestCursor cursor for
		select saleprice from orders;
	declare continue handler for
		not found set endOfRow=true;
	open InterestCursor;
    cursor_loop: LOOP
		fetch interestCursor into price;
        if endOfRow then leave cursor_loop;
        end if;
        if price >= 30000 then
			set myInterest = myInterest + price * 0.1;
		else 
			set myInterest = myInterest + price * 0.05;
		end if;
	end loop cursor_loop;
    close InterestCursor;
    select concat('전체 이익 금액 = ' , myInterest);
End;
//
