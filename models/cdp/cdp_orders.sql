
{{ config
    (
        materialized='incremental'
        , snowflake_warehouse=env_var("DBT_WH_T1")
        , schema=env_var("DBT_CDP_SCHEMA")
        , pre_hook="
                        DELETE FROM {{ this }} 
                        WHERE O_ORDERDATE IN (
                                                SELECT business_date 
                                                FROM {{ ref ('cdp_calendar_table') }}
                                            )
                    "
    )
}}

with
source as (

select * from {{ ref ('stg_finacle_orders') }}

),

calendar as (

select * from {{ ref ('cdp_calendar_table') }}

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
    join calendar
    on O_ORDERDATE = business_date

)

select * from final