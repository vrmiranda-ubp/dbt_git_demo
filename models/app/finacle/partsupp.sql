{{ config
    (
        materialized='table'
        , snowflake_warehouse=env_var("DBT_WH_T1")
    ) 
}}

with 
with 

source as (

    select * from {{ source('finacle', 'partsupp') }}

),

renamed as (

    select
        ps_partkey,
        ps_suppkey,
        ps_availqty,
        ps_supplycost,
        ps_comment

    from source

)

select * from renamed