/*======================
    ��α� ������Ʈ DB 
======================*/

/*===== ���� ���� Ȯ�� =====*/
--DB�� �ν��Ͻ� �̸��� XE�̴�.
select name from v$database;
select instance_name from v$instance;
--����Ŭ ���� Ȯ��
select * from v$version;


/*===== ���� �� ���̺� ����/���� =====*/
--�Ʒ� ������ ���� ������ �� Ŀ���Ѵ�.
--commit;

--���� ���̺��� �����Ѵ�.
--drop table memberinfo CASCADE CONSTRAINTS;
--drop table post_info CASCADE CONSTRAINTS;


/*===== ���̺� ���� =====*/
--��¥ �����ʹ� '��-��-��'  �� �Է� �����ϰ� �ϱ�
alter session set nls_date_format = 'yyyy-mm-dd' ; 

--ȸ������ ���̺� ����
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

--�Խñ� ���̺� ����(ȸ������� mem_no ����)
create table post_info (
    post_no  number(4) Primary key,
    mem_no  number(5) not null,
    post_title  varchar2(60) not null,
    post_thumbnail  varchar2(80) not null,
    post_video varchar2(50),
    post_content  varchar2(180) not null,
    visit_cnt  number(5) default 0, --�⺻�� 0 ����
    post_uploadtime  date default sysdate,
    
    foreign key(mem_no) REFERENCES memberinfo(mem_no)
);

--�ӽ� ��� �� ������ �־����
insert into memberinfo values(1,'heannim12','heannim12','������','2022','4','10','','','','','');
insert into memberinfo values(2,'shopAdmin','shopAdmin','������','2022','4','10','','','','','');

--�Խñ۵� �׽�Ʈ�� ������ �־����
insert into post_info values(1,1,'�Խñ�1����','post1.jpg','','�Խñ�1����Խñ�1����Խñ�1����Խñ�1����Խñ�1����Խñ�1����Խñ�1����Խñ�1����',0,'');
insert into post_info values(2,1,'�Խñ�2����','post2.jpg','','�Խñ�2����Խñ�2����Խñ�2����Խñ�2����Խñ�2����Խñ�2����Խñ�2����Խñ�2����',1,'');
insert into post_info values(3,2,'�Խñ�3����','�Խñ�3������','','�Խñ�3����Խñ�3����Խñ�3����Խñ�3����Խñ�3����Խñ�3����Խñ�3����Խñ�3����',0,'');
insert into post_info values(4,1,'�Խñ�4����','�Խñ�4������','','�Խñ�4����Խñ�4����Խñ�4����Խñ�4����Խñ�4����Խñ�4����Խñ�4����Խñ�4����',1,'');
insert into post_info values(5,1,'�Խñ�5����','�Խñ�5������','','�Խñ�5����Խñ�5����Խñ�5����Խñ�5����Խñ�5����Խñ�5����Խñ�5����Խñ�5����',0,'');
insert into post_info values(6,1,'�Խñ�6����','�Խñ�6������','','�Խñ�6����Խñ�6����Խñ�6����Խñ�6����Խñ�6����Խñ�6����Խñ�6����Խñ�6����',1,'');
insert into post_info values(7,1,'�Խñ�7����','�Խñ�7������','','�Խñ�7����Խñ�7����Խñ�7����Խñ�7����Խñ�7����Խñ�7����Խñ�7����Խñ�7����',0,'');
insert into post_info values(8,2,'�Խñ�8����','�Խñ�8������','','�Խñ�8����Խñ�8����Խñ�8����Խñ�8����Խñ�8����Խñ�8����Խñ�8����Խñ�8����',1,'');
insert into post_info values(9,1,'�Խñ�9����','�Խñ�9������','','�Խñ�9����Խñ�9����Խñ�9����Խñ�9����Խñ�9����Խñ�9����Խñ�9����Խñ�9����',0,'');
insert into post_info values(10,1,'�Խñ�10����','�Խñ�10������','','�Խñ�10����Խñ�10����Խñ�10����Խñ�10����Խñ�10����Խñ�10����Խñ�10����Խñ�10����',1,'');
insert into post_info values(11,1,'�Խñ�11����','�Խñ�11������','','�Խñ�11����Խñ�11����Խñ�11����Խñ�11����Խñ�11����Խñ�11����Խñ�11����Խñ�11����',0,'');
insert into post_info values(12,1,'�Խñ�12����','�Խñ�12������','','�Խñ�12����Խñ�12����Խñ�12����Խñ�12����Խñ�12����Խñ�12����Խñ�12����Խñ�12����',1,'');
insert into post_info values(13,2,'�Խñ�13����','�Խñ�13������','','�Խñ�13����Խñ�13����Խñ�13����Խñ�13����Խñ�13����Խñ�13����Խñ�13����Խñ�13����',0,'');
insert into post_info values(14,1,'�Խñ�14����','�Խñ�14������','','�Խñ�14����Խñ�14����Խñ�14����Խñ�14����Խñ�14����Խñ�14����Խñ�14����Խñ�14����',1,'');
insert into post_info values(15,1,'�Խñ�15����','�Խñ�15������','','�Խñ�15����Խñ�15����Խñ�15����Խñ�15����Խñ�15����Խñ�15����Խñ�15����Խñ�15����',0,'');
insert into post_info values(16,1,'�Խñ�16����','�Խñ�16������','','�Խñ�16����Խñ�16����Խñ�16����Խñ�16����Խñ�16����Խñ�16����Խñ�16����Խñ�16����',1,'');
insert into post_info values(17,1,'�Խñ�17����','�Խñ�17������','','�Խñ�17����Խñ�17����Խñ�17����Խñ�17����Խñ�17����Խñ�17����Խñ�17����Խñ�17����',0,'');
insert into post_info values(18,1,'�Խñ�18����','�Խñ�18������','','�Խñ�18����Խñ�18����Խñ�18����Խñ�18����Խñ�18����Խñ�18����Խñ�18����Խñ�18����',1,'');
insert into post_info values(19,2,'�Խñ�19����','�Խñ�19������','','�Խñ�19����Խñ�19����Խñ�19����Խñ�19����Խñ�19����Խñ�19����Խñ�19����Խñ�19����',0,'');
insert into post_info values(20,1,'�Խñ�20����','�Խñ�20������','','�Խñ�20����Խñ�20����Խñ�20����Խñ�20����Խñ�20����Խñ�20����Խñ�20����Խñ�20����',1,'');


-- ��α� ������ �ۿ� ���ʿ� �Խñ� �� ����� ��α� ������ ������ �������� ���� join�ϴ� sql��
select p.*, m.mem_id from post_info p left join memberinfo m on p.mem_no = m.mem_no where POST_NO=2;

--��α� ������ Insert �ϴ� sql��
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
               VALUES( (SELECT NVL(MAX(post_no), 0) + 1 FROM post_info),2,'��2','��','��','��',3,TRUNC(SYSDATE))     
select * from post_info