-- 01_SELECT : 특정 테이블의 원하는 행을 조회하는 구문

-- tbl_menu 테이블의 모든 메뉴 'menu_name' 조회
SELECT menu_name FROM tbl_menu;

-- 모든 메뉴의 menu_code, menu_name, menu_price 조회
SELECT menu_code, menu_name, menu_price FROM tbl_menu;

-- tbl_menu 테이블 모든 column 조회 (* == all)
SELECT * FROM tbl_menu;