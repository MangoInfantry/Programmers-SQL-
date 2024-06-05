-- 코드를 작성해주세요
SELECT i.item_id, item_name 
from item_info as i
join item_tree as t
on i.item_id = t.item_id
where parent_item_id is null;