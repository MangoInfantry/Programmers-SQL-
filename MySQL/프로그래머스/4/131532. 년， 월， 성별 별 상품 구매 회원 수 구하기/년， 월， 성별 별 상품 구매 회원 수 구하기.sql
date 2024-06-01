-- 코드를 입력하세요
SELECT year(sales_date) as year, month(sales_date) as month, gender, count(distinct u.user_id) as users
from user_info as u
join online_sale as os
on u.user_id = os.user_id
where gender is not null
group by year(sales_date), month(sales_date), gender
order by year asc, month asc, gender asc