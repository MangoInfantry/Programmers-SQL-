WITH temp AS (
    SELECT distinct(user_id)
    FROM user_info
    WHERE YEAR(joined) = 2021
)

SELECT 
    YEAR(o.sales_date) AS year, 
    MONTH(o.sales_date) AS month,
    COUNT(distinct(o.user_id)) AS PUCHASED_USERS,
    round(COUNT(distinct(o.user_id)) / (SELECT COUNT(distinct(user_id)) FROM temp),1) AS PUCHASED_RATIO
FROM 
    online_sale AS o
WHERE 
    user_id IN (SELECT (user_id) FROM temp)
GROUP BY 
    YEAR(o.sales_date), 
    MONTH(o.sales_date)

ORDER BY year ASC, month ASC