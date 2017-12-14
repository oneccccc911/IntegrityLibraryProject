drop table University;
drop table Library;
drop table Book;



CREATE TABLE University (
   univ_ID   varchar2(20) NOT NULL,
   univ_name varchar2(30) NOT NULL,
   primary key(univ_ID)
);

insert into University values('u100','ȫ�ʹ��б�');
insert into University values('u101','���Ǵ��б�');
insert into University values('u102','�ܱ����б�');
insert into University values('u103','������б�');

-- ������
CREATE TABLE Library (
   lib_ID    varchar2(10)  NOT NULL, -- ������ID
   lib_name  varchar2(30)  NOT NULL, -- �̸�
   lib_addr  varchar2(100) NULL,     -- �ּ�
   lib_tel   varchar2(20)  NULL,     -- ��ȭ��ȣ
   lib_open  date          NULL,     -- �����ð�
   lib_close date          NULL,     -- ����ð�
   univ_ID   varchar2(20)  NOT NULL,  -- �б�ID
   primary key(lib_ID),
   foreign key(univ_ID) REFERENCES University (univ_ID)
   ON DELETE cascade
);

insert into LIBRARY values('L100','����������','������ �����','02-322-7878',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u100');
insert into LIBRARY values('L101','�߾ӵ�����','������ �����','02-322-7979',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u100');
insert into LIBRARY values('L102','�߾ӵ�����','���۱� �󵵵�','02-646-4878',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u101');
insert into LIBRARY values('L103','�̵�����','���۱� �󵵵�','02-644-3878',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u101');
insert into LIBRARY values('L104','����������','������ ������','031-7667-4448',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u102');
insert into LIBRARY values('L105','�������','������ ������','031-7644-7821',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u102');
insert into LIBRARY values('L106','�ƹ�������','���Ǳ� �Ÿ���','02-3622-4478',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u103');
insert into LIBRARY values('L107','�ų�������','���Ǳ� �Ÿ���','02-3622-7978',to_date('09:00:00','hh24:mi:ss'),to_date('18:00:00','hh24:mi:ss'),'u103');


CREATE TABLE Book (
   book_ID     varchar2(10) NOT NULL, -- ����ID
   book_name   varchar2(100) NOT NULL, -- ����
   book_author varchar2(30) NOT NULL, -- ����
   book_cate   varchar2(30) NOT NULL, -- �з�
   book_year   DATE,     -- �߰��⵵
   book_page   INTEGER,     -- ������ ��
   book_pub    varchar2(30) NOT NULL, -- ���ǻ�
   lib_ID      varchar2(10) NOT NULL,  -- ������ID
   primary key(book_ID),
   FOREIGN KEY (lib_ID) REFERENCES Library (lib_ID)
   ON DELETE cascade
);

insert into book values ('B101','�����ͺ��̽� �ý���','����','������',to_date('2010','yyyy'),453,'�Ѻ��̵��','L100');
insert into book values ('B102','��ſ� �ð�','�̿�â','�Ҽ�',to_date('1988','yyyy'),456,'û������','L100');
insert into book values ('B103','�����ͺ��̽� �ý����� ���� ����','������','������',to_date('2005','yyyy'),765,'�缺����','L100');
insert into book values ('B104','�����ͺ��̽� �ý����� ���� �������','������','������',to_date('2017','yyyy'),785,'�̷�â��','L100');
insert into book values ('B105','����','�Ѻ���','������',to_date('1999','yyyy'),853,'������','L101');
insert into book values ('B106','���̾� ��ȭ���� ����','ȫ����','������',to_date('2013','yyyy'),153,'â�ۻ�','L101');
insert into book values ('B107','���ǽ�','�̿���','��ȭ',to_date('2004','yyyy'),953,'�����','L101');
insert into book values ('B108','��Ʈ��ũ ���α׷���','������','������',to_date('2002','yyyy'),753,'�Ѻ��̵��','L101');
insert into book values ('B109','�ظ����Ϳ� �������� ��','������','�Ҽ�',to_date('2004','yyyy'),553,'���е���','L102');
insert into book values ('B110','��Ű���','�̰��','�Ҽ�',to_date('2016','yyyy'),483,'���а�','L102');
insert into book values ('B111','�ü��','�ڳ���','������',to_date('2015','yyyy'),753,'������','L102');
insert into book values ('B112','���� c���','������','������',to_date('2014','yyyy'),653,'�Ѻ��̵��','L102');
insert into book values ('B113','c��� ����','������','������',to_date('2013','yyyy'),553,'�Ѻ��̵��','L103');
insert into book values ('B114','��������','����ȣ','���缭',to_date('2008','yyyy'),353,'����å��','L103');
insert into book values ('B115','���丶Ÿ','�̼���','������',to_date('2011','yyyy'),853,'�Ѻ��̵��','L103');
insert into book values ('B116','������ 2�� �ϼ�','������','������',to_date('2011','yyyy'),453,'���빮��','L103');
insert into book values ('B300','�ڽ���','�̼���','������',to_date('2011','yyyy'),353,'�Ѻ��̵��','L106');
insert into book values ('B301','���� to Python','�̼���','������',to_date('2011','yyyy'),753,'�Ѻ��̵��','L106');
insert into book values ('B302','Justice','�̼���','������',to_date('2011','yyyy'),333,'�Ѻ��̵��','L106');
insert into book values ('B303','������� ���λ��','�����ó� ���̳�','�Ҽ�',to_date('2011','yyyy'),983,'�Ѻ��̵��','L106');
insert into book values ('B304','�鼳���� ���λ��','�̼���','�Ҽ�',to_date('2011','yyyy'),153,'�Ѻ��̵��','L107');
insert into book values ('B305','�� �� �ڵ��� ����','�̼���','�Ҽ�',to_date('2011','yyyy'),233,'�Ѻ��̵��','L107');
insert into book values ('B306','������ �ο�','�̼���','�Ҽ�',to_date('2011','yyyy'),783,'�Ѻ��̵��','L107');
insert into book values ('B307','���','�̼���','�Ҽ�',to_date('2011','yyyy'),443,'�Ѻ��̵��','L107');
insert into book values ('B202','���ø�� �̾߱�','���Ѻ�','����',to_date('2017','yyyy'),353,'�Ѻ��̵��','L104');
insert into book values ('B203','�ð谡 ������','�̿�','�ι�',to_date('1999','yyyy'),100,'â�ۻ�','L104');
insert into book values ('B204','�ٽ��¾�ٸ�','������','�ι�',to_date('1994','yyyy'),344,'�����','L104');
insert into book values ('B205','�ξ����','������','�ι�',to_date('1995','yyyy'),213,'�����','L104');
insert into book values ('B206','�鼳����','����','�ι�',to_date('2015','yyyy'),433,'�Ѻ��̵��','L105');
insert into book values ('B207','�̳�� �߼�','�ٴϿ�','�ι�',to_date('2001','yyyy'),53,'����å��','L105');
insert into book values ('B208','���麸�� �����ϰ�','��Ƽ�쿬','�ڱ���',to_date('1998','yyyy'),153,'���е���','L105');
insert into book values ('B209','����ũ �̰͸� �Ѵٸ�','������','�ڱ���',to_date('2002','yyyy'),1433,'������','L105');


-- �纻
CREATE TABLE Copy (
   book_ID  varchar2(10) NOT NULL, -- ����ID
   copy_ID  varchar2(10) NOT NULL, -- �纻ID
   buy_date DATE         NOT NULL,  -- ���Գ�¥
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




--���
CREATE TABLE UserGrade (
   grade         varchar2(30) NOT NULL, -- ���
   checkout_num  INTEGER      NOT NULL, -- ����Ǽ�
   checkout_days INTEGER      NOT NULL, -- �����ϼ�
   extend_days   INTEGER      NOT NULL,  -- ����Ⱓ
   primary key(grade)
);

--���: ���л�, ���л�, ������, ���п���, ����, ������

alter table UserGrade modify grade varchar2(30);

insert into USERGRADE values('���л�',5,14,14);
insert into USERGRADE values('���л�',3,10,7);
insert into USERGRADE values('������',3,7,7);
insert into USERGRADE values('���п���',10,30,15);
insert into USERGRADE values('����',20,90,45);
insert into USERGRADE values('������',18,60,30);


-- �Ҽ�
CREATE TABLE BelongTo (
   univ_num varchar2(10) NOT NULL, -- �й�
   univ_ID  varchar2(10) NOT NULL, -- �б�ID
   grade    varchar2(30) NOT NULL,  -- ���
   FOREIGN KEY (grade) REFERENCES UserGrade (grade)
   ON DELETE cascade,
   FOREIGN KEY (univ_ID) REFERENCES University (univ_ID)
   ON DELETE cascade,
   PRIMARY KEY (univ_num,univ_ID)
);

alter table BelongTo modify grade varchar2(30);

insert into BELONGTO values('B211169','u100','���л�');
insert into BELONGTO values('B211247','u100','���л�');
insert into BELONGTO values('B111181','u100','������');
insert into BELONGTO values('P11003','u100','����');
insert into BELONGTO values('A711501','u100','���п���');
insert into BELONGTO values('E211169','u100','������');
insert into BELONGTO values('B017033','u100','���л�');

insert into BELONGTO values('20131897','u101','���л�');
insert into BELONGTO values('20111901','u101','���л�');
insert into BELONGTO values('20051788','u101','������');
insert into BELONGTO values('B20131157','u101','���п���');
insert into BELONGTO values('110901','u101','������');
insert into BELONGTO values('20101897','u101','���л�');
insert into BELONGTO values('A03897','u101','����');

insert into BELONGTO values('32111475','u102','���л�');
insert into BELONGTO values('32111464','u102','���л�');
insert into BELONGTO values('k2111444','u102','����');
insert into BELONGTO values('k2101480','u102','����');
insert into BELONGTO values('g7213012','u102','���п���');
insert into BELONGTO values('32110416','u102','���л�');
insert into BELONGTO values('i22101346','u102','������');

insert into BELONGTO values('201211006','u103','���л�');
insert into BELONGTO values('201107034','u103','���л�');
insert into BELONGTO values('200831188','u103','������');
insert into BELONGTO values('31069','u103','����');
insert into BELONGTO values('201423001','u103','���л�');
insert into BELONGTO values('200731101','u103','���п���');
insert into BELONGTO values('201716100','u103','���л�');

--user
CREATE TABLE Users (
   user_ID   varchar2(30)  NOT NULL, -- UserID
   user_pass varchar2(30)  NOT NULL, -- ��й�ȣ
   user_name varchar2(30)  NOT NULL, -- �̸�
   user_addr varchar2(100) NULL,     -- �ּ�
   user_tel  varchar2(30)  NOT NULL, -- ����ó
   grade     varchar2(30)  NOT NULL, -- ���
   univ_ID   varchar2(10)  NOT NULL, -- �б�ID
   univ_num  varchar2(10)  NULL,      -- �й�
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

insert into Users values('onec911','onec911','�̿�â','����� ���α�','010-2070-0911', '���л�','u100','B211169');
insert into Users values('eunsol704','eunsol704','������','��õ�� ����','010-3215-4545', '���л�','u101','20131897');
insert into Users values('qaz55','qaz55','�Ѻ���','����� �߶���','010-3131-7878', '���л�','u102','32111475');
insert into Users values('dozen5','dozen5','������','���ý� ����','010-8880-9797', '����','u101','A03897');


-- ����
CREATE TABLE Reserve (
   reserve_num INTEGER      primary key, -- �����ȣ
   wait_num    INTEGER      NOT NULL, -- ����ȣ
   user_ID     varchar2(10) NOT NULL, -- UserID
   book_ID     varchar2(10) NOT NULL, -- ����ID
   copy_ID     varchar2(10) NOT NULL,  -- �纻ID
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
-- ����
CREATE TABLE CheckOut (
   checkout_num  INTEGER      primary key,
   checkout_date DATE         NOT NULL, -- ������
   return_date   DATE         NULL, -- �ݳ���
   due_date      DATE         NOT NULL, -- �ݳ�������
   extend_num    INTEGER      NULL,     -- ����Ƚ��
   user_ID       varchar2(10) NOT NULL, -- UserID
   book_ID       varchar2(10) NOT NULL, -- ����ID
   copy_ID       varchar2(10) NOT NULL,  -- �纻ID
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

insert into BELONGTO values('201211006','u103','���л�');
select *from Users
select univ_num, univ_name, grade 
from BelongTo b join University u
on b.univ_ID = u.univ_ID
where b.univ_num = '201211006'
and u.univ_name = '������б�'

select *from BELONGTO;


select reserve_num, wait_num, book_name, r.book_ID, copy_ID
from Reserve r join Book b
on r.book_ID = b.book_ID
where user_ID = 'onec911'

select *from USERS
select *from RESERVE

delete from users where user_ID = 'sssdf';
insert into Users values('aaaa','aaaa','�̿���','����� �߱�','010-4448-7878','���л�',
						(select univ_ID 
						from University
						where univ_name = '������б�'),'201211006');
						
						
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

insert into University values('u100','ȫ�ʹ��б�');
insert into University values('u101','���Ǵ��б�');
insert into University values('u102','�ܱ����б�');
insert into University values('u103','������б�');
insert into University values('u104','�������б�');
insert into University values('u105','�����б�');
insert into University values('u106','�����б�');
insert into University values('u107','�������б�');
insert into University values('u108','�뱸���б�');
insert into University values('u109','�λ���б�');
insert into University values('u110','��ϴ��б�');
insert into University values('u111','�泲���б�');
insert into University values('u112','��ϴ��б�');
insert into University values('u113','�泲���б�');
insert into University values('u114','�����б�');
insert into University values('admin','admin');


------------------------------------------------------------------------------------------------------

CREATE TABLE Library (
   lib_ID    varchar2(10)  NOT NULL, -- ������ID
   lib_name  varchar2(30)  NOT NULL, -- �̸�
   lib_addr  varchar2(100) NULL,     -- �ּ�
   lib_tel   varchar2(20)  NULL,   	 -- ��ȭ��ȣ
   univ_ID   varchar2(20)  NOT NULL,  -- �б�ID
   lib_open  varchar2(20)          NULL,     -- �����ð�
   lib_close varchar2(20)         NULL,     -- ����ð�
   primary key(lib_ID),
   foreign key(univ_ID) REFERENCES University (univ_ID)
   ON DELETE cascade
);




insert into LIBRARY values('L100','����������','������ �����','02-322-7878','u100','���� 9��','���� 6��');
insert into LIBRARY values('L101','�߾ӵ�����','������ �����','02-322-7979','u100','���� 9��','���� 6��');
insert into LIBRARY values('L102','�߾ӵ�����','���۱� �󵵵�','02-646-4878','u101','���� 11��','���� 8��');
insert into LIBRARY values('L103','�̵�����','���۱� �󵵵�','02-644-3878','u101','���� 9��','���� 6��');
insert into LIBRARY values('L104','����������','������ ������','031-7667-4448','u102','���� 9��','���� 6��');
insert into LIBRARY values('L105','�������','������ ������','031-7644-7821','u102','���� 9��','���� 6��');
insert into LIBRARY values('L106','�ƹ�������','���Ǳ� �Ÿ���','02-3622-4478','u102','���� 9��','���� 6��');
insert into LIBRARY values('L107','����������','���Ǳ� �Ÿ���','02-3622-7978','u103','���� 10��','���� 7��');
insert into LIBRARY values('L108','�ùٵ�����','���Ǳ� ���','02-3622-7978','u103','���� 9��','���� 6��');
insert into LIBRARY values('L109','���ֵ�����','����� ���̵�','02-3622-7978','u104','���� 9��','���� 6��');
insert into LIBRARY values('L110','�̵ֹ�����','�Ϻ��� ������','02-3622-7978','u105','���� 8��','���� 5��');
insert into LIBRARY values('L111','���嵵����','��� ������','02-3622-7978','u106','���� 8��','���� 6��');
insert into LIBRARY values('L112','ȭ�۵�����','������ �̵̹�','02-3622-7978','u107','���� 8��','���� 5��');
insert into LIBRARY values('L113','����������','������ ���µ�','02-3622-7978','u108','���� 10��','���� 6��');
insert into LIBRARY values('L114','�糪������','��� ���ϵ�','02-3622-7978','u109','���� 8��','���� 6��');
insert into LIBRARY values('L115','��絵����','������ �̵̹�','02-3622-7978','u110','���� 8��','���� 6��');
insert into LIBRARY values('L116','����������','������ ���µ�','02-3622-7978','u111','���� 9��','���� 8��');
insert into LIBRARY values('L117','��Ÿ������','��� ���ϵ�','02-3622-7978','u112','���� 9��','���� 9��');
insert into LIBRARY values('L118','�ξ�������','������ �̵̹�','02-3622-7978','u113','���� 9��','���� 8��');
insert into LIBRARY values('L119','��䵵����','������ ���µ�','02-3622-7978','u114','���� 9��','���� 7��');
insert into LIBRARY values('L120','���ڵ�����','��� ���ϵ�','02-3622-7978','u111','���� 9��','���� 5��');
insert into LIBRARY values('L121','��絵����','������ �̵̹�','02-3622-7978','u112','���� 9��','���� 4��');
insert into LIBRARY values('L122','��ŵ�����','������ ���µ�','02-3622-7978','u113','���� 9��','���� 6��');
insert into LIBRARY values('L123','�ƹ�������','��� ���ϵ�','02-3622-7978','u114','���� 9��','���� 6��');


------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Book (
   book_ID     varchar2(10) NOT NULL, -- ����ID
   book_name   varchar2(100) NOT NULL, -- ����
   book_author varchar2(30) NOT NULL, -- ����
   book_cate   varchar2(30) NOT NULL, -- �з�
   book_year   DATE,     -- �߰��⵵
   book_page   INTEGER,     -- ������ ��
   book_pub    varchar2(30) NOT NULL, -- ���ǻ�
   lib_ID      varchar2(10) NOT NULL,  -- ������ID
   primary key(book_ID),
   FOREIGN KEY (lib_ID) REFERENCES Library (lib_ID)
   ON DELETE cascade
);
select * from Book

insert into book values ('B101','�����ͺ��̽� �ý���','����','������',to_date('2010','yyyy'),453,'�Ѻ��̵��','L100');
insert into book values ('B102','��ſ� �ð�','�̿�â','�Ҽ�',to_date('1988','yyyy'),456,'û������','L100');
insert into book values ('B103','�����ͺ��̽� �ý����� ���� ����','������','������',to_date('2005','yyyy'),765,'�缺����','L100');
insert into book values ('B104','�����ͺ��̽� �ý����� ���� �������','������','������',to_date('2017','yyyy'),785,'�̷�â��','L100');
insert into book values ('B105','����','�Ѻ���','������',to_date('1999','yyyy'),853,'������','L101');
insert into book values ('B106','���̾� ��ȭ���� ����','ȫ����','������',to_date('2013','yyyy'),153,'â�ۻ�','L101');
insert into book values ('B107','���ǽ�','�̿���','��ȭ',to_date('2004','yyyy'),953,'�����','L101');
insert into book values ('B108','��Ʈ��ũ ���α׷���','������','������',to_date('2002','yyyy'),753,'�Ѻ��̵��','L101');
insert into book values ('B109','�ظ����Ϳ� �������� ��','������','�Ҽ�',to_date('2004','yyyy'),553,'���е���','L102');
insert into book values ('B110','��Ű���','�̰��','�Ҽ�',to_date('2016','yyyy'),483,'���а�','L102');
insert into book values ('B111','�ü��','�ڳ���','������',to_date('2015','yyyy'),753,'������','L102');
insert into book values ('B112','���� c���','������','������',to_date('2014','yyyy'),653,'�Ѻ��̵��','L102');
insert into book values ('B113','c��� ����','������','������',to_date('2013','yyyy'),553,'�Ѻ��̵��','L103');
insert into book values ('B114','��������','����ȣ','���缭',to_date('2008','yyyy'),353,'����å��','L103');
insert into book values ('B115','���丶Ÿ','�̼���','������',to_date('2011','yyyy'),853,'�Ѻ��̵��','L103');
insert into book values ('B116','������ 2�� �ϼ�','������','������',to_date('2011','yyyy'),453,'���빮��','L103');
insert into book values ('B300','�ڽ���','�̼���','������',to_date('2011','yyyy'),353,'�Ѻ��̵��','L106');
insert into book values ('B301','���� to Python','�̼���','������',to_date('2011','yyyy'),753,'�Ѻ��̵��','L106');
insert into book values ('B302','Justice','�̼���','������',to_date('2011','yyyy'),333,'�Ѻ��̵��','L106');
insert into book values ('B303','������� ���λ��','�����ó� ���̳�','�Ҽ�',to_date('2011','yyyy'),983,'�Ѻ��̵��','L106');
insert into book values ('B304','�鼳���� ���λ��','�̼���','�Ҽ�',to_date('2011','yyyy'),153,'�Ѻ��̵��','L107');
insert into book values ('B305','�� �� �ڵ��� ����','�̼���','�Ҽ�',to_date('2011','yyyy'),233,'�Ѻ��̵��','L107');
insert into book values ('B306','������ �ο�','�̼���','�Ҽ�',to_date('2011','yyyy'),783,'�Ѻ��̵��','L107');
insert into book values ('B307','���','�̼���','�Ҽ�',to_date('2011','yyyy'),443,'�Ѻ��̵��','L107');
insert into book values ('B202','���ø�� �̾߱�','���Ѻ�','����',to_date('2017','yyyy'),353,'�Ѻ��̵��','L104');
insert into book values ('B203','�ð谡 ������','�̿�','�ι�',to_date('1999','yyyy'),100,'â�ۻ�','L104');
insert into book values ('B204','�ٽ��¾�ٸ�','������','�ι�',to_date('1994','yyyy'),344,'�����','L104');
insert into book values ('B205','�ξ����','������','�ι�',to_date('1995','yyyy'),213,'�����','L104');
insert into book values ('B206','�鼳����','����','�ι�',to_date('2015','yyyy'),433,'�Ѻ��̵��','L105');
insert into book values ('B207','�̳�� �߼�','�ٴϿ�','�ι�',to_date('2001','yyyy'),53,'����å��','L105');
insert into book values ('B208','���麸�� �����ϰ�','��Ƽ�쿬','�ڱ���',to_date('1998','yyyy'),153,'���е���','L105');
insert into book values ('B209','����ũ �̰͸� �Ѵٸ�','������','�ڱ���',to_date('2002','yyyy'),1433,'������','L105');



insert into book values ('B500','���ٽ��� �Ű�','�̼���','�ι�',to_date('2017','yyyy'),783,'�Ѻ��̵��','L123');
insert into book values ('B501','��ġ�','�̼���','����',to_date('2017','yyyy'),443,'�Ѻ��̵��','L122');
insert into book values ('B502','�����ָ�û��','���Ѻ�','�Ҽ�',to_date('2017','yyyy'),353,'�Ѻ��̵��','L121');
insert into book values ('B503','���ӽð�','�̿�','�ι�',to_date('2017','yyyy'),100,'â�ۻ�','L111');
insert into book values ('B504','��������','������','�Ҽ�',to_date('2017','yyyy'),344,'�����','L115');
insert into book values ('B505','�츮�̴��','������','�ι�',to_date('2017','yyyy'),213,'�����','L118');
insert into book values ('B506','�������','����','������',to_date('2017','yyyy'),433,'�Ѻ��̵��','L119');
insert into book values ('B507','�����������','�ٴϿ�','�ι�',to_date('2001','yyyy'),53,'����å��','L120');
insert into book values ('B508','�츮�� ���','��Ƽ�쿬','�ڱ���',to_date('2017','yyyy'),153,'���е���','L115');
insert into book values ('B509','����� ����','������','�ڱ���',to_date('2017','yyyy'),1433,'������','L118');





------------------------------------------------------------------------------------------------------------
-- �纻
CREATE TABLE Copy (
   book_ID  varchar2(10) NOT NULL, -- ����ID
   copy_ID  varchar2(10) NOT NULL, -- �纻ID
   buy_date DATE         NOT NULL,  -- ���Գ�¥
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
   grade         varchar2(30) NOT NULL, -- ���
   checkout_num  INTEGER      NOT NULL, -- ����Ǽ�
   checkout_days INTEGER      NOT NULL, -- �����ϼ�
   extend_days   INTEGER      NOT NULL,  -- ����Ⱓ
   primary key(grade)
);

--���: ���л�, ���л�, ������, ���п���, ����, ������ ,������


insert into USERGRADE values('���л�',5,14,14);
insert into USERGRADE values('���л�',3,10,7);
insert into USERGRADE values('������',3,7,7);
insert into USERGRADE values('���п���',10,30,15);
insert into USERGRADE values('����',20,90,45);
insert into USERGRADE values('������',18,60,30);
insert into USERGRADE values('������',0,0,0);


------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE BelongTo (
   univ_num varchar2(10) NOT NULL, -- �й�
   univ_ID  varchar2(10) NOT NULL, -- �б�ID
   grade    varchar2(30) NOT NULL,  -- ���
   FOREIGN KEY (grade) REFERENCES UserGrade (grade)
   ON DELETE cascade,
   FOREIGN KEY (univ_ID) REFERENCES University (univ_ID)
   ON DELETE cascade,
   PRIMARY KEY (univ_num,univ_ID)
);


insert into BELONGTO values('B211169','u100','���л�');
insert into BELONGTO values('B211247','u100','���л�');
insert into BELONGTO values('B111181','u100','������');
insert into BELONGTO values('P11003','u100','����');
insert into BELONGTO values('A711501','u100','���п���');
insert into BELONGTO values('E211169','u100','������');
insert into BELONGTO values('B017033','u100','���л�');

insert into BELONGTO values('20131897','u101','���л�');
insert into BELONGTO values('20111901','u101','���л�');
insert into BELONGTO values('20051788','u101','������');
insert into BELONGTO values('B20131157','u101','���п���');
insert into BELONGTO values('110901','u101','������');
insert into BELONGTO values('20101897','u101','���л�');
insert into BELONGTO values('A03897','u101','����');

insert into BELONGTO values('32111475','u102','���л�');
insert into BELONGTO values('32111464','u102','���л�');
insert into BELONGTO values('k2111444','u102','����');
insert into BELONGTO values('k2101480','u102','����');
insert into BELONGTO values('g7213012','u102','���п���');
insert into BELONGTO values('32110416','u102','���л�');
insert into BELONGTO values('i22101346','u102','������');

insert into BELONGTO values('201211006','u103','���л�');
insert into BELONGTO values('201107034','u103','���л�');
insert into BELONGTO values('200831188','u103','������');
insert into BELONGTO values('31069','u103','����');
insert into BELONGTO values('201423001','u103','���л�');
insert into BELONGTO values('200731101','u103','���п���');
insert into BELONGTO values('201716100','u103','���л�');

---------
insert into BELONGTO values('admin','admin','������');
insert into BELONGTO values('201716101','u103','���л�');
insert into BELONGTO values('201716102','u103','���л�');
insert into BELONGTO values('201716103','u103','���л�');

insert into BELONGTO values('38111464','u102','���л�');
insert into BELONGTO values('39111464','u102','���л�');
insert into BELONGTO values('37111464','u102','���л�');

insert into BELONGTO values('A04897','u101','����');
insert into BELONGTO values('A05897','u101','����');
insert into BELONGTO values('A06897','u101','����');



insert into BELONGTO values('E3303','u105','���л�');
insert into BELONGTO values('E4444','u105','���л�');



------------------------------------------------------------------------------------------------------------------------------------------------------------------
--user
CREATE TABLE Users (
   user_ID   varchar2(30)  NOT NULL, -- UserID
   user_pass varchar2(30)  NOT NULL, -- ��й�ȣ
   user_name varchar2(30)  NOT NULL, -- �̸�
   user_addr varchar2(100) NULL,     -- �ּ�
   user_tel  varchar2(30)  NOT NULL, -- ����ó
   grade     varchar2(30)  NOT NULL, -- ���
   univ_ID   varchar2(10)  NOT NULL, -- �б�ID
   univ_num  varchar2(10)  NULL,      -- �й�
   primary key(user_ID),
   FOREIGN KEY (grade)
   REFERENCES UserGrade (grade)
   ON DELETE cascade,
   FOREIGN KEY (univ_num,univ_ID)
   REFERENCES BelongTo (univ_num,   univ_ID)
   ON DELETE cascade   
);

insert into Users values('onec911','onec911','�̿�â','����� ���α�','010-2070-0911', '���л�','u100','B211169');
insert into Users values('eunsol704','eunsol704','������','��õ�� ����','010-3215-4545', '���л�','u101','20131897');
insert into Users values('qaz55','qaz55','�Ѻ���','����� �߶���','010-3131-7878', '���л�','u102','32111475');
insert into Users values('dozen5','dozen5','������','���ý� ����','010-8880-9797', '����','u101','A03897');




----
insert into Users values('admin','admin','������','�����ӿ���','000-0000-0000', '������','admin','admin');
insert into Users values('abc123','abc123','����','������ �̷α�','010-3333-0911', '���л�','u103','201716101');
insert into Users values('eun704','eun704','������','��õ�� ����','010-4444-4545', '���л�','u103','201716102');
insert into Users values('qazq55','qazq55','�ѳ���','����� �߶���','010-4444-7878', '���л�','u102','37111464');
insert into Users values('dozenq5','dozenq5','�ֳ���','���ý� ����','010-8887-9797', '����','u101','A06897');
insert into Users values('ioew4','ioew4','�ֽű�','����� ���ϱ�','010-1111-1234', '����','u101','A04897');
insert into Users values('dfsd6','dfsd6','�ֽ���','����� ������','010-1111-1235', '����','u101','A05897');
insert into Users values('fdss5','fdss5','�ż���','���ý� ������','010-3333-9597', '���л�','u102','39111464');
insert into Users values('wqe5','wqe5','�Ź汸','���ý� ������','010-8887-5665', '���л�','u103','201716102');
insert into Users values('1212s5','1212s5','������','������ ���뱸','010-8766-9597', '���л�','u105','E3303');
insert into Users values('grrr77','grrr77','������','������ ����','010-6664-5665', '���л�','u105','E4444');




------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Reserve (
   reserve_num INTEGER      primary key, -- �����ȣ
   wait_num    INTEGER      NOT NULL, -- ����ȣ
   user_ID     varchar2(10) NOT NULL, -- UserID
   book_ID     varchar2(10) NOT NULL, -- ����ID
   copy_ID     varchar2(10) NOT NULL,  -- �纻ID
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
-- ����
CREATE TABLE CheckOut (
   checkout_num  INTEGER      primary key,
   checkout_date DATE         NOT NULL, -- ������
   return_date   DATE         NULL, -- �ݳ���
   due_date      DATE         NOT NULL, -- �ݳ�������
   extend_num    INTEGER      NULL,     -- ����Ƚ��
   user_ID       varchar2(10) NOT NULL, -- UserID
   book_ID       varchar2(10) NOT NULL, -- ����ID
   copy_ID       varchar2(10) NOT NULL,  -- �纻ID
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

