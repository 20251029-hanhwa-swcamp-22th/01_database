SELECT * FROM tbl_menu;

-- VIEW 생성
CREATE VIEW IF NOT EXISTS hansik AS
SELECT
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE category_code = 4;

-- 생성된 VIEW 조회
SELECT * FROM hansik;

INSERT
  INTO tbl_menu
VALUES (null, '식혜맛국밥', 5500, 4, 'Y');
SELECT * FROM hansik;

-- INSERT INTO hansik VALUES (null, '식혜맛국밥', 5500, 4, 'Y');    -- 에러 발생
INSERT
  INTO hansik
VALUES (99, '수정과맛국밥', 5500, 4, 'Y');
SELECT * FROM hansik;
SELECT * FROM tbl_menu;

UPDATE hansik
   SET menu_name = '버터맛국밥', menu_price = 5700
 WHERE menu_code = 99;
SELECT * FROM hansik;
SELECT * FROM tbl_menu;

DELETE FROM hansik WHERE menu_code = 99;
SELECT * FROM hansik;
SELECT * FROM tbl_menu;

-- (2) 뷰에 포함되지 않은 컬럼 중 베이스 테이블에 not null 조건이 있는 경우

-- tbl_menu_notnull 구조
CREATE TABLE tbl_menu_notnull (
  menu_code INT PRIMARY KEY,
  menu_name VARCHAR(30) NOT NULL,
  menu_price INT NOT NULL,           -- NOT NULL
  category_code INT NOT NULL,        -- NOT NULL
  orderable_status CHAR(1) NOT NULL
);


-- VIEW에서 menu_price 제외
CREATE VIEW view_menu_no_price AS
SELECT menu_code, menu_name, category_code, orderable_status
FROM tbl_menu_notnull;


-- INSERT 실패
INSERT INTO view_menu_no_price VALUES (NULL, '메뉴', 4, 'Y');
-- 에러: menu_price는 NOT NULL인데 값이 없음!

DROP VIEW hansik;

CREATE OR REPLACE VIEW hansik AS
SELECT
       menu_code AS '메뉴코드'
     , menu_name '메뉴명'
     , category_name '카테고리명'
  FROM tbl_menu a
  JOIN tbl_category b ON a.category_code = b.category_code
 WHERE b.category_name = '한식';

SELECT * FROM hansik;

