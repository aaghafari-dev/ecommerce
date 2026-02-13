{{ config(alias='dim_payment_method', materialized='table', tags=['star_schema']) }}

select distinct
    payment_id,
    payment_method
from PREP.OLTP.STG_PAYMENT_METHOD