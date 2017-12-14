drop table University;
drop table Library;
drop table Book;



CREATE TABLE University (
   univ_ID   varchar2(20) NOT NULL,
   univ_name varchar2(30) NOT NULL,
   primary key(univ_ID)
);

insert into University values('u100','홍익대학교');
insert into University values('u101','숭실대학교');
insert into University values('u102','단국대학교');
insert into University values('u103','서울대학교');

-- 도서관
CREATE TABLE Library (
   lib_ID    varchar2(10)  NOT NULL, -- 도서관ID
   lib_name  varchar2(30)  NOT NULL, -- 이름
   lib_addr  varchar2(100) NULL,     -- 주소
   lib_tel   varchar2(20)  NULL,     -- 전화번호
   lib_open  date          NULL,     -- 개관시간
   lib_close date          NULL,     -- 폐관시간
   univ_ID   varchar2(20)  NOT NULL,  -- 학교ID
   primary key(lib_ID),
   foreign key(univ_ID) REFERENCES University (univ_ID)
   ON DELETE cascade
);

insert into LIBRARY values('L100','법정도서관','마포구 상수동','02-322-7878',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u100');
insert into LIBRARY values('L101','중앙도서관','마포구 상수동','02-322-7979',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u100');
insert into LIBRARY values('L102','중앙도서관','동작구 상도동','02-646-4878',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u101');
insert into LIBRARY values('L103','미디어도서관','동작구 상도동','02-644-3878',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u101');
insert into LIBRARY values('L104','범정도서관','수지구 죽전동','031-7667-4448',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u102');
insert into LIBRARY values('L105','율곡도서관','수지구 죽전동','031-7644-7821',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u102');
insert into LIBRARY values('L106','아무도서관','관악구 신림동','02-3622-4478',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u103');
insert into LIBRARY values('L107','거나도서관','관악구 신림동','02-3622-7978',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u103');


CREATE TABLE Book (
   book_ID     varchar2(10) NOT NULL, -- 도서ID
   book_name   varchar2(100) NOT NULL, -- 제목
   book_author varchar2(30) NOT NULL, -- 저자
   book_cate   varchar2(30) NOT NULL, -- 분류
   book_year   DATE,     -- 발간년도
   book_page   INTEGER,     -- 페이지 수
   book_pub    varchar2(30) NOT NULL, -- 출판사
   lib_ID      varchar2(10) NOT NULL,  -- 도서관ID
   primary key(book_ID),
   FOREIGN KEY (lib_ID) REFERENCES Library (lib_ID)
   ON DELETE cascade
);

insert into book values ('B101','데이터베이스 시스템','정진','전공서',to_date('2010','yyyy'),453,'한빛미디어','L100');
insert into book values ('B102','즐거운 시간','이원창','소설',to_date('1988','yyyy'),456,'청년인재','L100');
insert into book values ('B103','데이터베이스 시스템은 정말 좋아','조은솔','전공서',to_date('2005','yyyy'),765,'양성교육','L100');
insert into book values ('B104','데이터베이스 시스템이 제일 쉬웠어요','조은별','전공서',to_date('2017','yyyy'),785,'미래창조','L100');
insert into book values ('B105','내일','한병림','전공서',to_date('1999','yyyy'),853,'민음사','L101');
insert into book values ('B106','나미야 잡화점의 기적','홍은주','전공서',to_date('2013','yyyy'),153,'창작사','L101');
insert into book values ('B107','원피스','이원종','만화',to_date('2004','yyyy'),953,'비평사','L101');
insert into book values ('B108','네트워크 프로그래밍','최정오','전공서',to_date('2002','yyyy'),753,'한빛미디어','L101');
insert into book values ('B109','해리포터와 마법사의 돌','조대진','소설',to_date('2004','yyyy'),553,'문학동네','L102');
insert into book values ('B110','헝거게임','이경식','소설',to_date('2016','yyyy'),483,'문학과','L102');
insert into book values ('B111','운영체제','박노진','전공서',to_date('2015','yyyy'),753,'지성사','L102');
insert into book values ('B112','열혈 c언어','구영석','전공서',to_date('2014','yyyy'),653,'한빛미디어','L102');
insert into book values ('B113','c언어 기초','임지연','전공서',to_date('2013','yyyy'),553,'한빛미디어','L103');
insert into book values ('B114','프랑스어','전민호','교양서',to_date('2008','yyyy'),353,'열린책들','L103');
insert into book values ('B115','오토마타','이성진','전공서',to_date('2011','yyyy'),853,'한빛미디어','L103');
insert into book values ('B116','빅데이터 2달 완성','김은삼','전공서',to_date('2011','yyyy'),453,'현대문학','L103');
insert into book values ('B300','코스모스','이성진','전공서',to_date('2011','yyyy'),353,'한빛미디어','L106');
insert into book values ('B301','점프 to Python','이성진','전공서',to_date('2011','yyyy'),753,'한빛미디어','L106');
insert into book values ('B302','Justice','이성진','전공서',to_date('2011','yyyy'),333,'한빛미디어','L106');
insert into book values ('B303','가면산장 살인사건','히가시노 게이노','소설',to_date('2011','yyyy'),983,'한빛미디어','L106');
insert into book values ('B304','백설공주 살인사건','이성진','소설',to_date('2011','yyyy'),153,'한빛미디어','L107');
insert into book values ('B305','눈 먼 자들의 도시','이성진','소설',to_date('2011','yyyy'),233,'한빛미디어','L107');
insert into book values ('B306','유성의 인연','이성진','소설',to_date('2011','yyyy'),783,'한빛미디어','L107');
insert into book values ('B307','모순','이성진','소설',to_date('2011','yyyy'),443,'한빛미디어','L107');
insert into book values ('B202','마시멜로 이야기','김한빛','교양',to_date('2017','yyyy'),353,'한빛미디어','L104');
insert into book values ('B203','시계가 보여요','이완','인문',to_date('1999','yyyy'),100,'창작사','L104');
insert into book values ('B204','다시태어난다면','김태희','인문',to_date('1994','yyyy'),344,'비평사','L104');
insert into book values ('B205','인어공주','전지현','인문',to_date('1995','yyyy'),213,'비평사','L104');
insert into book values ('B206','백설공주','공유','인문',to_date('2015','yyyy'),433,'한빛미디어','L105');
insert into book values ('B207','미녀와 야수','다니엘','인문',to_date('2001','yyyy'),53,'열린책들','L105');
insert into book values ('B208','남들보다 유리하게','스티븐연','자기계발',to_date('1998','yyyy'),153,'문학동네','L105');
insert into book values ('B209','제태크 이것만 한다면','최정오','자기계발',to_date('2002','yyyy'),1433,'지성사','L105');


-- 사본
CREATE TABLE Copy (
   book_ID  varchar2(10) NOT NULL, -- 도서ID
   copy_ID  varchar2(10) NOT NULL, -- 사본ID
   buy_date DATE         NOT NULL,  -- 구입날짜
   FOREIGN KEY (book_ID) REFERENCES Book (book_ID)
   ON DELETE cascade,
   PRIMARY KEY (book_ID,copy_ID)
);
 TO_DATE('2009/04/17 11:50:00','yyyy/mm/dd hh24:mi:ss')


insert into Copy values('B101','C001',to_date('2017/02/17','yyyy/MM/dd'));
insert into Copy values('B101','C002',to_date('2017/04/20','yyyy/MM/dd'));
insert into Copy values('B102','C001',to_date('2017/07/21','yyyy/MM/dd'));
insert into Copy values('B102','C002',to_date('2017/07/19','yyyy/MM/dd'));
insert into Copy values('B103','C001',to_date('2017/09/04','yyyy/MM/dd'));
insert into Copy values('B103','C002',to_date('2017/08/09','yyyy/MM/dd'));
insert into Copy values('B104','C001',to_date('2017/07/25','yyyy/MM/dd'));
insert into Copy values('B104','C002',to_date('2017/06/07','yyyy/MM/dd'));
insert into Copy values('B105','C001',to_date('2017/05/03','yyyy/MM/dd'));
insert into Copy values('B105','C002',to_date('2016/07/15','yyyy/MM/dd'));
insert into Copy values('B106','C001',to_date('2016/02/12','yyyy/MM/dd'));
insert into Copy values('B106','C002',to_date('2017/01/11','yyyy/MM/dd'));
insert into Copy values('B107','C001',to_date('2017/03/13','yyyy/MM/dd'));
insert into Copy values('B107','C002',to_date('2017/05/15','yyyy/MM/dd'));
insert into Copy values('B108','C001',to_date('2017/06/01','yyyy/MM/dd'));
insert into Copy values('B108','C002',to_date('2017/07/17','yyyy/MM/dd'));
insert into Copy values('B109','C001',to_date('2016/04/09','yyyy/MM/dd'));
insert into Copy values('B109','C002',to_date('2016/08/13','yyyy/MM/dd'));
insert into Copy values('B110','C001',to_date('2017/04/21','yyyy/MM/dd'));
insert into Copy values('B110','C002',to_date('2017/03/28','yyyy/MM/dd'));
insert into Copy values('B111','C001',to_date('2017/02/27','yyyy/MM/dd'));
insert into Copy values('B111','C002',to_date('2017/04/26','yyyy/MM/dd'));
insert into Copy values('B112','C001',to_date('2017/09/11','yyyy/MM/dd'));
insert into Copy values('B112','C002',to_date('2017/08/08','yyyy/MM/dd'));
insert into Copy values('B113','C001',to_date('2016/07/18','yyyy/MM/dd'));
insert into Copy values('B113','C002',to_date('2016/06/19','yyyy/MM/dd'));
insert into Copy values('B114','C001',to_date('2017/05/21','yyyy/MM/dd'));
insert into Copy values('B114','C002',to_date('2017/03/22','yyyy/MM/dd'));
insert into Copy values('B115','C001',to_date('2016/01/13','yyyy/MM/dd'));
insert into Copy values('B115','C002',to_date('2017/04/08','yyyy/MM/dd'));
insert into Copy values('B116','C001',to_date('2017/12/17','yyyy/MM/dd'));
insert into Copy values('B116','C002',to_date('2017/11/13','yyyy/MM/dd'));
insert into Copy values('B300','C001',to_date('2017/04/13','yyyy/MM/dd'));
insert into Copy values('B300','C002',to_date('2017/05/14','yyyy/MM/dd'));
insert into Copy values('B301','C001',to_date('2017/05/11','yyyy/MM/dd'));
insert into Copy values('B301','C002',to_date('2017/06/01','yyyy/MM/dd'));
insert into Copy values('B301','C003',to_date('2017/07/02','yyyy/MM/dd'));
insert into Copy values('B302','C001',to_date('2017/04/17','yyyy/MM/dd'));
insert into Copy values('B302','C002',to_date('2017/02/02','yyyy/MM/dd'));
insert into Copy values('B303','C001',to_date('2017/12/15','yyyy/MM/dd'));
insert into Copy values('B303','C002',to_date('2017/11/17','yyyy/MM/dd'));
insert into Copy values('B304','C001',to_date('2017/01/05','yyyy/MM/dd'));
insert into Copy values('B304','C002',to_date('2017/02/04','yyyy/MM/dd'));
insert into Copy values('B304','C003',to_date('2017/02/17','yyyy/MM/dd'));
insert into Copy values('B305','C001',to_date('2017/03/14','yyyy/MM/dd'));
insert into Copy values('B305','C002',to_date('2017/05/13','yyyy/MM/dd'));
insert into Copy values('B306','C001',to_date('2017/07/26','yyyy/MM/dd'));
insert into Copy values('B306','C002',to_date('2017/03/17','yyyy/MM/dd'));
insert into Copy values('B307','C001',to_date('2017/08/17','yyyy/MM/dd'));
insert into Copy values('B307','C002',to_date('2017/08/30','yyyy/MM/dd'));
insert into Copy values('B202','C001',to_date('2010/01/30','yyyy/MM/dd'));
insert into Copy values('B202','C002',to_date('2011/03/20','yyyy/MM/dd'));
insert into Copy values('B203','C001',to_date('2000/04/23','yyyy/MM/dd'));
insert into Copy values('B203','C002',to_date('2017/04/17','yyyy/MM/dd'));
insert into Copy values('B204','C001',to_date('2017/04/17','yyyy/MM/dd'));
insert into Copy values('B204','C002',to_date('2017/05/17','yyyy/MM/dd'));
insert into Copy values('B205','C001',to_date('2017/06/15','yyyy/MM/dd'));
insert into Copy values('B205','C002',to_date('2017/06/14','yyyy/MM/dd'));
insert into Copy values('B206','C001',to_date('2017/06/04','yyyy/MM/dd'));
insert into Copy values('B206','C002',to_date('2017/08/01','yyyy/MM/dd'));
insert into Copy values('B207','C001',to_date('2017/10/01','yyyy/MM/dd'));
insert into Copy values('B207','C002',to_date('2017/04/10','yyyy/MM/dd'));
insert into Copy values('B208','C001',to_date('2017/01/21','yyyy/MM/dd'));
insert into Copy values('B208','C002',to_date('2011/01/22','yyyy/MM/dd'));
insert into Copy values('B209','C001',to_date('2010/08/13','yyyy/MM/dd'));
insert into Copy values('B209','C002',to_date('2004/09/16','yyyy/MM/dd'));




--등급
CREATE TABLE UserGrade (
   grade         varchar2(30) NOT NULL, -- 등급
   checkout_num  INTEGER      NOT NULL, -- 대출권수
   checkout_days INTEGER      NOT NULL, -- 대출일수
   extend_days   INTEGER      NOT NULL,  -- 연장기간
   primary key(grade)
);

--등급: 재학생, 휴학생, 졸업생, 대학원생, 교수, 교직원

alter table UserGrade modify grade varchar2(30);

insert into USERGRADE values('재학생',5,14,14);
insert into USERGRADE values('휴학생',3,10,7);
insert into USERGRADE values('졸업생',3,7,7);
insert into USERGRADE values('대학원생',10,30,15);
insert into USERGRADE values('교수',20,90,45);
insert into USERGRADE values('교직원',18,60,30);


-- 소속
CREATE TABLE BelongTo (
   univ_num varchar2(10) NOT NULL, -- 학번
   univ_ID  varchar2(10) NOT NULL, -- 학교ID
   grade    varchar2(30) NOT NULL,  -- 등급
   FOREIGN KEY (grade) REFERENCES UserGrade (grade)
   ON DELETE cascade,
   FOREIGN KEY (univ_ID) REFERENCES University (univ_ID)
   ON DELETE cascade,
   PRIMARY KEY (univ_num,univ_ID)
);

alter table BelongTo modify grade varchar2(30);

insert into BELONGTO values('B211169','u100','재학생');
insert into BELONGTO values('B211247','u100','휴학생');
insert into BELONGTO values('B111181','u100','졸업생');
insert into BELONGTO values('P11003','u100','교수');
insert into BELONGTO values('A711501','u100','대학원생');
insert into BELONGTO values('E211169','u100','교직원');
insert into BELONGTO values('B017033','u100','재학생');

insert into BELONGTO values('20131897','u101','재학생');
insert into BELONGTO values('20111901','u101','휴학생');
insert into BELONGTO values('20051788','u101','졸업생');
insert into BELONGTO values('B20131157','u101','대학원생');
insert into BELONGTO values('110901','u101','교직원');
insert into BELONGTO values('20101897','u101','휴학생');
insert into BELONGTO values('A03897','u101','교수');

insert into BELONGTO values('32111475','u102','재학생');
insert into BELONGTO values('32111464','u102','재학생');
insert into BELONGTO values('k2111444','u102','교수');
insert into BELONGTO values('k2101480','u102','교수');
insert into BELONGTO values('g7213012','u102','대학원생');
insert into BELONGTO values('32110416','u102','휴학생');
insert into BELONGTO values('i22101346','u102','교직원');

insert into BELONGTO values('201211006','u103','재학생');
insert into BELONGTO values('201107034','u103','재학생');
insert into BELONGTO values('200831188','u103','졸업생');
insert into BELONGTO values('31069','u103','교수');
insert into BELONGTO values('201423001','u103','재학생');
insert into BELONGTO values('200731101','u103','대학원생');
insert into BELONGTO values('201716100','u103','재학생');

--user
CREATE TABLE Users (
   user_ID   varchar2(30)  NOT NULL, -- UserID
   user_pass varchar2(30)  NOT NULL, -- 비밀번호
   user_name varchar2(30)  NOT NULL, -- 이름
   user_addr varchar2(100) NULL,     -- 주소
   user_tel  varchar2(30)  NOT NULL, -- 연락처
   grade     varchar2(30)  NOT NULL, -- 등급
   univ_ID   varchar2(10)  NOT NULL, -- 학교ID
   univ_num  varchar2(10)  NULL,      -- 학번
   primary key(user_ID),
   FOREIGN KEY (grade)
   REFERENCES UserGrade (grade)
   ON DELETE cascade,
   FOREIGN KEY (univ_num,univ_ID)
   REFERENCES BelongTo (univ_num,   univ_ID)
   ON DELETE cascade   
);

alter table Users modify user_ID varchar2(30);
alter table Users modify user_pass varchar2(30);
alter table Users modify grade varchar2(30);

insert into Users values('onec911','onec911','이원창','서울시 종로구','010-2070-0911', '재학생','u100','B211169');
insert into Users values('eunsol704','eunsol704','조은솔','인천시 서구','010-3215-4545', '재학생','u101','20131897');
insert into Users values('qaz55','qaz55','한병림','서울시 중랑구','010-3131-7878', '재학생','u102','32111475');
insert into Users values('dozen5','dozen5','최정오','평택시 동구','010-8880-9797', '교수','u101','A03897');


-- 예약
CREATE TABLE Reserve (
   reserve_num INTEGER      primary key, -- 예약번호
   wait_num    INTEGER      NOT NULL, -- 대기번호
   user_ID     varchar2(10) NOT NULL, -- UserID
   book_ID     varchar2(10) NOT NULL, -- 도서ID
   copy_ID     varchar2(10) NOT NULL,  -- 사본ID
   FOREIGN KEY (book_ID, copy_ID) REFERENCES Copy (book_ID, copy_ID)
   ON DELETE cascade,
   FOREIGN KEY (user_ID) REFERENCES Users (user_ID)
   ON DELETE cascade
);

drop sequence seq_reserve;


CREATE SEQUENCE  seq_reserve
START WITH  100
INCREMENT BY 1

insert into RESERVE values(seq_reserve.nextval,0,'onec911','B101','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B102','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B103','C001');
insert into RESERVE values(seq_reserve.nextval,0,'qaz55','B104','C001');
insert into RESERVE values(seq_reserve.nextval,0,'eunsol704','B105','C001');

insert into RESERVE values(seq_reserve.nextval,0,'onec911','B103','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B104','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B105','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B106','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B107','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B107','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B108','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B108','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B110','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B111','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B112','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B113','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B113','C001');
select* from reserve 
-- 대출
CREATE TABLE CheckOut (
   checkout_num  INTEGER      primary key,
   checkout_date DATE         NOT NULL, -- 대출일
   return_date   DATE         NULL, -- 반납일
   due_date      DATE         NOT NULL, -- 반납예정일
   extend_num    INTEGER      NULL,     -- 연장횟수
   user_ID       varchar2(10) NOT NULL, -- UserID
   book_ID       varchar2(10) NOT NULL, -- 도서ID
   copy_ID       varchar2(10) NOT NULL,  -- 사본ID
   FOREIGN KEY (book_ID, copy_ID) REFERENCES Copy (book_ID, copy_ID)
   ON DELETE cascade,
   FOREIGN KEY (user_ID) REFERENCES Users (user_ID)
   ON DELETE cascade
);

drop table Checkout;

CREATE SEQUENCE  seq_checkout
START WITH  100
INCREMENT BY 1

drop sequence seq_checkout;
drop sequence seq_reserve;

insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/04/13','yyyy/MM/dd'),
                     to_date('2017/04/17','yyyy/MM/dd'),
                     to_date('2017/04/27','yyyy/MM/dd'),
                     0,
                     'onec911','B102','C001');
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/05/13','yyyy/MM/dd'),
                     to_date('2017/05/17','yyyy/MM/dd'),
                     to_date('2017/05/27','yyyy/MM/dd'),
                     0,
                     'onec911','B112','C001');
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/06/13','yyyy/MM/dd'),
                     to_date('2017/06/17','yyyy/MM/dd'),
                     to_date('2017/06/27','yyyy/MM/dd'),
                     0,
                     'onec911','B113','C001');
                     
                     insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/14','yyyy/MM/dd'),
                     to_date('2017/07/14','yyyy/MM/dd'),
                     to_date('2017/07/14','yyyy/MM/dd'),
                     0,
                     'dozen5','B102','C001'); 
                     
                     insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/14','yyyy/MM/dd'),
                     to_date('2017/07/14','yyyy/MM/dd'),
                     to_date('2017/07/14','yyyy/MM/dd'),
                     0,
                     'dozen5','B103','C001');
                     
                     insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/14','yyyy/MM/dd'),
                     to_date('2017/07/14','yyyy/MM/dd'),
                     to_date('2017/07/14','yyyy/MM/dd'),
                     0,
                     'dozen5','B104','C001'); 
                     
                     insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/14','yyyy/MM/dd'),
                     to_date('2017/07/14','yyyy/MM/dd'),
                     to_date('2017/07/14','yyyy/MM/dd'),
                     0,
                     'dozen5','B105','C001');
                     
                     insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/06/13','yyyy/MM/dd'),
                     to_date('2017/06/17','yyyy/MM/dd'),
                     to_date('2017/06/27','yyyy/MM/dd'),
                     0,
                     'dozen5','B106','C001');
                     
                     select * from CHECKOUT
                     
