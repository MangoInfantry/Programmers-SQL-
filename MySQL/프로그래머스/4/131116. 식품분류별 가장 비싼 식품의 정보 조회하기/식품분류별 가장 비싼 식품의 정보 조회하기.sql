# 출력: 가격이 제일 비싼 식품의 분류, 가격, 이름
# 조건: 과자, 국, 김치, 식용유인 경우만 출력, 식품 가격을 기준으로 내림차순 정렬
# 과자, 국, 김치, 식용유인 경우만 cte를 통해 필터링 
# cte문 밖에서 window 함수를 통해 category로 묶고 가격에 따라 ranking을 매김
# ranking을 1인것만 출력

with cte as (
    select category, price, product_name
    from food_product
    where category in ('과자','국','김치','식용유')
), cte2 as (
    select category, price, product_name, dense_rank() over (partition by category order by price desc) as rnk
    from cte
)

select category, price as max_price, product_name
from cte2
where rnk = 1
order by max_price desc