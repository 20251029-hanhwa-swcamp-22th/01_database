-- 01_SELECT: 특정 테이블의 원하는 데이터(행)을 조회하는 구문

-- tbl_menu 테이블의 모든 메뉴 이름(menu_name) 조회
/*범위 주석 (단축기 ctrl + shift + /)*/
/*2*/
SELECT
    menu_name
/*1*/
FROM
    tbl_menu;

SELECT
    menu_code,
    menu_name,
    menu_price
FROM
    tbl_menu;

-- tbl_menu 테이블의 모든 열 조회
SELECT
    *
FROM
    tbl_menu;