select *from tab;

insert into UNIVERSITY values()

insert into BELONGTO values('201211006','u103','재학생');
select *from Users
select univ_num, univ_name, grade 
from BelongTo b join University u
on b.univ_ID = u.univ_ID
where b.univ_num = '201211006'
and u.univ_name = '서울대학교'

select *from BELONGTO;


select reserve_num, wait_num, book_name, r.book_ID, copy_ID
from Reserve r join Book b
on r.book_ID = b.book_ID
where user_ID = 'onec911'

select *from USERS
select *from RESERVE

delete from users where user_ID = 'sssdf';
insert into Users values('aaaa','aaaa','이원종','서울시 중구','010-4448-7878','재학생',
						(select univ_ID 
						from University
						where univ_name = '서울대학교'),'201211006');
						
						
select* from USERS where user_ID = 'onec91'

drop table Checkout;
drop table Reserve;
drop table Copy;
drop table Book;
drop table Library;
drop table Users;
drop table BelongTo;
drop table University;
drop table UserGrade;
drop sequence seq_checkout;
drop sequence seq_reserve;


select *from tab

select 


=========================================================================

CREATE TABLE University (
   univ_ID   varchar2(20) NOT NULL,
   univ_name varchar2(30) NOT NULL,
   primary key(univ_ID)
);

