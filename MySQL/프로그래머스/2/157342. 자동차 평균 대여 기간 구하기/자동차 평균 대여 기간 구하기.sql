-- 코드를 입력하세요
# 출력: 평균 대여 기간이 7일 이상인 자동차들의 자동차 id, 평균 대여기간
# 조건: 평균 대여 기간은 소수점 두번째 자리에서 반올림, 결과는 평균 대여 기간을 기준으로 내림차순, 대여기간 같으면 자동차 id 기준 내림차순
# cte를 통해 start_date와 end_date의 차이를 구하고 + 1함
# cte문 밖에서 where절을 이용해 7일 이상인 경우만 필터링

with cte as (
    select car_id, round(avg(datediff(end_date, start_date)+1),1) as average_duration 
    from car_rental_company_rental_history
    group by car_id
)

select car_id, average_duration
from cte
where average_duration >= 7
order by average_duration desc, car_id desc