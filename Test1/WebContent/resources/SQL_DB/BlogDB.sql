/*======================
    블로그 프로젝트 DB 
======================*/

/*===== 사전 정보 확인 =====*/
--DB와 인스턴스 이름은 XE이다.
select name from v$database;
select instance_name from v$instance;
--오라클 버전 확인
select * from v$version;


/*===== 실행 후 테이블 수정/저장 =====*/
--아래 내용을 전부 실행한 뒤 커밋한다.
--commit;

--기존 테이블을 삭제한다.
--drop table memberinfo CASCADE CONSTRAINTS;
--drop table post_info CASCADE CONSTRAINTS;


/*===== 테이블 생성 =====*/
--날짜 데이터는 '년-월-일'  로 입력 가능하게 하기
alter session set nls_date_format = 'yyyy-mm-dd' ; 

--회원정보 테이블 생성
create table memberinfo(
    mem_no number(5) Primary key,
    mem_id varchar2(20) not null,
    mem_pwd varchar2(20) not null,
    mem_name varchar2(10) not null,
    mem_bir_yy VARCHAR(25),
    mem_bir_mm VARCHAR(25),
    mem_bir_dd VARCHAR(25),
    mem_gender VARCHAR(25),
    mem_mail VARCHAR(25),
    mem_phone VARCHAR(25),
    mem_regdate  date default sysdate,
    mem_pic  varchar2(90)
);

--게시글 테이블 생성(회원목록의 mem_no 연결)
create table post_info (
    post_no  number(4) Primary key,
    mem_no  number(5) not null,
    post_title  varchar2(60) not null,
    post_thumbnail  varchar2(80) not null,
    post_video varchar2(50),
    post_content  varchar2(180) not null,
    visit_cnt  number(5) default 0, --기본값 0 설정
    post_uploadtime  date default sysdate,
    
    foreign key(mem_no) REFERENCES memberinfo(mem_no)
);

--임시 멤버 및 관리자 넣어놓기
insert into memberinfo values(1,'heannim12','heannim12','김히앤','2022','4','10','','','','','');
insert into memberinfo values(2,'shopAdmin','shopAdmin','관리자','2022','4','10','','','','','');

--게시글도 테스트용 데이터 넣어놓기
insert into post_info values(1,1,'게시글1제목','post1.jpg','','게시글1내용게시글1내용게시글1내용게시글1내용게시글1내용게시글1내용게시글1내용게시글1내용',0,'');
insert into post_info values(2,1,'게시글2제목','post2.jpg','','게시글2내용게시글2내용게시글2내용게시글2내용게시글2내용게시글2내용게시글2내용게시글2내용',1,'');
insert into post_info values(3,2,'게시글3제목','게시글3섬네일','','게시글3내용게시글3내용게시글3내용게시글3내용게시글3내용게시글3내용게시글3내용게시글3내용',0,'');
insert into post_info values(4,1,'게시글4제목','게시글4섬네일','','게시글4내용게시글4내용게시글4내용게시글4내용게시글4내용게시글4내용게시글4내용게시글4내용',1,'');
insert into post_info values(5,1,'게시글5제목','게시글5섬네일','','게시글5내용게시글5내용게시글5내용게시글5내용게시글5내용게시글5내용게시글5내용게시글5내용',0,'');
insert into post_info values(6,1,'게시글6제목','게시글6섬네일','','게시글6내용게시글6내용게시글6내용게시글6내용게시글6내용게시글6내용게시글6내용게시글6내용',1,'');
insert into post_info values(7,1,'게시글7제목','게시글7섬네일','','게시글7내용게시글7내용게시글7내용게시글7내용게시글7내용게시글7내용게시글7내용게시글7내용',0,'');
insert into post_info values(8,2,'게시글8제목','게시글8섬네일','','게시글8내용게시글8내용게시글8내용게시글8내용게시글8내용게시글8내용게시글8내용게시글8내용',1,'');
insert into post_info values(9,1,'게시글9제목','게시글9섬네일','','게시글9내용게시글9내용게시글9내용게시글9내용게시글9내용게시글9내용게시글9내용게시글9내용',0,'');
insert into post_info values(10,1,'게시글10제목','게시글10섬네일','','게시글10내용게시글10내용게시글10내용게시글10내용게시글10내용게시글10내용게시글10내용게시글10내용',1,'');
insert into post_info values(11,1,'게시글11제목','게시글11섬네일','','게시글11내용게시글11내용게시글11내용게시글11내용게시글11내용게시글11내용게시글11내용게시글11내용',0,'');
insert into post_info values(12,1,'게시글12제목','게시글12섬네일','','게시글12내용게시글12내용게시글12내용게시글12내용게시글12내용게시글12내용게시글12내용게시글12내용',1,'');
insert into post_info values(13,2,'게시글13제목','게시글13섬네일','','게시글13내용게시글13내용게시글13내용게시글13내용게시글13내용게시글13내용게시글13내용게시글13내용',0,'');
insert into post_info values(14,1,'게시글14제목','게시글14섬네일','','게시글14내용게시글14내용게시글14내용게시글14내용게시글14내용게시글14내용게시글14내용게시글14내용',1,'');
insert into post_info values(15,1,'게시글15제목','게시글15섬네일','','게시글15내용게시글15내용게시글15내용게시글15내용게시글15내용게시글15내용게시글15내용게시글15내용',0,'');
insert into post_info values(16,1,'게시글16제목','게시글16섬네일','','게시글16내용게시글16내용게시글16내용게시글16내용게시글16내용게시글16내용게시글16내용게시글16내용',1,'');
insert into post_info values(17,1,'게시글17제목','게시글17섬네일','','게시글17내용게시글17내용게시글17내용게시글17내용게시글17내용게시글17내용게시글17내용게시글17내용',0,'');
insert into post_info values(18,1,'게시글18제목','게시글18섬네일','','게시글18내용게시글18내용게시글18내용게시글18내용게시글18내용게시글18내용게시글18내용게시글18내용',1,'');
insert into post_info values(19,2,'게시글19제목','게시글19섬네일','','게시글19내용게시글19내용게시글19내용게시글19내용게시글19내용게시글19내용게시글19내용게시글19내용',0,'');
insert into post_info values(20,1,'게시글20제목','게시글20섬네일','','게시글20내용게시글20내용게시글20내용게시글20내용게시글20내용게시글20내용게시글20내용게시글20내용',1,'');


-- 블로그 포스팅 글에 왼쪽에 게시글 쓴 멤버의 블로그 프로필 정보를 가져오기 위해 join하는 sql문
select p.*, m.mem_id from post_info p left join memberinfo m on p.mem_no = m.mem_no where POST_NO=2;

--블로그 포스팅 Insert 하는 sql문
INSERT INTO post_info( 
                post_no
               , mem_no
               , post_title
               , post_thumbnail
               , post_content
               ,visit_cnt
               ,post_uploadtime
               )
         VALUES( (SELECT NVL(MAX(post_no), 0) + 1 FROM post_info)
               , 2
               , 'GENT'
               , 'BLOGGER'
               , '7839'
               , 1
               , TRUNC(SYSDATE)
               )
               
insert into post_info 
               VALUES( (SELECT NVL(MAX(post_no), 0) + 1 FROM post_info),2,'김2','김','김','김',3,TRUNC(SYSDATE))     
select * from post_info