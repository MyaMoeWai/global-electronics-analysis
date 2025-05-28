select physicalsale.store_id, store.square_meters, sum(physicalsale.quantity)  from physicalsale
join store on store.store_id= physicalsale.store_id
group by physicalsale.store_id
order by store.square_meters;

select physicalsale.order_date as order_date, physicalsale.quantity*product.unit_price_USD as total_amount
from physicalsale
join product on product.product_id = physicalsale.product_id;

select onlinesale.order_date as order_date, onlinesale.quantity*product.unit_price_USD as total_amount
from onlinesale
join product on product.product_id = onlinesale.product_id;

select *
from physicalsale
join product on product.product_id = physicalsale.product_id;

select onlinesale.order_date as order_date, category.category_name as category, onlinesale.quantity*product.unit_price_USD as total_amount
from onlinesale
join product on product.product_id = onlinesale.product_id
join category on category.category_id = product.category_id;

select physicalsale.order_date as order_date, category.category_name as category, physicalsale.quantity*product.unit_price_USD as total_amount
from physicalsale
join product on product.product_id = physicalsale.product_id
join category on category.category_id = product.category_id
