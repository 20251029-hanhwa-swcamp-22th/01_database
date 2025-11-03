-- 01_SELECT : 특정 테이블의 원하는 데이터(행)을 조회하는 구문

-- tb1_menu 테이블의 모든 메뉴 이름 (menu_name) 조회
/*범위 주석 단축기 ctrl+shift+/ */
/*2*/
SELECT
    menu_name
/*해석 1번째*/FROM
    tbl_menu;

-- 모든 메뉴의 menu_code, menu_name, menu_price 조회

SELECT
    tbl_menu.menu_code, menu_name, menu_price
FROM
    tbl_menu;

SELECT
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu;



SELECT
    *
FROM tbl_menu;
