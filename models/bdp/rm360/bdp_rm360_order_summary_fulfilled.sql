{{ config
    (materialized='table'
        , snowflake_warehouse=env_var("DBT_WH_T1")
        , schema=env_var("DBT_CDP_SCHEMA"))
}}

with
source as (

select * from {{ ref ('cdp_order_summary') }}

),

final as (

    select o_custkey, o_orderstatus, o_totalprice
    from source
    where o_orderstatus = 'F'

)

select * from final