use exam;
drop tables if exists cinema;
drop tables if exists customer;
drop tables if exists reservation;
drop tables if exists theater;

-- 테이블 생성 : 극장 (theater)
CREATE TABLE theater (
    theaterNum INTEGER PRIMARY KEY,
    theaterName VARCHAR(20),
    theaterLocation VARCHAR(20)
);

-- 테이블 생성 : 고객 (Users)
CREATE TABLE users (
    userNum INTEGER PRIMARY KEY,
    userName VARCHAR(20),
    userAddress VARCHAR(20)
);

-- 테이블 생성 : 상영관 (Cinema)
CREATE TABLE cinema (
    theaterNum INTEGER NOT NULL,
    cinemaNum INTEGER PRIMARY KEY,
    movieName VARCHAR(20),
    price INTEGER,
    seat INTEGER,
    FOREIGN KEY (theaterNum)
        REFERENCES theater (theaterNum)
);

-- 테이블 생성 : 예약 (reservation)
CREATE TABLE reservation (
    theaterNum INTEGER NOT NULL,
    cinemaNum INTEGER NOT NULL,
    userNum INTEGER NOT NULL,
    seatNum INTEGER,
    date DATE,
    FOREIGN KEY (theaterNum)
        REFERENCES theater (theaterNum),
    FOREIGN KEY (cinemaNum)
        REFERENCES cinema (cinemaNum),
    FOREIGN KEY (userNum)
        REFERENCES users (userNum)
);

-- 테이블 데이터 생성 : 극장 (theater)
insert into theater(theaterNum, theaterName, theaterLocation) 
	values(1,"롯데", "잠실");
insert into theater(theaterNum, theaterName, theaterLocation) 
	values(2,"메가", "강남");
insert into theater(theaterNum, theaterName, theaterLocation) 
	values(3,"대한", "잠실");
	
-- 테이블 데이터 생성 : 상영관 (cinema)
insert into cinema(theaterNum, cinemaNum, movieName, price, seat)
	values(1, 1, "어려운 영화", 15000, 48);
insert into cinema(theaterNum, cinemaNum, movieName, price, seat)
	values(3, 3, "멋진 영화", 7500, 120);
insert into cinema(theaterNum, cinemaNum, movieName, price, seat)
	values(3, 2, "재밌는 영화", 8000, 110);
    
-- 테이블 데이터 생성 : 고객 (users)
insert into users(userNum, userName, userAddress)
	values(3,"홍길동","강남");
insert into users(userNum, userName, userAddress)
	values(4,"김철수","잠실");
insert into users(userNum, userName, userAddress)
	values(9,"박영희","강남");
    
-- 테이블 데이터 생성 : 예약 (reservation)
insert into reservation(theaterNum, cinemaNum, userNum, seatNum, date)
	values(3,2,3,15,"2014-09-01");
insert into reservation(theaterNum, cinemaNum, userNum, seatNum, date)
	values(3,3,4,16,"2014-09-01");
insert into reservation(theaterNum, cinemaNum, userNum, seatNum, date)
	values(1,1,9,48,"2014-09-01");


select * from theater;
select * from cinema;
select * from users;
select * from reservation;


create view vw_Orders (orderid, custid, name, bookid, bookname, saleprice, orderdate)
as select od.orderid, od.custid, cs.name, od.bookid, bk.bookname, od.saleprice, od.orderdate
from Orders od, customer cs, book bk where od.custid= cs.custid and od.bookid=bk.bookid;   

drop view vw_th_user;

create view vw_th_user (theaterName, userName) as select th.theaterName, us.userName from theater th, users us , reservation rs where th.theaterNum = rs.theaterNum and us.userNum = rs.userNum;

create view vw_custByDate (theaterName, numOfcust, date) as select th.theaterName, count(rs.date) as cnt, rs.date from theater th, reservation rs, users us
 where th.theaterNum = rs.theaterNum and us.userNum = rs.userNum group by rs.date;

create view vw_numOfCust as select us.theaterName, count(us.userNum)
from theater th, reservation, rs, users us where us.theaterNum = rs.theaterNum and r.userNum = u.userNum;

select count(us.userNum) from theater th, reservation rs, users us where th.theaterNum = rs.theaterNum and rs.userNum = us.userNum
and th.theaterName = '대한' group by rs.date order by date;

drop view vw_custByDate;

select * from exam.vw_th_user;

select * from exam.vw_custByDate;