with a as(
select ID,PERCENT_RANK() OVER (ORDER BY size_of_colony DESC) percent
from ecoli_data
)

select e.ID,
case
when percent <=0.25 then "CRITICAL"
when percent <=0.5 then "HIGH"
when percent <=0.75 then "MEDIUM"
else "LOW"
end as COLONY_NAME
from ecoli_data as e
join a on e.id=a.id
order by e.ID