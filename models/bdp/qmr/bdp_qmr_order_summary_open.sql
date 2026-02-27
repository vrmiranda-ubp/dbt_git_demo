{{ config
    (materialized='table'
        , snowflake_warehouse=env_var("DBT_WH_T1"))
}}

with
source as (

select * from {{ ref ('cdp_order_summary') }}

),

final as (

    select *
    from source

)

select * from final