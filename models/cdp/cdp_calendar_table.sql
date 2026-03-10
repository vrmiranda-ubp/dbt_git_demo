{{ config
    (materialized='incremental'
        , snowflake_warehouse=env_var("DBT_WH_T1")
        , database=env_var("DBT_CDP_DB")
        , schema=env_var("DBT_CDP_SCHEMA"))        
}}

with 

source as (

    select * from {{ source('cdp', 'cdp_calendar_table') }}

),

renamed as (

    select
        business_date,
        processing_date,
        remarks

    from source

)

select * from renamed