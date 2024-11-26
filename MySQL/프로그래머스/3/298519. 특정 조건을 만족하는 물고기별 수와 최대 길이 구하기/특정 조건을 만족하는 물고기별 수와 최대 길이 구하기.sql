# 출력: fish_info에서 평균 길이가 33cm 이상인 물고기들을 분류하여 잡은 수, 최대 길이, 물고기 종류를 출력
# 조건: 물고기 종류에 대해 오름차순, 10cm 이하 물고기들은 10cm으로 취급하여 평균 길이 구하기

with cte as (
    select id, fish_type, coalesce(length, 10) as length
    from fish_info
), cte2 as (
    select fish_type, avg(length) as avg_length 
    from cte
    group by fish_type
    having avg_length >= 33
)
select count(id) as fish_count, max(length) as max_length, fish_type
from cte
where fish_type in (
    select fish_type
    from cte2)
group by fish_type
order by fish_type 

  
