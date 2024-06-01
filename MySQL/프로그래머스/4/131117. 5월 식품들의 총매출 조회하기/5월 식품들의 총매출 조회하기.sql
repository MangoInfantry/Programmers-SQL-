with temp as (select *
              from food_order as od
              where produce_date like '2022-05%')
              
select p.product_id, product_name, sum(amount)*price as total_sales
from temp as t
join food_product as p
on t.product_id = p.product_id
group by product_name
order by total_sales desc, p.product_id asc