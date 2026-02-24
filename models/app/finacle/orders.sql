{{ config
    (materialized='incremental'
        , snowflake_warehouse=env_var("DBT_WH_T1")
        , unique_key = 'o_orderkey'
        , incremental_strategy = 'merge') 
}}

with
source as (

    select * from {{ source('finacle', 'orders') }}

),

final as (
    select O_ORDERKEY
        , O_CUSTKEY
        , O_ORDERSTATUS
        , O_TOTALPRICE
        , O_ORDERDATE
        , O_ORDERPRIORITY
        , O_CLERK
        , O_SHIPPRIORITY
        , O_COMMENT
    from source
)

select * from final