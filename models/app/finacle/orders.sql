with

source as (

    select * from {{ source(env_var("DBT_FINACLE_SRC"), 'orders') }}

),

final as (
    select O_ORDERKEY
--        , O_CUSTKEY
--        , O_ORDERSTATUS
        , O_TOTALPRICE
--        , O_ORDERDATE
--        , O_ORDERPRIORITY
--        , O_CLERK
--        , O_SHIPPRIORITY
--        , O_COMMENT
    from source
)

select * from final