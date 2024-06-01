with y as (select cart_id
           from cart_products
           where name ='Yogurt')

select cart_id
from cart_products
where cart_id in (select cart_id
                 from y) and name = 'Milk'
group by cart_id