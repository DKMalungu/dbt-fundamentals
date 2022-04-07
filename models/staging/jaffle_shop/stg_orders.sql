with cutomer_order as(
         select
                id as order_id,
                user_id as customer_id,
                order_date,
                status
         from {{source('jaffle_shop', 'jaffle_shop_orders')}}
select * from cutomer_order