-- 1) 바교 연산자 (=, !=, <>, <, >, <=, >=)

select a.menu_code, a.menu_name, a.orderable_status
  from tbl_menu a
 where a.orderable_status = 'Y'
order by a.menu_code;

select a.*
  from tbl_menu a
 where a.menu_name = '붕어빵초밥'
order by a.menu_code;

-- 메뉴 가격이 13000인 메뉴의 메뉴명, 가격을 메뉴명 내림 차순으로 조회
select a.menu_name `메뉴명`
      ,a.menu_price `메뉴 가격`
  from tbl_menu a
 where a.menu_price = '13000'
order by  a.menu_name DESC;

-- [ !=, <> ]같지 않음
-- orderable_status가 'Y'가 아닌 메뉴의 메뉴코드, 메뉴명, 주문가능상태를
-- 메뉴명 오름차순으로 조회
select a.menu_code cd, a.menu_name nm, a.orderable_status status
  from tbl_menu a
 where a.orderable_status <> 'Y'
 -- where a.orderable_status != 'Y'
order by a.menu_name;

-- 대소 바교(초과, 미만, 이상, 이하)
-- 메뉴 가격이 20000원 초과인 메뉴의 메뉴명, 가격을
-- 메뉴코드 내림차순으로 조회
select a.menu_name nm, a.menu_price price
  from tbl_menu a
 where a.menu_price > '20000'
order by a.menu_code desc;

-- 메뉴 가격이 20000원 이하인 메뉴의 메뉴명, 가격을
-- 메뉴코드 내림차순으로 조회
select a.menu_name nm, a.menu_price price
  from tbl_menu a
 where a.menu_price <= '20000'
order by a.menu_code desc;

-- 메뉴 가격이 20000원 이상인 메뉴의 메뉴명, 가격을
-- 메뉴코드 내림차순으로 조회
select a.menu_name nm, a.menu_price price
  from tbl_menu a
 where a.menu_price >= '20000'
order by a.menu_code desc;

-- 메뉴 가격이 20000원 미만인 메뉴의 메뉴명, 가격을
-- 메뉴코드 내림차순으로 조회
select a.menu_name nm, a.menu_price price
  from tbl_menu a
 where a.menu_price < '20000'
order by a.menu_code desc;

-- 초과 <-> 이하 , 이상 <-> 미만

/*
   2) 논리 연산자
   - 논리란? 참(true), 거짓(false)을 나타내는 값
 */

-- A AND B : A와 B 모두 참(true)인 경우 결과가 true
--           나머진 모두 false

-- 주문가능상태가 'Y'이며 카테고리 코드가 10에 해당하는 메뉴만 조회
select a.*
  from tbl_menu a
 where a.orderable_status = 'Y'
   and a.category_code = '10'
;

-- 메뉴 가격이 5000원 초과이면서 카테고리 번호가 10인 메뉴의
-- 메뉴코드, 메뉴명, 카테고리 코드를 메뉴코드 오름차순으로 조회
select a.menu_code cd, a.menu_name nm, a.category_code ct_cd
  from tbl_menu a
 where a.menu_price > 5000
   and a.category_code = '10'
order by a.menu_code;

-- 메뉴 가격이 5000원 이상, 20000원 미만인 메뉴의
-- 메뉴명, 메뉴가격을 메뉴 가격 오름차순으로 조회
select a.menu_name nm, a.menu_price price
  from tbl_menu a
 where a.menu_price >= '5000'
   and a.menu_price < '20000'
order by a.menu_price;

-- 메뉴 가격이 5000원 이상, 20000원 미만, 카테고리 코드가 10인 메뉴의
-- 메뉴명, 메뉴가격, 카테고리 코드를 메뉴 가격 오름차순으로 조회
select a.menu_name nm, a.menu_price price, a.category_code ct_cd
  from tbl_menu a
 where (
       a.menu_price >= '5000'
   and a.menu_price < '20000'
       )
   and a.category_code = '10'
