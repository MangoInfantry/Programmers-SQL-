# 출력: 0~25%를 critical, 26~50%를 high, 51~75를 medium, 76~100프로를 low라 하고, 대장균 id와 분류된 이름을 출력하는 sql 문

with cte as (
    select id, percent_rank() over (order by size_of_colony desc) as percent
    from ecoli_data
)

select id, 
       case when percent<=0.25 then 'CRITICAL'
            when percent<=0.5 then 'HIGH'
            when percent<=0.75 then 'MEDIUM'
            when percent<=1 then 'LOW' end as colony_name
from cte
order by id 

