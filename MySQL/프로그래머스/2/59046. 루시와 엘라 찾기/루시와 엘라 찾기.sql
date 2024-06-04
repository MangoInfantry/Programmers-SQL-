-- 코드를 입력하세요
SELECT animal_id, name, sex_upon_intake
from animal_ins as ins
where name in ('Lucy','Ella','Pickle','Rogan','Sabrina','Mitty') and sex_upon_intake = 'Spayed Female'
order by animal_id