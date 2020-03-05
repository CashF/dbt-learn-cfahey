with stripe as (select * from {{ ref('stripe_orders') }})
select
    o.id as order_id,
    o.user_id as customer_id,
    o.order_date,
    o.status,
    stripe.amount
from raw.jaffle_shop.orders as o
left join stripe on stripe.order_id = o.id