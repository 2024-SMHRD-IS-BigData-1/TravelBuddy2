-- table 생성
create table web_member(
	email varchar2(100) primary key,
	pw varchar2(100) not null,
	tel varchar2(100) not null,
	address varchar2(100) not null
);
-- alt+x 실행 단축키

-- test
insert into web_member values('test1', 'test1', 'test1', 'test1');

-- select
select * from web_member;

-- web_message
-- 컬럼명 : num(pk), sender, receiver, message, m_date
-- 데이터 타입 : number, varchar2(100), date
create table web_message(
	num number primary key,
	sender varchar2(100),
	receiver varchar2(100),
	message varchar2(100),
	m_date date
);

-- num 컬럼에 들어갈 시퀀스 번호 생성 : num_message
create sequence num_message
start with 1
increment by 1;

-- test 데이터 넣기
insert into web_message values(num_message.nextval, 'test1','test1','test1',sysdate);
insert into web_message values(num_message.nextval, 'test2','test2','test2',sysdate);
insert into web_message values(num_message.nextval, 'test3','test3','test3',sysdate);


-- 조회
select * from web_message;

-- web_board 생성
create table web_board(
	num number primary key,
	title varchar2(100),
	writer varchar2(100),
	filename varchar2(100),
	content varchar2(100),
	b_date date
);

-- web_board의 num 컬럼에 들어갈 시퀀스 번호 생성 : num_board
create sequence num_board
start with 1
increment by 1;

-- test 데이터 넣기
insert into web_board values(num_board.nextval, 'test1','test1','test1','test1',sysdate);
insert into web_board values(num_board.nextval, 'test2','test2','test2','test2',sysdate);

select * from web_board;









