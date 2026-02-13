-- Sales Trend
{{ config(materialized='table') }}

select
  calendar_date,
  sum(sales_amount) as daily_sales
from {{ ref('mart_sales') }}
group by calendar_date
order by calendar_date
