with customer as (
    select id as customer_id,
           first_name,
           last_name
    from {{source('dbt_foundation', 'jaffle_shop_customers')}}
)
Select * from customer