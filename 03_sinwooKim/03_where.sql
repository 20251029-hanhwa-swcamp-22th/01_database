/*
03_where
    - 테이블에서 특정 조건에 맞는 레코드(행, row)만 선택하는 구문
    - 조건을 나타내기 위한 각종 연산자를 사용
*/

-- 1) 비교 연산자 (=, !=, <>, <, >, <=, >=)
SELECT menu_code, menu_name, orderable_status
FROM tbl_menu;

-- "=": 값이 일치하는지 확인
SELECT menu_code, menu_name, orderable_status
FROM tbl_menu
WHERE orderable_status = 'Y'
ORDER BY menu_name;

SELECT *
FROM tbl_menu
WHERE menu_name = '붕어빵초밥';

-- 메뉴 가격이 13000인 메뉴의 메뉴명, 가격을 메뉴 이름 내림 차순으로 조회
SELECT menu_name, menu_price
FROM tbl_menu
WHERE menu_price = 13000
ORDER BY menu_name DESC;

-- "!= , <>" 같지 않음
-- 주문가능상태가 'Y'가 아닌 메뉴의 메뉴 코드, 메뉴명, 주문가능상태를 메뉴명 오름차순으로 조회
SELECT menu_code, menu_name, orderable_status
FROM tbl_menu
WHERE orderable_status <> 'Y'
ORDER BY menu_name;

-- 대소 비교(초과, 미만, 이상, 이하)
-- 메뉴 가격이 20000초과인 메뉴의 메뉴명, 메뉴 가격을 메뉴 코드 내림차순으로 조회
SELECT menu_name, menu_price
FROM tbl_menu
WHERE menu_price > 20000
ORDER BY menu_code DESC;

SELECT menu_name, menu_price
FROM tbl_menu
WHERE menu_price >= 20000
ORDER BY menu_code DESC;

SELECT menu_name, menu_price
FROM tbl_menu
WHERE menu_price < 20000
ORDER BY menu_code DESC;

SELECT menu_name, menu_price
FROM tbl_menu
WHERE menu_price <= 20000
ORDER BY menu_code DESC;

/*
논리연산자
    - 논리란? 참(TRUE), 거짓(FALSE)를 나타내는 값
*/

-- A AND B : A와 B 모두 TRUE인 경우에만 결과도 TRUE, 나머진 모두 FALSE
-- 주문가능한 상태이며, 카테고리 코드가 10에 해당하는 메뉴만 조회
SELECT  *
FROM tbl_menu
WHERE orderable_status = 'Y' AND category_code = 10;


-- 메뉴 가격이 5000 초과이면서 카테고리 번호가 10인 메뉴의 메뉴코드, 메뉴명, 카테고리 코드를 메뉴코드 오름차순으로 조회
SELECT menu_code, menu_name, category_code
FROM tbl_menu
WHERE menu_price > 5000 AND category_code = 10
ORDER BY menu_code;

-- 메뉴 가격이 5000 이상, 20000 미만인 메뉴의 메뉴명, 메뉴 가격을 메뉴 가격 오름차순으로 조회
SELECT menu_name, menu_price
FROM tbl_menu
WHERE menu_price >= 5000 AND menu_price < 20000
ORDER BY menu_price;

-- 메뉴 가격이 5000 이상, 20000 미만, 카테고리 코드 10 인 메뉴의 메뉴명, 메뉴 가격, 카테고리 코드를 메뉴 가격 오름차순으로 조회
SELECT menu_name, menu_price, category_code
FROM tbl_menu
WHERE (menu_price >= 5000 AND menu_price < 20000) AND category_code = 10
ORDER BY menu_price;

/*
A OR B 연산자
    - A, B 둘 다 FALSE일 경우에만 FALSE
    - 하나라도 TRUE이면 TRUE
*/

-- 주문 가능한 상태 이거나 카테고리코드가 10인 메뉴를 모두 조회
SELECT *
FROM tbl_menu
WHERE orderable_status = 'Y' OR category_code = 10;

-- 메뉴 가격이 5000 미만 또는 20000 이상인 메뉴의 메뉴명, 메뉴 가격을 메뉴 가격 오름차순으로 조회
SELECT menu_name, menu_price
FROM tbl_menu
WHERE menu_price < 5000 OR menu_price >= 20000
ORDER BY menu_price;

/*
AND, OR 연산 중 우선순위는 AND가 높다.
*/

SELECT *
FROM tbl_menu
WHERE (category_code = 4 OR menu_price = 9000) AND menu_code > 6;

SELECT *
FROM tbl_menu
WHERE menu_price BETWEEN 10000 AND 25000
ORDER BY menu_price;

SELECT *
FROM tbl_menu
-- menu_price < 10000 OR menu_price > 25000
WHERE menu_price NOT BETWEEN 10000 AND 25000
ORDER BY menu_price;

/*
Like 연산자
    - 와일드카드를 이용해 문자열 패턴이 일치하면 조회
    - % : 포함
    - _ : 글자 개수
*/

SELECT menu_name
FROM tbl_menu
WHERE menu_name LIKE '%아메리카노';

SELECT menu_name
FROM tbl_menu
WHERE menu_name LIKE '죽%';

SELECT menu_name
FROM tbl_menu
WHERE menu_name LIKE '%이%';

-- _ : 글자 개수
SELECT menu_name
FROM tbl_menu
WHERE menu_name LIKE '_____'; -- 다섯글자 메뉴명만 조회

-- NOT LIKE : 문자열 패턴이 일치하지 않는 데이터만 조회
SELECT menu_name
FROM tbl_menu
WHERE menu_name NOT LIKE '_____'; -- 다섯글자 메뉴명 아닌 데이터만 조회