insert into University values('u100','홍익대학교');
insert into University values('u101','숭실대학교');
insert into University values('u102','단국대학교');
insert into University values('u103','서울대학교');
insert into University values('u104','서가대학교');
insert into University values('u105','울산대학교');
insert into University values('u106','경기대학교');
insert into University values('u107','대전대학교');
insert into University values('u108','대구대학교');
insert into University values('u109','부산대학교');
insert into University values('u110','충북대학교');
insert into University values('u111','충남대학교');
insert into University values('u112','경북대학교');
insert into University values('u113','경남대학교');
insert into University values('u114','상명대학교');
insert into University values('admin','admin');


------------------------------------------------------------------------------------------------------

CREATE TABLE Library (
   lib_ID    varchar2(10)  NOT NULL, -- 도서관ID
   lib_name  varchar2(30)  NOT NULL, -- 이름
   lib_addr  varchar2(100) NULL,     -- 주소
   lib_tel   varchar2(20)  NULL,   	 -- 전화번호
   univ_ID   varchar2(20)  NOT NULL,  -- 학교ID
   lib_open  varchar2(20)          NULL,     -- 개관시간
   lib_close varchar2(20)         NULL,     -- 폐관시간
   primary key(lib_ID),
   foreign key(univ_ID) REFERENCES University (univ_ID)
   ON DELETE cascade
);




