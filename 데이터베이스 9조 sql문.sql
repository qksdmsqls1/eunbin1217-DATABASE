-- 데이터베이스 9조 sql문
USE hamburgerordersystem;

CREATE TABLE 주문
(
 O_ID INTEGER NOT NULL,
 O_INFO VARCHAR(30),
 O_NUM INTEGER,
 O_DATE DATETIME,
 C_ID INTEGER NOT NULL,
 PRIMARY KEY(O_ID),
 FOREIGN KEY(C_ID) REFERENCES 고객(C_ID)
 );

CREATE TABLE 고객
(
 C_ID INTEGER NOT NULL,
 C_PW varchar(30),
 C_NAME varchar(10), 
 C_PHONE varchar(30),
 PRIMARY KEY(C_ID)
);

CREATE TABLE 결제
(
 P_ID INTEGER NOT NULL,
 P_DATE DATETIME,
 P_PRICE INTEGER, 
 P_METHOD varchar(30),
 O_ID INTEGER NOT NULL,
 PRIMARY KEY(P_ID),
 FOREIGN KEY(O_ID) REFERENCES 주문(O_ID)
);

CREATE TABLE 주소
(
 A_ID INTEGER NOT NULL,
 R_NAME varchar(10),
 ADDRESS varchar(30), 
 C_ID INTEGER NOT NULL,
 PRIMARY KEY(A_ID),
 FOREIGN KEY(C_ID) REFERENCES 고객(C_ID)
);

CREATE TABLE 제조업체
(
 M_ID INTEGER NOT NULL PRIMARY KEY,
 M_NAME varchar(30), 
 M_PHONE varchar(30)
);
 
CREATE TABLE 버거
(
 B_ID INTEGER NOT NULL,
 B_NAME varchar(30),
 B_PRICE INTEGER,
 M_ID INTEGER NOT NULL,
 PRIMARY KEY(B_ID),
 FOREIGN KEY(M_ID) REFERENCES 제조업체(M_ID)
);

CREATE TABLE 배달
(
 D_ID INTEGER NOT NULL PRIMARY KEY,
 D_INFO varchar(50),
 D_ST datetime, 
 D_FT datetime, 
 O_ID INTEGER NOT NULL,
 A_ID INTEGER NOT NULL,
 FOREIGN KEY(O_ID) REFERENCES 주문(O_ID),
 FOREIGN KEY(A_ID) REFERENCES 주소(A_ID)
);

CREATE TABLE 사이드
(
 S_ID INTEGER NOT NULL,
 S_NAME varchar(10),
 S_PRICE INTEGER, 
 M_ID INTEGER NOT NULL,
 PRIMARY KEY(S_ID),
 FOREIGN KEY(M_ID) REFERENCES 제조업체(M_ID)
);

CREATE TABLE 쿠폰
(
 CP_ID INTEGER NOT NULL,
 DISCOUNT INTEGER,
 C_ID INTEGER NOT NULL,
 PRIMARY KEY(CP_ID),
 FOREIGN KEY(C_ID) REFERENCES 고객(C_ID)
);

CREATE TABLE 리뷰
(
 R_ID INTEGER NOT NULL,
 R_CONTENT VARCHAR(100),
 R_DATE DATETIME,
 C_ID INTEGER NOT NULL,
 PRIMARY KEY(R_ID),
 FOREIGN KEY(C_ID) REFERENCES 고객(C_ID)
);

ALTER TABLE 쿠폰
ADD COLUMN CP_NAME VARCHAR(20);

ALTER TABLE 리뷰
ADD COLUMN R_TITLE VARCHAR(20);

INSERT INTO Customer (customer_id, password, name, phone_number) VALUES
(1, 'password001', '이광수', '123-456-0001'),
(2, 'password002', '송강', '123-456-0002'),
(3, 'password003', '전정국', '123-456-0003'),
(4, 'password004', '차은우', '123-456-0004'),
(5, 'password005', '송지효', '123-456-0005'),
(6, 'password006', '황은빈', '123-456-0006'),
(7, 'password007', '김현서', '123-456-0007'),
(8, 'password008', '홍길동', '123-456-0008'),
(9, 'password009', '전지현', '123-456-0009'),
(10, 'password010', '장원영', '123-456-0010'),
(11, 'password011', '오해원', '123-456-0011'),
(12, 'password012', '유지민', '123-456-0012'),
(13, 'password013', '이지은', '123-456-0013'),
(14, 'password014', '임영웅', '123-456-0014'),
(15, 'password015', '차태현', '123-456-0015'),
(16, 'password016', '마동석', '123-456-0016'),
(17, 'password017', '김범수', '123-456-0017'),
(18, 'password018', '우도환', '123-456-0018'),
(19, 'password019', '송건희', '123-456-0019'),
(20, 'password020', '양세종', '123-456-0020');


