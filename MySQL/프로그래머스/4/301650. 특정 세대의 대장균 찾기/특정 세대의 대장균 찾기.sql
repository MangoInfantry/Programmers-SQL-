-- 코드를 작성해주세요
# 출력: 3세대의 대장균의 id를 출력
# self join을 한다. 
# parent_id가 id가 같은 경우를 조인한다.
# id만 출력한다. 

with cte as (
    select a.id
    from ecoli_data as a
    join ecoli_data as b
    on a.parent_id = b.id
    where b.parent_id is null
)

select id
from ecoli_data 
where parent_id in (select id from cte)
