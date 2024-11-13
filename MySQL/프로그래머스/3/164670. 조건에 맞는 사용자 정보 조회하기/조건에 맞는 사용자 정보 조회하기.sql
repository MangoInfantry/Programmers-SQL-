# 중고 거래 게시물 3건 이상 등록한 사용자의 사용자 id, 닉네임, 전체주소, 전화번호를 조회하는 sql 쿼리

with cte as (
    select user_id, nickname, city, street_address1, street_address2, tlno, count(user_id) as cnt
    from used_goods_board as ub
    join used_goods_user as us
    on ub.writer_id = us.user_id
    group by user_id
), cte2 as (
    select user_id, 
           nickname,
           concat(city,' ',street_address1,' ',street_address2) as '전체주소',
           concat(left(tlno,3),'-',substring(tlno,4,4),'-',substring(tlno,8,4)) as '전화번호'
    from cte
    where cnt >=3
    order by user_id desc
)

select user_id, nickname, 전체주소, 전화번호
from cte2
order by user_id desc