INSERT INTO 주문 (O_ID, O_INFO, O_NUM, O_DATE, C_ID) VALUES
(1, '1번 주문 정보', '001', '2024-06-01 10:00:00', 1),
(2, '2번 주문 정보', '002', '2024-06-01 11:00:00', 2),
(3, '3번 주문 정보', '003', '2024-06-01 12:00:00', 3),
(4, '4번 주문 정보', '004', '2024-06-01 13:00:00', 4),
(5, '5번 주문 정보', '005', '2024-06-01 14:00:00', 5),
(6, '6번 주문 정보', '006', '2024-06-01 15:00:00', 6),
(7, '7번 주문 정보', '007', '2024-06-01 16:00:00', 7),
(8, '8번 주문 정보', '008', '2024-06-01 17:00:00', 8),
(9, '9번 주문 정보', '009', '2024-06-01 18:00:00', 9),
(10, '10번 주문 정보', '010', '2024-06-01 19:00:00', 10);

INSERT INTO 결제 (P_ID, P_DATE, P_PRICE, P_METHOD, O_ID) VALUES
(1, '2024-06-01 11:00:00', 10000, '신용카드', 1),
(2, '2024-06-01 12:00:00', 20000, '신용카드', 2),
(3, '2024-06-01 13:00:00', 15000, '카카오페이', 3),
(4, '2024-06-01 14:00:00', 25000, '토스페이', 4),
(5, '2024-06-01 15:00:00', 30000, '신용카드', 5),
(6, '2024-06-01 16:00:00', 12000, '네이버페이', 6),
(7, '2024-06-01 17:00:00', 18000, '신용카드', 7),
(8, '2024-06-01 18:00:00', 22000, '카카오페이', 8),
(9, '2024-06-01 19:00:00', 14000, '네이버페이', 9),
(10, '2024-06-01 20:00:00', 26000, '토스페이', 10);

INSERT INTO 주소 (A_ID, R_NAME, ADDRESS, C_ID) VALUES
(1, '이광수', '행운시 봄꽃길 123-1', 1),
(2, '송강', '행복시 해돋이로 456-2', 2),
(3, '전정국', '행운시 은하수로 789-3', 3),
(4, '차은우', '사랑시 푸른바다로 101-4', 4),
(5, '송지효', '행운시 봄꽃길 102-5', 5),
(6, '황은빈', '순천시 종강으로 103-6', 6),
(7, '김현서', '행복시 해돋이로 104-7', 7),
(8, '홍길동', '행운시 은하수로 105-8', 8),
(9, '전지현', '사랑시 바람꽃길 106-9', 9),
(10, '장원영', '행복시 별빛마을 107-10', 10),
(11, '오해원', '순천시 종강으로 108-11', 11),
(12, '유지민', '행복시 무지개로 109-12', 12),
(13, '이지은', '행운시 은하수로 110-13', 13),
(14, '임영웅', '사랑시 푸른바다로 111-14', 14),
(15, '차태현', '행운시 은하수로 112-15', 15),
(16, '마동석', '행복시 해돋이로 113-16', 16),
(17, '김범수', '사랑시 바람꽃길 114-17', 17),
(18, '우도환', '순천시 종강으로 115-18', 18),
(19, '송건희', '행운시 봄꽃길 116-19', 19),
(20, '양세종', '순천시 종강으로 117-20', 20);


INSERT INTO 제조업체 VALUES(1, '게살버거', '010-1234-5678');
INSERT INTO 제조업체 VALUES(2, '프리미어베지터블', '010-2345-6789');
INSERT INTO 제조업체 VALUES(3, '로얄패티', '010-3456-7890');


INSERT INTO 버거 (B_ID, B_NAME, B_PRICE, M_ID) VALUES
(1, '클래식 버거', 5000, 1),
(2, '치즈 버거', 5500, 1),
(3, '베이컨 버거', 6000, 2),
(4, '더블 패티 버거', 6500, 2),
(5, '스파이시 치킨 버거', 5500, 3),
(6, '도라지 버거', 6000, 3),
(7, '피클 버거', 7000, 1),
(8, '낙지 버거', 7500, 2),
(9, '아스파라거스 버거', 8000, 3),
(10, '취두부 버거', 8500, 1);



INSERT INTO 사이드 (S_ID, S_NAME, S_PRICE, M_ID) VALUES
(1, '개불 구이', 2000, 1),
(2, '치즈스틱', 2500, 2),
(3, '할라피뇨 볶음', 3000, 3),
(4, '감자 튀김', 2200, 1),
(5, '육회', 3500, 2);


