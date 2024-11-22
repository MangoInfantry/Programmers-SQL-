# 출력: 2022년 1월 도서 판매 데이터 기준, 저자별, 카테고리 별 매출액
# 조건: 저자 ID, 저자명, 카테고리, 매출액을 출력하고, 저자 ID 오름차순, 카테고리 내림차순
# CTE1에서 BOOK_SALES와 BOOK 테이블을 조인하고 SALES_DATE가 1월 달인 것을 필터링
# CTE1과 AUTHOR 테이블을 AUTHOR_ID를 가지고 조인하고, TOTA_SALES를 열을 생성한 CTE2 생성
# 문제에서 말한 조건 그대로 출력

with cte1 as (
    select s.book_id, author_id, category, sales, price, sum(sales*price) as total_sales
    from book_sales as s
    join book as b
    on s.book_id = b.book_id
    where left(sales_date,7) = '2022-01'
    group by author_id, category
)

select a.author_id, author_name, category, total_sales
from cte1 as c
join author as a
on c.author_id = a.author_id
order by a.author_id asc, category desc
