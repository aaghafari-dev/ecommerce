{{ config(materialized='table') }}

select
    f.order_product_id,
    f.order_id,
    f.client_id,

    
    f.sales_amount,
    f.quantity,

    t.calendar_date,
    t.cal_month,
    t.cal_year,

    p.product_name,
    p.category,

    pm.payment_method

from {{ ref('fct_orders') }} f
join {{ ref('dim_time') }} t
  on f.date_id = t.date_id
join {{ ref('dim_product') }} p
  on f.product_id = p.product_id
join {{ ref('dim_payment_method') }} pm
  on f.payment_id = pm.payment_id