insert into LIBRARY values('L100','법정도서관','마포구 상수동','02-322-7878','u100','오전 9시','오후 6시');
insert into LIBRARY values('L101','중앙도서관','마포구 상수동','02-322-7979','u100','오전 9시','오후 6시');
insert into LIBRARY values('L102','중앙도서관','동작구 상도동','02-646-4878','u101','오전 11시','오후 8시');
insert into LIBRARY values('L103','미디어도서관','동작구 상도동','02-644-3878','u101','오전 9시','오후 6시');
insert into LIBRARY values('L104','범정도서관','수지구 죽전동','031-7667-4448','u102','오전 9시','오후 6시');
insert into LIBRARY values('L105','율곡도서관','수지구 죽전동','031-7644-7821','u102','오전 9시','오후 6시');
insert into LIBRARY values('L106','아무도서관','관악구 신림동','02-3622-4478','u102','오전 9시','오후 6시');
insert into LIBRARY values('L107','열림도서관','관악구 신림동','02-3622-7978','u103','오전 10시','오후 7시');
insert into LIBRARY values('L108','시바도서관','관악구 어디동','02-3622-7978','u103','오전 9시','오후 6시');
insert into LIBRARY values('L109','은솔도서관','노원구 에이동','02-3622-7978','u104','오전 9시','오후 6시');
insert into LIBRARY values('L110','솔미도서관','일본구 가츠동','02-3622-7978','u105','오전 8시','오후 5시');
insert into LIBRARY values('L111','미장도서관','어디구 가지동','02-3622-7978','u106','오전 8시','오후 6시');
insert into LIBRARY values('L112','화작도서관','강남구 미미동','02-3622-7978','u107','오전 8시','오후 5시');
insert into LIBRARY values('L113','사진도서관','지지구 볶는동','02-3622-7978','u108','오전 10시','오후 6시');
insert into LIBRARY values('L114','사나도서관','배고구 하하동','02-3622-7978','u109','오전 8시','오후 6시');
insert into LIBRARY values('L115','장사도서관','강남구 미미동','02-3622-7978','u110','오전 8시','오후 6시');
insert into LIBRARY values('L116','사진도서관','지지구 볶는동','02-3622-7978','u111','오전 9시','오후 8시');
insert into LIBRARY values('L117','비타도서관','배고구 하하동','02-3622-7978','u112','오전 9시','오후 9시');
insert into LIBRARY values('L118','민씨도서관','강남구 미미동','02-3622-7978','u113','오전 9시','오후 8시');
insert into LIBRARY values('L119','밥밥도서관','지지구 볶는동','02-3622-7978','u114','오전 9시','오후 7시');
insert into LIBRARY values('L120','진자도서관','배고구 하하동','02-3622-7978','u111','오전 9시','오후 5시');
insert into LIBRARY values('L121','장사도서관','강남구 미미동','02-3622-7978','u112','오전 9시','오후 4시');
insert into LIBRARY values('L122','사거도서관','지지구 볶는동','02-3622-7978','u113','오전 9시','오후 6시');
insert into LIBRARY values('L123','아무도서관','배고구 하하동','02-3622-7978','u114','오전 9시','오후 6시');


