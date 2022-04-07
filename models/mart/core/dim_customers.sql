with customer as (
    select *
    from {{ref('stg_customers')}}
),
     cutomer_order as(
         select *
         from {{ref('stg_orders')}}
     ),
     payment_details as(
         select order_id,
                sum(amount) as lifetime_value
         from {{ref('stg_payments')}}
         group by 1
     )
     ,
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
                co.number_of_orders,
                sd.lifetime_value
         from customer c
         inner join customer_order co using(customer_id)
         inner join payment_details pd on pd.order_id = co.order_id

     )
select * from final