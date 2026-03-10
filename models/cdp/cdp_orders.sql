
{{ config
    (materialized='table'
        , snowflake_warehouse=env_var("DBT_WH_T1")
        , schema=env_var("DBT_CDP_SCHEMA"))
}}

with
source as (

select * from {{ ref ('stg_finacle_orders') }}

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