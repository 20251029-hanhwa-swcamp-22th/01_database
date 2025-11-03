/* 02. ORDER BY
 - RESULT SET을 정렬하는 구문
   -> RESULT SET이란?
      SELECT문의 결과 집합(SELECT 실행해서 조회되는 데이터의 집합)


 - 보톤 SELECT문 제일 마지막에 작성


 - 정렬 방식
   1) ASC  : 오른차순(ascending)
   2) DESC : 내림차순(descending)
 */

#  SELECT menu_code,menu_name,menu_price FROM tbl_menu ORDER BY  menu_price ASC;
 SELECT
     menu_code,menu_name,menu_price
 FROM
     tbl_menu
 ORDER BY
     menu_price DESC;