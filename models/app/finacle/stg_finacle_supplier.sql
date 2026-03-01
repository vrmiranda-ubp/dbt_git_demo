{{ config
    (materialized='view'
        , snowflake_warehouse=env_var("DBT_WH_T1"))
}}

with 

source as (

    select * from {{ source('finacle', 'supplier') }}

),

renamed as (

    select
        s_suppkey,
        s_name,
        s_address,
        s_nationkey,
        s_phone,
        s_acctbal,
        s_comment

    from source

)

select * from renamed