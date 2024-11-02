-- 코드를 입력하세요
# 출력: el이 들어가는 개의 아이디와 이름을 조회하는 쿼리

select animal_id, name
from animal_ins
where name like '%el%' and animal_type='dog'
order by name