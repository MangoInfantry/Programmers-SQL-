-- 코드를 입력하세요
# 출력: 3개의 테이블에서 자동차 종류가 '세단','suv'인 자동차 중에서 2022년 11월 1일부터 11월 30일까지 대여가능 
# 30일간 대여 금액이 50만원 이상, 200만원 미만인 자동차에 대해 자동차 id, 자동차 종류, 대여금액리스트를 출력해야 함

with cte as (
    select c.car_id, c.car_type,
           round(c.daily_fee * 30 * ((100 - d.discount_rate) / 100), 0) as fee
    from car_rental_company_car as c
    join car_rental_company_discount_plan as d
    on c.car_type = d.car_type
    and d.duration_type = '30일 이상'
    where c.car_type in ('세단', 'SUV')
    and c.car_id not in (
        select h.car_id
        from car_rental_company_rental_history h
        where h.start_date <= '2022-11-30'
        and h.end_date >= '2022-11-01'
    )
)

select car_id, car_type, fee
from cte
where fee >= 500000 and fee < 2000000
order by fee desc, car_type asc, car_id desc;