------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Book (
   book_ID     varchar2(10) NOT NULL, -- 도서ID
   book_name   varchar2(100) NOT NULL, -- 제목
   book_author varchar2(30) NOT NULL, -- 저자
   book_cate   varchar2(30) NOT NULL, -- 분류
   book_year   DATE,     -- 발간년도
   book_page   INTEGER,     -- 페이지 수
   book_pub    varchar2(30) NOT NULL, -- 출판사
   lib_ID      varchar2(10) NOT NULL,  -- 도서관ID
   primary key(book_ID),
   FOREIGN KEY (lib_ID) REFERENCES Library (lib_ID)
   ON DELETE cascade
);
select * from Book

insert into book values ('B101','데이터베이스 시스템','정진','전공서',to_date('2010','yyyy'),453,'한빛미디어','L100');
insert into book values ('B102','즐거운 시간','이원창','소설',to_date('1988','yyyy'),456,'청년인재','L100');
insert into book values ('B103','데이터베이스 시스템은 정말 좋아','조은솔','전공서',to_date('2005','yyyy'),765,'양성교육','L100');
insert into book values ('B104','데이터베이스 시스템이 제일 쉬웠어요','조은별','전공서',to_date('2017','yyyy'),785,'미래창조','L100');
insert into book values ('B105','내일','한병림','전공서',to_date('1999','yyyy'),853,'민음사','L101');
insert into book values ('B106','나미야 잡화점의 기적','홍은주','전공서',to_date('2013','yyyy'),153,'창작사','L101');
insert into book values ('B107','원피스','이원종','만화',to_date('2004','yyyy'),953,'비평사','L101');
insert into book values ('B108','네트워크 프로그래밍','최정오','전공서',to_date('2002','yyyy'),753,'한빛미디어','L101');
insert into book values ('B109','해리포터와 마법사의 돌','조대진','소설',to_date('2004','yyyy'),553,'문학동네','L102');
insert into book values ('B110','헝거게임','이경식','소설',to_date('2016','yyyy'),483,'문학과','L102');
insert into book values ('B111','운영체제','박노진','전공서',to_date('2015','yyyy'),753,'지성사','L102');
insert into book values ('B112','열혈 c언어','구영석','전공서',to_date('2014','yyyy'),653,'한빛미디어','L102');
insert into book values ('B113','c언어 기초','임지연','전공서',to_date('2013','yyyy'),553,'한빛미디어','L103');
insert into book values ('B114','프랑스어','전민호','교양서',to_date('2008','yyyy'),353,'열린책들','L103');
insert into book values ('B115','오토마타','이성진','전공서',to_date('2011','yyyy'),853,'한빛미디어','L103');
insert into book values ('B116','빅데이터 2달 완성','김은삼','전공서',to_date('2011','yyyy'),453,'현대문학','L103');
insert into book values ('B300','코스모스','이성진','전공서',to_date('2011','yyyy'),353,'한빛미디어','L106');
insert into book values ('B301','점프 to Python','이성진','전공서',to_date('2011','yyyy'),753,'한빛미디어','L106');
insert into book values ('B302','Justice','이성진','전공서',to_date('2011','yyyy'),333,'한빛미디어','L106');
insert into book values ('B303','가면산장 살인사건','히가시노 게이노','소설',to_date('2011','yyyy'),983,'한빛미디어','L106');
insert into book values ('B304','백설공주 살인사건','이성진','소설',to_date('2011','yyyy'),153,'한빛미디어','L107');
insert into book values ('B305','눈 먼 자들의 도시','이성진','소설',to_date('2011','yyyy'),233,'한빛미디어','L107');
insert into book values ('B306','유성의 인연','이성진','소설',to_date('2011','yyyy'),783,'한빛미디어','L107');
insert into book values ('B307','모순','이성진','소설',to_date('2011','yyyy'),443,'한빛미디어','L107');
insert into book values ('B202','마시멜로 이야기','김한빛','교양',to_date('2017','yyyy'),353,'한빛미디어','L104');
insert into book values ('B203','시계가 보여요','이완','인문',to_date('1999','yyyy'),100,'창작사','L104');
insert into book values ('B204','다시태어난다면','김태희','인문',to_date('1994','yyyy'),344,'비평사','L104');
insert into book values ('B205','인어공주','전지현','인문',to_date('1995','yyyy'),213,'비평사','L104');
insert into book values ('B206','백설공주','공유','인문',to_date('2015','yyyy'),433,'한빛미디어','L105');
insert into book values ('B207','미녀와 야수','다니엘','인문',to_date('2001','yyyy'),53,'열린책들','L105');
insert into book values ('B208','남들보다 유리하게','스티븐연','자기계발',to_date('1998','yyyy'),153,'문학동네','L105');
insert into book values ('B209','제태크 이것만 한다면','최정오','자기계발',to_date('2002','yyyy'),1433,'지성사','L105');



insert into book values ('B500','삼디다스를 신고','이성진','인문',to_date('2017','yyyy'),783,'한빛미디어','L123');
insert into book values ('B501','김치찌개','이성진','교양',to_date('2017','yyyy'),443,'한빛미디어','L122');
insert into book values ('B502','조은솔멍청이','김한빛','소설',to_date('2017','yyyy'),353,'한빛미디어','L121');
insert into book values ('B503','게임시간','이완','인문',to_date('2017','yyyy'),100,'창작사','L111');
insert into book values ('B504','개미지옥','김태희','소설',to_date('2017','yyyy'),344,'비평사','L115');
insert into book values ('B505','우리이대로','전지현','인문',to_date('2017','yyyy'),213,'비평사','L118');
insert into book values ('B506','배고프다','공유','전공서',to_date('2017','yyyy'),433,'한빛미디어','L119');
insert into book values ('B507','밥먹으러가자','다니엘','인문',to_date('2001','yyyy'),53,'열린책들','L120');
insert into book values ('B508','우리의 희망','스티븐연','자기계발',to_date('2017','yyyy'),153,'문학동네','L115');
insert into book values ('B509','사랑을 위해','최정오','자기계발',to_date('2017','yyyy'),1433,'지성사','L118');





------------------------------------------------------------------------------------------------------------
-- 사본
CREATE TABLE Copy (
   book_ID  varchar2(10) NOT NULL, -- 도서ID
   copy_ID  varchar2(10) NOT NULL, -- 사본ID
   buy_date DATE         NOT NULL,  -- 구입날짜
   FOREIGN KEY (book_ID) REFERENCES Book (book_ID)
   ON DELETE cascade,
   PRIMARY KEY (book_ID,copy_ID)
);



