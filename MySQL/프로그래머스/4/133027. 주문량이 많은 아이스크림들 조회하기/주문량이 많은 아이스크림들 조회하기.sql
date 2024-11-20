# 출력: 7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회

with cte as (
    select *
    from first_half 

    union all

    select *
    from july
), cte2 as (
    select flavor, sum(total_order) as total_order
    from cte
    group by flavor
)

select flavor
from cte2
order by total_order desc
limit 3
