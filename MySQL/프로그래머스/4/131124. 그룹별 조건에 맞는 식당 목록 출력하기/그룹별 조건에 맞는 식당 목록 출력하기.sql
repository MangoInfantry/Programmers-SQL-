# 출력 : member_profile과 rest_review 테이블에서 리뷰를 가장 많이 작성한 회원들의 리뷰를 조회하는 sql 쿼리
# 조건: 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력되어야 함
# 리뷰 작성일 오름차순, 리뷰 텍스트 기준 오름차순
# 두 테이블을 member_id를 기준으로 조인하고, window 함수를 이용해서 리뷰 랭킹을 알 수 있는 열을 생성한 cte 생성

with cte as (
    select p.member_id,
           member_name,
           review_text,
           review_date,
           count(review_id) as cnt
    from member_profile as p
    join rest_review as r
    on p.member_id = r.member_id
    group by member_name
), cte2 as (
    select *
    from cte
    where cnt in (select max(cnt)
                         from cte) 
)

select p.member_name, review_text, date_format(review_date, '%Y-%m-%d') as review_date
from member_profile as p
join rest_review as r
on p.member_id = r.member_id
where p.member_id in (select member_id
                      from cte2)
order by review_date, review_text
