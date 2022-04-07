with order_detail as (
    select so.order_id as order_id,
           so.customer_id as customer_id,
           sp.amount as amount
    from {{ref('stg_orders')}} as so
    inner join {{ref('stg_customers')}} as sc on so.customer_id = sc.customer_id
    inner join {{ref('stg_payments')}} as sp on so.order_id = sp.order_id
)
select order_id, customer_id, amount from order_detail