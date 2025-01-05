-- 코드를 입력하세요
# 2022년 3월 오프라인/온라인 상품 판매 데이터의 판매 날짜, 상품id, 유저id, 판매량을 출력
# 판매일 기준으로 오름차순, 상품 id 오름차순, 유저id 오름차순
with cte as(
    select user_id, product_id, sales_amount, date_format(sales_date, '%Y-%m-%d') as sales_date
    from online_sale
    where left(sales_date,7) = '2022-03'
    
    union all 
    
    select null as user_id, product_id, sales_amount, date_format(sales_date, '%Y-%m-%d') as sales_date
    from offline_sale
    where left(sales_date,7) = '2022-03'
)

select sales_date, product_id, user_id, sales_amount
from cte
order by sales_date asc, product_id asc, user_id asc