-- 코드를 입력하세요
# 출력: user_info 테이블과 online_sale 테이블에서 년, 월, 성별 별로 상품을 구매한 회원 수를 집계하는 sql문
# 년,월,성별 기준으로 오름차순 정렬

select year(sales_date) as year, month(sales_date) as month, gender, count(distinct u.user_id) as users
from user_info as u
join online_sale as o 
on u.user_id = o.user_id 
where gender is not null
group by year, month, gender
order by year, month, gender
