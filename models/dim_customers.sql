with customer as (
    select id as customer_id,
           first_name,
           last_name
    from jaffle_shop_customers
),
     cutomer_order as(
         select
                id as order_id,
                user_id as customer_id,
                order_date,
                status
         from jaffle_shop_orders
     ),
     customer_order as (
         select
                customer_id,
                min(order_date) as first_order_date,
                max(order_date) as most_recent_order_date,
                count(order_id) as number_of_orders
         from cutomer_order
         group by 1
     ),
     final as (
         select
                c.customer_id,
                c.first_name,
                c.last_name,
                co.first_order_date,
                co.most_recent_order_date,
                co.number_of_orders
         from customer c
         inner join customer_order co using(customer_id)

     )
select * from final