insert into Copy values('B101','C001',to_date('2017/02/17','yyyy/MM/dd'));
insert into Copy values('B101','C002',to_date('2017/04/20','yyyy/MM/dd'));
insert into Copy values('B102','C001',to_date('2017/07/21','yyyy/MM/dd'));
insert into Copy values('B102','C002',to_date('2017/07/19','yyyy/MM/dd'));
insert into Copy values('B103','C001',to_date('2017/09/04','yyyy/MM/dd'));
insert into Copy values('B103','C002',to_date('2017/08/09','yyyy/MM/dd'));
insert into Copy values('B104','C001',to_date('2017/07/25','yyyy/MM/dd'));
insert into Copy values('B104','C002',to_date('2017/06/07','yyyy/MM/dd'));
insert into Copy values('B105','C001',to_date('2017/05/03','yyyy/MM/dd'));
insert into Copy values('B105','C002',to_date('2016/07/15','yyyy/MM/dd'));
insert into Copy values('B106','C001',to_date('2016/02/12','yyyy/MM/dd'));
insert into Copy values('B106','C002',to_date('2017/01/11','yyyy/MM/dd'));
insert into Copy values('B107','C001',to_date('2017/03/13','yyyy/MM/dd'));
insert into Copy values('B107','C002',to_date('2017/05/15','yyyy/MM/dd'));
insert into Copy values('B108','C001',to_date('2017/06/01','yyyy/MM/dd'));
insert into Copy values('B108','C002',to_date('2017/07/17','yyyy/MM/dd'));
insert into Copy values('B109','C001',to_date('2016/04/09','yyyy/MM/dd'));
insert into Copy values('B109','C002',to_date('2016/08/13','yyyy/MM/dd'));
insert into Copy values('B110','C001',to_date('2017/04/21','yyyy/MM/dd'));
insert into Copy values('B110','C002',to_date('2017/03/28','yyyy/MM/dd'));
insert into Copy values('B111','C001',to_date('2017/02/27','yyyy/MM/dd'));
insert into Copy values('B111','C002',to_date('2017/04/26','yyyy/MM/dd'));
insert into Copy values('B112','C001',to_date('2017/09/11','yyyy/MM/dd'));
insert into Copy values('B112','C002',to_date('2017/08/08','yyyy/MM/dd'));
insert into Copy values('B113','C001',to_date('2016/07/18','yyyy/MM/dd'));
insert into Copy values('B113','C002',to_date('2016/06/19','yyyy/MM/dd'));
insert into Copy values('B114','C001',to_date('2017/05/21','yyyy/MM/dd'));
insert into Copy values('B114','C002',to_date('2017/03/22','yyyy/MM/dd'));
insert into Copy values('B115','C001',to_date('2016/01/13','yyyy/MM/dd'));
insert into Copy values('B115','C002',to_date('2017/04/08','yyyy/MM/dd'));
insert into Copy values('B116','C001',to_date('2017/12/17','yyyy/MM/dd'));
insert into Copy values('B116','C002',to_date('2017/11/13','yyyy/MM/dd'));
insert into Copy values('B300','C001',to_date('2017/04/13','yyyy/MM/dd'));
insert into Copy values('B300','C002',to_date('2017/05/14','yyyy/MM/dd'));
insert into Copy values('B301','C001',to_date('2017/05/11','yyyy/MM/dd'));
insert into Copy values('B301','C002',to_date('2017/06/01','yyyy/MM/dd'));
insert into Copy values('B301','C003',to_date('2017/07/02','yyyy/MM/dd'));
insert into Copy values('B302','C001',to_date('2017/04/17','yyyy/MM/dd'));
insert into Copy values('B302','C002',to_date('2017/02/02','yyyy/MM/dd'));
insert into Copy values('B303','C001',to_date('2017/12/15','yyyy/MM/dd'));
insert into Copy values('B303','C002',to_date('2017/11/17','yyyy/MM/dd'));
insert into Copy values('B304','C001',to_date('2017/01/05','yyyy/MM/dd'));
insert into Copy values('B304','C002',to_date('2017/02/04','yyyy/MM/dd'));
insert into Copy values('B304','C003',to_date('2017/02/17','yyyy/MM/dd'));
insert into Copy values('B305','C001',to_date('2017/03/14','yyyy/MM/dd'));
insert into Copy values('B305','C002',to_date('2017/05/13','yyyy/MM/dd'));
insert into Copy values('B306','C001',to_date('2017/07/26','yyyy/MM/dd'));
insert into Copy values('B306','C002',to_date('2017/03/17','yyyy/MM/dd'));
insert into Copy values('B307','C001',to_date('2017/08/17','yyyy/MM/dd'));
insert into Copy values('B307','C002',to_date('2017/08/30','yyyy/MM/dd'));
insert into Copy values('B202','C001',to_date('2010/01/30','yyyy/MM/dd'));
insert into Copy values('B202','C002',to_date('2011/03/20','yyyy/MM/dd'));
insert into Copy values('B203','C001',to_date('2000/04/23','yyyy/MM/dd'));
insert into Copy values('B203','C002',to_date('2017/04/17','yyyy/MM/dd'));
insert into Copy values('B204','C001',to_date('2017/04/17','yyyy/MM/dd'));
insert into Copy values('B204','C002',to_date('2017/05/17','yyyy/MM/dd'));
insert into Copy values('B205','C001',to_date('2017/06/15','yyyy/MM/dd'));
insert into Copy values('B205','C002',to_date('2017/06/14','yyyy/MM/dd'));
insert into Copy values('B206','C001',to_date('2017/06/04','yyyy/MM/dd'));
insert into Copy values('B206','C002',to_date('2017/08/01','yyyy/MM/dd'));
insert into Copy values('B207','C001',to_date('2017/10/01','yyyy/MM/dd'));
insert into Copy values('B207','C002',to_date('2017/04/10','yyyy/MM/dd'));
insert into Copy values('B208','C001',to_date('2017/01/21','yyyy/MM/dd'));
insert into Copy values('B208','C002',to_date('2011/01/22','yyyy/MM/dd'));
insert into Copy values('B209','C001',to_date('2010/08/13','yyyy/MM/dd'));
insert into Copy values('B209','C002',to_date('2004/09/16','yyyy/MM/dd'));



