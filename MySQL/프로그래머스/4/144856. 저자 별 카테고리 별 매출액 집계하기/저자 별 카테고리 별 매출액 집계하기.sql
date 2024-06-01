-- 코드를 입력하세요
with book_author as (SELECT b.book_id, category, a.author_id, author_name, price, published_date , sales_date, sales
                     from book as b
                     left join author as a
                     on b.author_id = a.author_id
                    join book_sales as bs
                    on b.book_id = bs.book_id
                    where month(sales_date)='01')

select author_id, author_name, category, sum(sales*price) as total_sales
from book_author as bau
group by author_id, category
order by author_id asc, category desc