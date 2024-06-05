WITH temp AS (
    SELECT writer_id
    FROM used_goods_board
    GROUP BY writer_id
    HAVING COUNT(*) >= 3
)

SELECT u.user_id, u.nickname, CONCAT(u.city, ' ', u.street_address1, ' ', u.street_address2) AS '전체주소', concat(substring(tlno,1,3),'-',substring(tlno,4,4),'-',substring(tlno,8,4)) as '전화번호'
FROM used_goods_user u
JOIN temp t ON u.user_id = t.writer_id
order by user_id desc
