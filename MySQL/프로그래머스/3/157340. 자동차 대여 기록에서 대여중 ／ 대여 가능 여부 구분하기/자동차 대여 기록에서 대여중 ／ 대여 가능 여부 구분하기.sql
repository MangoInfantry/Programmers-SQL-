# 출력: 10월 16일에 대여 중인 자동차인 경우 '대여중', 아닌 경우 '대여 가능'을 표시하는 칼럼을 만들어 자동차 id와 함께 출력
# 조건: 자동차 id를 기준으로 내림차순 정렬
# start_date와 end_date 사이에 10-16일이 있는 차 테이블 + start_date와 end_date 사이에 10-16일이 없는 차 테이블 union all

with cte as (    
    select car_id, '대여중' as availability
    from car_rental_company_rental_history
    where '2022-10-16' between start_date and end_date
)

select *
from cte 

union 

select car_id, '대여 가능' as availability  
from car_rental_company_rental_history
where car_id not in (select car_id
                       from cte)
order by car_id desc