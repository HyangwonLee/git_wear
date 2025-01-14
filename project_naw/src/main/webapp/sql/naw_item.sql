create table itemView (
    user_id	varchar2(15),                        -- 회원 id
    item_code varchar2(100),                     -- 상품 번호
    item_seq number(20) not null,                -- 시퀀스
    item_category1 varchar2(100) not null,       -- 카테고리1(MEN/WOMEN/KIDS)
    item_category2 varchar2(100) not null,       -- 카테고리2(신발/의류/용품)
    item_category3 varchar2(100) not null,       -- 카테고리3(러닝, 농구, 축구, 골프  / 자켓, 티셔츠, 후디, 팬츠 / 양말, 모자, 가방, 장갑)
    item_name varchar2(1000),                    -- 상품 이름
    item_image1	varchar2(100),                   -- 이미지 1(메인 이미지)
    item_image2	varchar2(100),                   -- 이미지 2(상세보기 이미지)
    item_details varchar2(3000),                 -- 설명
    item_size varchar2(200),                     -- 사이즈
    item_color varchar2(200),                    -- 색상
    cart_qty number(10),                         -- 상품개수
    item_price number(20),                       -- 상품 개별 금액
    item_date date                               -- 등록일
);

drop table itemView purge;

create sequence seq_item nocache nocycle;

drop sequence seq_item;

insert into itemView values('1234', '0001',seq_item.nextval, 'MEN', '신발', '러닝', '나이키머큐리얼에어줌베이퍼14프로', 
'나이키머큐리얼에어줌베이퍼14프로', '나이키머큐리얼에어줌베이퍼14프로', '나이키 머큐리얼 에어 줌 베이퍼 14 프로를 신고 거침없는 스피드를 만끽하세요.',
'265', 'white', 10, 55000, sysdate); 

select count(*) as cnt from itemView;

select * from itemView;

-- 상품 상세보기
select user_id, item_code, item_seq, item_category1, item_category2, item_category3, item_name,      
item_details, item_image1, item_image2, item_price, item_color, item_size, cart_qty 
from itemView;

 -- 상품 목록보기

select item_code, item_seq, item_category1, item_category2, item_category3, item_name,              
item_details, item_image1, item_price, item_date, item_color, item_size
from itemView;

select * from itemView where item_category1='KIDS';

select * from itemView order by item_date asc;          -- 등록일 기준 오름차순
select * from itemView order by item_date desc;         -- 등록일 기준 내림차순

select * from itemView order by item_price asc;         -- 가격 기준 오름차순
select * from itemView order by item_price desc;        -- 가격 기준 내림차순
    
select * from itemView order by item_date asc;          -- 리뷰 기준 오름차순
select * from itemView order by item_date desc;         -- 리뷰 기준 내림차순

select * from
(select rownum rn, tt. * from
(select * from itemView order by item_seq desc)tt)
where rn>=1 and rn<=10;

-- 상품 목록 보기
select * from itemView where item_category1='KIDS' order by item_seq;

-- 리뷰 글 join
select itemView.item_date, review.review_code
from itemView, reView
where itemView.item_date = review.review_code(+);               

select * from itemView where item_category1='KIDS' order by item_seq;
update itemView set item_image1='팬츠_3_카고팬츠_ 블랙_1.PNG', item_image2='팬츠_3_카고팬츠_ 블랙_2.PNG' where item_code='1030';  

delete itemView where cart_qty=0;

commit;

rollback;