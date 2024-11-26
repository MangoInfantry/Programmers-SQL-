-- 코드를 입력하세요
# 출력: USED_GOODS_BOARD와 USED_GOODS_USER 테이블에서 완료된 중고 거래 총금액이 70만원 이상인 사람의 회원 ID, 닉네임, 총거래금액을 조회
# 조건: 총거래금액을 기준으로 오름차순 정렬
# WRITER_ID, USER_ID로 두 테이블 조인하고 STATUS = DONE으로 설정한 뒤, WINDOW 함수를 이용하여 TOTAL_SALES를 계산

with cte as (
    select uu.user_id, nickname, price, sum(price) over (partition by uu.user_id) as total_sales
    from used_goods_board as ub
    join used_goods_user as uu
    on ub.writer_id = uu.user_id
    where status = 'DONE'
)

select distinct user_id, nickname, total_sales
from cte 
where total_sales >=700000
order by total_sales asc