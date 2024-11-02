-- 코드를 입력하세요
# 출력: Lucy, Ella, Pickle, Rogan, Sabina, Mitty인 동물의 아이디와 이름, 성별 및 중성화 여부를 조회하는 쿼리

select animal_id, name, sex_upon_intake
from animal_ins
where name in ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
