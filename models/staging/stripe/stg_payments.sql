select
      id as payment_id,
       orderid as order_id,
       paymentmethod as payment_method,
       status,
       amount,
       created
from {{source('jaffle_stripe','stripe_payments')}}