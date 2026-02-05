{{ config(materialized='table') }}

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