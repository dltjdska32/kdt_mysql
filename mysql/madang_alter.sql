set sql_safe_updates = 0;
-- 출판사가 대한미디어인것을 대한스포츠로 바꿈
update newbook
set publisher = '대한스포츠'
where publisher = '대한미디어';