{{ config(alias='dim_product',materialized='table', tags=['star_schema']) }}

select distinct
    product_id,
    product_name,
    category,
    price
from PREP.OLTP.STG_PRODUCT