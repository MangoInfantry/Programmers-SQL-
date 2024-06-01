-- 코드를 입력하세요
#'트럭'인 자동차의대여 기록에 대해서 대여 기록별로 대여 금액(컬럼명 FEE)를 구하여 대여 기록ID와 대여 금액 리스트를 출력하는 SQL문
#대여 금액을 기준으로 내림차순, 대여 금액이 같은 경우 대여 기록 ID를 기준으로 내림차순


WITH RENTAL_HISTORY AS (
    SELECT *
         , CASE
               WHEN DATEDIFF(END_DATE, START_DATE) + 1 < 7 THEN NULL
               WHEN DATEDIFF(END_DATE, START_DATE) + 1 < 30 THEN '7일 이상'
               WHEN DATEDIFF(END_DATE, START_DATE) + 1 < 90 THEN '30일 이상'
               ELSE '90일 이상'
           END AS DURATION_TYPE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
), TRUCKS AS (
    SELECT *
    FROM CAR_RENTAL_COMPANY_CAR
    WHERE CAR_TYPE = '트럭'
)

SELECT H.HISTORY_ID AS HISTORY_ID
     , ROUND(IF(P.DURATION_TYPE IS NULL,
                TR.DAILY_FEE * (DATEDIFF(H.END_DATE, H.START_DATE) + 1),
                TR.DAILY_FEE * (DATEDIFF(H.END_DATE, H.START_DATE) + 1) * (1 - P.DISCOUNT_RATE/100))) AS FEE
FROM TRUCKS AS TR
    INNER JOIN RENTAL_HISTORY AS H ON TR.CAR_ID = H.CAR_ID
    LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS P ON TR.CAR_TYPE = P.CAR_TYPE
                                                   AND H.DURATION_TYPE = P.DURATION_TYPE
GROUP BY HISTORY_ID
ORDER BY FEE DESC
       , HISTORY_ID DESC