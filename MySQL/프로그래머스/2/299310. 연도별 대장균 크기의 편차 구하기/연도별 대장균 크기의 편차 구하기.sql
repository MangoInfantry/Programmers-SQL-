-- 코드를 작성해주세요
with temp as (select year(DIFFERENTIATION_DATE) as year, max(size_of_colony) as year_max
              from ecoli_data
              group by year(DIFFERENTIATION_DATE))


select year(DIFFERENTIATION_DATE) as year, (te.year_max - ec.size_of_colony) as year_dev, id
from ecoli_data as ec
left join temp as te
on year(ec.DIFFERENTIATION_DATE) = te.year
order by year asc, year_dev asc