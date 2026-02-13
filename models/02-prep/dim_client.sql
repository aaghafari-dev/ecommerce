{{ 
    config(
        materialized='table',
        tags=['star_schema']
    ) 
}}

select
    client_id,

    -- anonymized fields
    {{ data_anonymization('client_name') }}   as client_name_hash,
    {{ data_anonymization('email') }}         as email_hash,
    {{ data_anonymization('phone_number') }}  as phone_hash,
    {{ data_anonymization('address') }}       as address_hash,

    type_id,
    status_id,
    registration_date

from {{ ref('stg_client') }}