INSERT INTO 쿠폰 (CP_ID, DISCOUNT, C_ID, CP_NAME) VALUES
(1, 1000, 1, '천원 할인 쿠폰'),
(2, 2000, 2, '2천원 할인 쿠폰'),
(3, 5000, 3, '5천원 할인 쿠폰');



INSERT INTO 배달 (D_ID, D_INFO, D_ST, D_FT, O_ID, A_ID) VALUES
(1, '한 입 먹고 가 주세요', '2024-06-01 10:30:00', '2024-06-01 10:45:00', 1, 1),
(2, '춤 추면서 들어와주세요', '2024-06-01 11:00:00', '2024-06-01 11:20:00', 2, 2),
(3, '문 앞에 두고 벨 눌러주세요', '2024-06-01 11:30:00', '2024-06-01 11:50:00', 3, 3),
(4, '전화하지마세요', '2024-06-01 12:00:00', '2024-06-01 12:15:00', 4, 4),
(5, '메롱', '2024-06-01 12:30:00', '2024-06-01 12:45:00', 5, 5),
(6, '직접 전달해주세요', '2024-06-01 13:00:00', '2024-06-01 13:20:00', 6, 6),
(7, '벨 눌러주세요', '2024-06-01 13:30:00', '2024-06-01 13:45:00', 7, 7),
(8, '노래 불러주세요', '2024-06-01 14:00:00', '2024-06-01 14:20:00', 8, 8),
(9, '비밀번호 1234로 들어와 주세요', '2024-06-01 14:30:00', '2024-06-01 14:50:00', 9, 9),
(10, '문 고리에 걸어놔주세요', '2024-06-01 15:00:00', '2024-06-01 15:15:00', 10, 10);


INSERT INTO 리뷰 (R_ID, R_TITLE, R_DATE, C_ID) VALUES
(1, '너무하네요..', '아이 먹이려고 버거 3등분 해달라고 요청했는데... 그냥 주셨네요;;', '2024-05-03 15:00:17', 1),
(2, '최고의 버거', '취두부 버거 저만 알고 싶네요~', '2024-05-12 11:40:25', 2),
(3, '이게 뭐죠?', '피클 버거에 피클 밖에 없네요? 장사 이런 식으로 하지 마세요.', '2024-05-14 12:38:10', 3),
(4, '맛있어용', '다른 메뉴도 맛있을 것 같아요. 왜 다들 맛이 없다고 하시는지.. 다음에 또 주문할게요.', '2024-05-16 17:20:00', 4),
(5, '럭키비키', '햄버거 시켰는데 육회까지 왔어요 이거 완전 럭키비키잖아~~♥.', '2024-05-16 18:01:00', 5),
(6, '사장님', '버거 레시피 좀 알려 주세요ㅜㅜ.', '2024-05-18 15:48:36', 6),
(7, '맛있으면 짖는 개', '왈왈멍엄!!!!ㅇ크르으릉!!!아우왈왈!!!!!!!', '2024-05-20 16:46:00', 7),
(8, '추천해요', '친구들에게도 추천했어요. 정말 맛있었어요.', '2024-05-21 17:00:00', 8),
(9, '재주문 의사 있어요', '맛도 좋고 가격도 괜찮아요. 다시 주문할게요.', '2024-05-21 18:15:10', 9),
(10, '그럭저럭', '그럭저럭 먹을만 했어요. 큰 기대는 안하는게 좋을 듯.', '2024-05-24 19:50:00', 10),
(11, '만족해요', '전체적으로 만족스러웠어요. 맛도 좋고 서비스도 좋아요.', '2024-05-26 20:00:00', 11),
(12, '최고!', '이런 맛은 처음이에요. 정말 맛있었어요!', '2024-05:27 21:00:00', 12);

UPDATE 버거
SET B_PRICE = 15000
WHERE B_ID = 10;

UPDATE 고객
SET C_NAME = '이궁수'
WHERE C_ID = 1;

DELETE FROM 사이드
WHERE S_ID = 1;

SELECT R_CONTENT, R_TITLE
FROM 리뷰;

SELECT B_NAME, B_PRICE
FROM 버거
WHERE B_PRICE >= 7000;

SELECT *
FROM 제조업체
WHERE M_ID = 3;


SELECT *
FROM 배달;

SELECT *
FROM 쿠폰
WHERE DISCOUNT >= 2000;

SELECT R_NAME, ADDRESS
FROM 주소
WHERE ADDRESS LIKE "행복%";








