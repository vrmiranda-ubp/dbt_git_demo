{{ config
    (materialized='incremental'
        , snowflake_warehouse=env_var("DBT_WH_T1")
        , schema=env_var("DBT_RM360_SCHEMA"))        
}}

with
source as (

select * from {{ ref ('cdp_order_summary') }}

),

calendar as (

select * from {{ ref ('dbp_rm360_calendar_table') }}

),
final as (

    select o_custkey, o_orderstatus, o_totalprice
    from source
    join calendar
    on o_orderdate = business_date

)

select * from final