order by a.menu_price;

-- A OR B : A 또는 B 하나라도 참(true)인 경우 결과가 true
--           둘 다 거짓일 때만 false

-- 주문 가능한 상태이거나 카테고리 코드가 10인 메뉴를 모두 조회
select a.*
  from tbl_menu a
 where a.orderable_status = 'Y'
    or a.category_code = '10'
order by a.menu_code;

-- 메뉴 가격이 5000원 미만 또는 20000원 이상인 메뉴의
-- 메뉴명, 메뉴가격을 메뉴 가격 오름차순으로 조회
select a.menu_name nm, a.menu_price price
  from tbl_menu a
 where a.menu_price < '5000'
    or a.menu_price >= '20000'
order by a.menu_price;

/* AND, OR 중 우선순위는 AND가 높다 */

select a.*
  from tbl_menu a
 where a.category_code = '4'
    or a.menu_price = '9000'
   and a.menu_code > '10';

-- 우선순위 문제 해결시 괄호 이용
select a.*
  from tbl_menu a
 where (
       a.category_code = '4'
       or a.menu_price = '9000'
       )
   and a.menu_code > '10';

-- between a and b : a 이상 b 이하 범위 지정
select a.*
  from tbl_menu a
 where -- a.menu_price >= '10000' and a.menu_price <= '25000'
       -- a.menu_price between '10000' and '25000'
       a.menu_price < '10000' or a.menu_price > '25000'
order by a.menu_price;
/* LIKE 연산자
   - 와일드카드를 이용해 문자열 패턴이 일치하면 조회
   - % : 포함
   - _ : 글자 개수
*/

-- %문자열 : 해당 문자열로 끝남
select a.menu_name
  from tbl_menu a
 where a.menu_name like '%아메리카노';

-- 문자열% : 해당 문자열로 시작
select a.menu_name
  from tbl_menu a
 where a.menu_name like '죽%';

-- %문자열% : 해당 문자열을 포함
select a.menu_name
  from tbl_menu a
 where a.menu_name like '%마늘%';

-- _ : 글자 개수
select a.menu_name
  from tbl_menu a
 where a.menu_name like '_____'; -- 5글자 메뉴명만 조회

 -- 마늘 앞에 반드시 1글자, 뒤에는 관계없음
select a.menu_name
  from tbl_menu a
 where a.menu_name like '_마늘%';

-- NOT LIKE : 문자열 패턴이 일치하지 않는 데이터만 조회
select a.menu_name
  from tbl_menu a
 where a.menu_name not like '_마늘%';

-- ESCAPE를 이용하여 와일드카드로서 사용되지 않게
select a.*
  from tbl_temp a
 where a.temp_email like '___#_' escape '#';

-- \(백슬래쉬) escape 문자
select a.*
  from tbl_temp a
 where a.temp_email like '___\_';

/* in / not in ( , ,  )
   - 찾는 값이 괄호 한에 있으면/없으면 결과 반환
   - or 연산을 여러 번 작성하는 것과 동치
*/
select a.*
  from tbl_menu a
 where a.category_code = '4'
    or a.category_code = '5'
    or a.category_code = '6'
    or a.category_code = '10'
order by a.category_code;

select a.*
  from tbl_menu a
 where a.category_code in ('4','5','6','10')
order by a.category_code;

select a.*
  from tbl_menu a
 where a.category_code not in ('4','5','6','10')
order by a.category_code;

/* null 관련 연산
   - null == 빈칸 (값x)
   --> 비교 연산이 불가능하다
*/
select a.*
  from tbl_category a
 where a.ref_category_code = null; -- 잘못된 비교연산

-- is null : 해딩 컬럼의 값이 null(빈칸)이면 true -> 결과 포함
select a.*
  from tbl_category a
 where a.ref_category_code is null

-- is not null : 해딩 컬럼의 값이 null(빈칸)이 아니면 true -> 결과 포함
select a.*
  from tbl_category a
 where a.ref_category_code is not null


