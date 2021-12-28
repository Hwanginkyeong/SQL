--webdb 계정에 book 테이블 만들기 

create table book(
    book_id number(5), 
    title varchar2(50),
    author varchar2(10),
    pub_date date
);


--book 테이블에 pubs 컬럼 추가하기
alter table book add(pubs varchar2(50));

--book 테이블에 컬럼 속성 변경하기
alter table book modify(title varchar2(100));
alter table book rename column title to subject;

--컬럼 삭제
alter table book drop(author);

--테이블 명 변경하기 
rename book to article;

--테이블 삭제
drop table article;

--작가 테이블 만들기
create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);
 
    
create table book(
  book_id   number(10),
  title     varchar2(100) not null,
  pubs      varchar2(100),
  pub_date  date,
  author_id number(10),
  primary key(book_id),
  constraint book_fk foreign key(author_id)
  references author(author_id) --이름이 같은 거 일뿐 

);

--작가(author) 테이블에 데이터 추가(insert)
insert into author 
values(1, '박경리', '토지작가');

insert into author(author_id, author_name)
values(2, '이문열');

insert into author
values(3, '기안84', '웹툰작가');

--작가 테이블 정보 수정 
update author 
set author_name = '김경리',
    author_desc = '토지작가'
where author_id = 1 ;

--작가 테이블 정보 삭제 
delete from author 
where author_id = 1;

--시퀀스 삭제
drop sequence seq_author_id;

drop table book;
drop table author;

--시퀀스 번호표 
create sequence seq_author_id
increment by 1
start with 1
nocache;

insert into author
values(seq_author_id.nextval, '박경리', '토지 작가');

insert into author
values(seq_author_id.nextval, '이문열', '삼국지 작가');

--시퀀스 조회
select * from user_sequences;

--현재 시퀀스 조회 
select seq_author_id.currval
from dual;

--다음 시퀀스 조회 
/*
select seq_Author_id.nextval
from dual;
*/


select * from book;
select * from author;

--webdb 계정에 book 테이블 만들기 
create table book(
    book_id number(5), 
    title varchar2(50),
    author varchar2(10),
    pub_date date
);


--book 테이블에 pubs 컬럼 추가하기
alter table book add(pubs varchar2(50));

--book 테이블에 컬럼 속성 변경하기
alter table book modify(title varchar2(100));
alter table book rename column title to subject;

--컬럼 삭제
alter table book drop(author);

--테이블 명 변경하기 
rename book to article;

--테이블 삭제
drop table author;
drop table book;
drop table article;

--작가 시퀀스 삭제
DROP SEQUENCE seq_author_id;


--작가 테이블 만들기
create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);
 
    
create table book(
  book_id   number(10),
  title     varchar2(100) not null,
  pubs      varchar2(100),
  pub_date  date,
  author_id number(10),
  primary key(book_id),
  constraint book_fk foreign key(author_id)
  references author(author_id) --이름이 같은 거 일뿐 

);

--작가(author) 테이블에 데이터 추가(insert)
insert into author 
values(seq_author_id.nextval, '김문열', '경북 영양');

insert into author 
values(seq_author_id.nextval, '박경리', '경상남도 통영');

insert into author 
values(seq_author_id.nextval, '유시민', '17대 국회의원');

insert into author 
values(seq_author_id.nextval, '기안84', '기안동에서 산 84년생');

insert into author 
values(seq_author_id.nextval, '강풀', '온라인 만화가 1세대');

insert into author 
values(seq_author_id.nextval, '김영하', '알쓸신잡');

--

insert into author(author_id, author_name)
values(2, '이문열');

insert into author
values(3, '기안84', '웹툰작가');



--책(Book) 테이블에 데이터 추가(insert)
insert into book
values(seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', '1');

insert into book
values(seq_book_id.nextval, '삼국지', '민음사', '2002-03-01', '1');

insert into book
values(seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', '2');

insert into book
values(seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의 길', '2015-04-01', '3');

insert into book
values(seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22', '4');

insert into book
values(seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', '5');

insert into book
values(seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04', '6');

insert into book
values(seq_book_id.nextval, '26년', '재미주의 ', '2012-02-04', '5');



--작가 테이블 정보 수정 
update author 
set author_name = '김경리',
    author_desc = '토지작가'
where author_id = 1 ;

--작가 테이블 정보 삭제 
delete from author 
where author_id = 5;

--시퀀스 삭제
drop sequence seq_author_id;
drop sequence seq_book_id;

drop table book;
drop table author;


--작가 시퀀스 만들기 
create sequence seq_author_id
increment by 1
start with 1
nocache;

-- 책 시퀀스 만들기 
create sequence seq_book_id
increment by 1
start with 1
nocache;

insert into author
values(seq_author_id.nextval, '박경리', '경상남도 통영');

insert into author
values(seq_author_id.nextval, '이문열', '경북 영양');

--시퀀스 조회
select * from user_sequences;

--현재 시퀀스 조회 
select seq_author_id.currval
from dual;

--다음 시퀀스 조회 
/*
select seq_Author_id.nextval
from dual;
*/


select  author_id,
        author_name,
        author_desc
from author;



select * from book;

select * from author;


update author
set author_name = '김문열',
    author_desc = '삼국지 작가'
where author_id = 1;

commit;
rollback;

