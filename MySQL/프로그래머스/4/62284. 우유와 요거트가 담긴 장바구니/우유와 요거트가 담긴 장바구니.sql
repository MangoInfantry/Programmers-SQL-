# 출력: 우유와 요거트를 동시에 구입한 장바구니 아이디를 조회하는 쿼리
# cte를 통해서 씨리얼 혹은 요거트를 가진 사람들을 필터링하고, lag를 통해 다음 물품이 뭔지 구한다. 
# 만약에 lag한것에서 물품이 null이 아니고, name와 lag1이 서로 같지 않다면, 씨리얼과 요거트를 둘다 산 사람.  

with cte as (
    select *, lag(name,1) over (partition by cart_id) as lag1
    from cart_products
    where name in ('Milk','Yogurt')
)

select distinct cart_id
from cte
where lag1 is not null and name != lag1
order by cart_id