insert into Copy values('B500','C001',to_date('2017/09/16','yyyy/MM/dd'));
insert into Copy values('B501','C001',to_date('2017/09/16','yyyy/MM/dd'));
insert into Copy values('B502','C001',to_date('2017/09/16','yyyy/MM/dd'));
insert into Copy values('B503','C001',to_date('2017/09/16','yyyy/MM/dd'));
insert into Copy values('B504','C001',to_date('2017/09/16','yyyy/MM/dd'));
insert into Copy values('B505','C001',to_date('2017/09/16','yyyy/MM/dd'));
insert into Copy values('B506','C001',to_date('2017/09/16','yyyy/MM/dd'));
insert into Copy values('B507','C001',to_date('2017/09/16','yyyy/MM/dd'));
insert into Copy values('B508','C001',to_date('2017/09/16','yyyy/MM/dd'));




------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE UserGrade (
   grade         varchar2(30) NOT NULL, -- 등급
   checkout_num  INTEGER      NOT NULL, -- 대출권수
   checkout_days INTEGER      NOT NULL, -- 대출일수
   extend_days   INTEGER      NOT NULL,  -- 연장기간
   primary key(grade)
);

--등급: 재학생, 휴학생, 졸업생, 대학원생, 교수, 교직원 ,관리자


insert into USERGRADE values('재학생',5,14,14);
insert into USERGRADE values('휴학생',3,10,7);
insert into USERGRADE values('졸업생',3,7,7);
insert into USERGRADE values('대학원생',10,30,15);
insert into USERGRADE values('교수',20,90,45);
insert into USERGRADE values('교직원',18,60,30);
insert into USERGRADE values('관리자',0,0,0);


------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE BelongTo (
   univ_num varchar2(10) NOT NULL, -- 학번
   univ_ID  varchar2(10) NOT NULL, -- 학교ID
   grade    varchar2(30) NOT NULL,  -- 등급
   FOREIGN KEY (grade) REFERENCES UserGrade (grade)
   ON DELETE cascade,
   FOREIGN KEY (univ_ID) REFERENCES University (univ_ID)
   ON DELETE cascade,
   PRIMARY KEY (univ_num,univ_ID)
);


insert into BELONGTO values('B211169','u100','재학생');
insert into BELONGTO values('B211247','u100','휴학생');
insert into BELONGTO values('B111181','u100','졸업생');
insert into BELONGTO values('P11003','u100','교수');
insert into BELONGTO values('A711501','u100','대학원생');
insert into BELONGTO values('E211169','u100','교직원');
insert into BELONGTO values('B017033','u100','재학생');

insert into BELONGTO values('20131897','u101','재학생');
insert into BELONGTO values('20111901','u101','휴학생');
insert into BELONGTO values('20051788','u101','졸업생');
insert into BELONGTO values('B20131157','u101','대학원생');
insert into BELONGTO values('110901','u101','교직원');
insert into BELONGTO values('20101897','u101','휴학생');
insert into BELONGTO values('A03897','u101','교수');

insert into BELONGTO values('32111475','u102','재학생');
insert into BELONGTO values('32111464','u102','재학생');
insert into BELONGTO values('k2111444','u102','교수');
insert into BELONGTO values('k2101480','u102','교수');
insert into BELONGTO values('g7213012','u102','대학원생');
insert into BELONGTO values('32110416','u102','휴학생');
insert into BELONGTO values('i22101346','u102','교직원');

insert into BELONGTO values('201211006','u103','재학생');
insert into BELONGTO values('201107034','u103','재학생');
insert into BELONGTO values('200831188','u103','졸업생');
insert into BELONGTO values('31069','u103','교수');
insert into BELONGTO values('201423001','u103','재학생');
insert into BELONGTO values('200731101','u103','대학원생');
insert into BELONGTO values('201716100','u103','재학생');

---------
insert into BELONGTO values('admin','admin','관리자');
insert into BELONGTO values('201716101','u103','재학생');
insert into BELONGTO values('201716102','u103','재학생');
insert into BELONGTO values('201716103','u103','재학생');

insert into BELONGTO values('38111464','u102','재학생');
insert into BELONGTO values('39111464','u102','재학생');
insert into BELONGTO values('37111464','u102','재학생');

insert into BELONGTO values('A04897','u101','교수');
insert into BELONGTO values('A05897','u101','교수');
insert into BELONGTO values('A06897','u101','교수');



insert into BELONGTO values('E3303','u105','재학생');
insert into BELONGTO values('E4444','u105','재학생');



------------------------------------------------------------------------------------------------------------------------------------------------------------------
--user
CREATE TABLE Users (
   user_ID   varchar2(30)  NOT NULL, -- UserID
   user_pass varchar2(30)  NOT NULL, -- 비밀번호
   user_name varchar2(30)  NOT NULL, -- 이름
   user_addr varchar2(100) NULL,     -- 주소
   user_tel  varchar2(30)  NOT NULL, -- 연락처
   grade     varchar2(30)  NOT NULL, -- 등급
   univ_ID   varchar2(10)  NOT NULL, -- 학교ID
   univ_num  varchar2(10)  NULL,      -- 학번
   primary key(user_ID),
   FOREIGN KEY (grade)
   REFERENCES UserGrade (grade)
   ON DELETE cascade,
   FOREIGN KEY (univ_num,univ_ID)
   REFERENCES BelongTo (univ_num,   univ_ID)
   ON DELETE cascade   
);

insert into Users values('onec911','onec911','이원창','서울시 종로구','010-2070-0911', '재학생','u100','B211169');
insert into Users values('eunsol704','eunsol704','조은솔','인천시 서구','010-3215-4545', '재학생','u101','20131897');
insert into Users values('qaz55','qaz55','한병림','서울시 중랑구','010-3131-7878', '재학생','u102','32111475');
insert into Users values('dozen5','dozen5','최정오','평택시 동구','010-8880-9797', '교수','u101','A03897');




----
insert into Users values('admin','admin','관리자','서버속에서','000-0000-0000', '관리자','admin','admin');
insert into Users values('abc123','abc123','에비씨','에리시 미로구','010-3333-0911', '재학생','u103','201716101');
insert into Users values('eun704','eun704','조나라','인천시 서구','010-4444-4545', '재학생','u103','201716102');
insert into Users values('qazq55','qazq55','한나라','서울시 중랑구','010-4444-7878', '재학생','u102','37111464');
insert into Users values('dozenq5','dozenq5','최나라','평택시 동구','010-8887-9797', '교수','u101','A06897');
insert into Users values('ioew4','ioew4','최신구','서울시 강북구','010-1111-1234', '교수','u101','A04897');
insert into Users values('dfsd6','dfsd6','최신자','서울시 강서구','010-1111-1235', '교수','u101','A05897');
insert into Users values('fdss5','fdss5','신세계','평택시 세교동','010-3333-9597', '재학생','u102','39111464');
insert into Users values('wqe5','wqe5','신방구','평택시 합정동','010-8887-5665', '재학생','u103','201716102');
insert into Users values('1212s5','1212s5','조병구','수원시 영통구','010-8766-9597', '재학생','u105','E3303');
insert into Users values('grrr77','grrr77','진리나','수원시 진상구','010-6664-5665', '재학생','u105','E4444');




