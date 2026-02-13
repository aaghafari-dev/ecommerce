-- Sales by Month
{{ config(materialized='table') }}

select
  cal_year,
  cal_month,
  sum(sales_amount) as total_sales
from {{ ref('mart_sales') }}
group by cal_year, cal_month
order by cal_year, cal_month
