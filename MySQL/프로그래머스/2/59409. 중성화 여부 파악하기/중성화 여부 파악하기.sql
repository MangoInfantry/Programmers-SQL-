-- 코드를 입력하세요
# 출력: 동물 아이디와 이름, 중성화 여부를 아이디 순으로 조회하는 sql문
# 조건: 중성 -> Neutered, Spayed가 들어있음
# case when 구문을 이용해서 조건만 주면 될듯

SELECT ANIMAL_ID, NAME,
              CASE WHEN (LOWER(SEX_UPON_INTAKE) LIKE LOWER('%Neutered%') OR LOWER(SEX_UPON_INTAKE) LIKE LOWER('%Spayed%')) THEN 'O'
                         ELSE 'X'
              END AS 중성화
FROM ANIMAL_INS ORDER BY ANIMAL_ID;