------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Reserve (
   reserve_num INTEGER      primary key, -- 예약번호
   wait_num    INTEGER      NOT NULL, -- 대기번호
   user_ID     varchar2(10) NOT NULL, -- UserID
   book_ID     varchar2(10) NOT NULL, -- 도서ID
   copy_ID     varchar2(10) NOT NULL,  -- 사본ID
   FOREIGN KEY (book_ID, copy_ID) REFERENCES Copy (book_ID, copy_ID)
   ON DELETE cascade,
   FOREIGN KEY (user_ID) REFERENCES Users (user_ID)
   ON DELETE cascade
);


CREATE SEQUENCE  seq_reserve
START WITH  100
INCREMENT BY 1

insert into RESERVE values(seq_reserve.nextval,0,'onec911','B101','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B102','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B103','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B104','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B105','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B106','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B107','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B107','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B108','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B108','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B110','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B111','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B112','C001');
insert into RESERVE values(seq_reserve.nextval,0,'dozen5','B113','C001');
insert into RESERVE values(seq_reserve.nextval,0,'onec911','B113','C001');



------------------------------------------------------------------------------------------------------------
-- 대출
CREATE TABLE CheckOut (
   checkout_num  INTEGER      primary key,
   checkout_date DATE         NOT NULL, -- 대출일
   return_date   DATE         NULL, -- 반납일
   due_date      DATE         NOT NULL, -- 반납예정일
   extend_num    INTEGER      NULL,     -- 연장횟수
   user_ID       varchar2(10) NOT NULL, -- UserID
   book_ID       varchar2(10) NOT NULL, -- 도서ID
   copy_ID       varchar2(10) NOT NULL,  -- 사본ID
   FOREIGN KEY (book_ID, copy_ID) REFERENCES Copy (book_ID, copy_ID)
   ON DELETE cascade,
   FOREIGN KEY (user_ID) REFERENCES Users (user_ID)
   ON DELETE cascade
);

CREATE SEQUENCE  seq_checkout
START WITH  100
INCREMENT BY 1

insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/04/13','yyyy/MM/dd'),
                     to_date('2017/04/17','yyyy/MM/dd'),
                     to_date('2017/04/27','yyyy/MM/dd'),
                     0,
                     'onec911','B102','C001');
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/05/13','yyyy/MM/dd'),
                     to_date('2017/05/17','yyyy/MM/dd'),
                     to_date('2017/05/27','yyyy/MM/dd'),
                     0,
                     'onec911','B112','C001');
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/05/13','yyyy/MM/dd'),
                     to_date('2017/05/17','yyyy/MM/dd'),
                     to_date('2017/05/27','yyyy/MM/dd'),
                     0,
                     'onec911','B115','C002');          
                     
                     
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2014/05/13','yyyy/MM/dd'),
                     to_date('2014/05/17','yyyy/MM/dd'),
                     to_date('2014/05/27','yyyy/MM/dd'),
                     0,
                     'onec911','B116','C001');     
                     

                     
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/13','yyyy/MM/dd'),
                   	 null ,
                     to_date('2017/07/27','yyyy/MM/dd'),
                     0,
                     'onec911','B115','C001');                        
                     
                     
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2014/05/13','yyyy/MM/dd'),
                     to_date('2014/05/17','yyyy/MM/dd'),
                     to_date('2014/05/27','yyyy/MM/dd'),
                     0,
                     'onec911','B115','C002');     
                     
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2014/05/13','yyyy/MM/dd'),
                     to_date('2014/05/17','yyyy/MM/dd'),
                     to_date('2014/05/27','yyyy/MM/dd'),
                     0,
                     'qaz55','B115','C002');                
                     
                     
----------------                   
                     
                     
 
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/10','yyyy/MM/dd'),
                     null,
                     to_date('2017/07/24','yyyy/MM/dd'),
                     0,
                     'dozenq5','B500','C001'); 
       
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/10','yyyy/MM/dd'),
                     null,
                     to_date('2017/07/24','yyyy/MM/dd'),
                     0,
                     'dozenq5','B501','C001'); 
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/10','yyyy/MM/dd'),
                     null,
                     to_date('2017/07/24','yyyy/MM/dd'),
                     0,
                     'dozenq5','B502','C001'); 
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/10','yyyy/MM/dd'),
                     null,
                     to_date('2017/07/24','yyyy/MM/dd'),
                     0,
                     'dozenq5','B503','C001');     
                     
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/10','yyyy/MM/dd'),
                     null,
                     to_date('2017/07/24','yyyy/MM/dd'),
                     0,
                     'dozenq5','B504','C001');      
                     
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/10','yyyy/MM/dd'),
                     null,
                     to_date('2017/07/24','yyyy/MM/dd'),
                     0,
                     'dozenq5','B505','C001');                      
                     
                
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/13','yyyy/MM/dd'),
                     null,
                     to_date('2017/07/27','yyyy/MM/dd'),
                     0,
                     'onec911','B115','C002');  
                     
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/13','yyyy/MM/dd'),
                     null,
                     to_date('2017/07/27','yyyy/MM/dd'),
                     0,
                     'onec911','B116','C002');                       
                     
insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/13','yyyy/MM/dd'),
                     null,
                     to_date('2017/07/27','yyyy/MM/dd'),
                     0,
                     'onec911','B300','C002');                       
 insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/07/13','yyyy/MM/dd'),
                     null,
                     to_date('2017/07/27','yyyy/MM/dd'),
                     0,
                     'onec911','B305','C002');
                     
                     
                     ====
                     
                     insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/06/13','yyyy/MM/dd'),
                     to_date('2017/06/16','yyyy/MM/dd'),
                     to_date('2017/06/27','yyyy/MM/dd'),
                     0,
                     'onec911','B301','C002');  
                     
                     insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/06/13','yyyy/MM/dd'),
                     to_date('2017/06/16','yyyy/MM/dd'),
                     to_date('2017/06/27','yyyy/MM/dd'),
                     0,
                     'onec911','B302','C002');  
                     
                     insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/06/13','yyyy/MM/dd'),
                     to_date('2017/06/16','yyyy/MM/dd'),
                     to_date('2017/06/27','yyyy/MM/dd'),
                     0,
                     'onec911','B303','C002');  
                     
                     insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/06/13','yyyy/MM/dd'),
                     to_date('2017/06/16','yyyy/MM/dd'),
                     to_date('2017/06/27','yyyy/MM/dd'),
                     0,
                     'onec911','B304','C002');  
                     
                     insert into CheckOut values(seq_checkout.nextval,
                     to_date('2017/06/13','yyyy/MM/dd'),
                     to_date('2017/06/16','yyyy/MM/dd'),
                     to_date('2017/06/27','yyyy/MM/dd'),
                     0,
                     'onec911','B305','C002');  
------------------------------------------------------------------------------------------------------------------------------------------------------------------

