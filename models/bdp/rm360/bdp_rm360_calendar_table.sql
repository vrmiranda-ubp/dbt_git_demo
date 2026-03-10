{{ config
    (materialized='incremental'
        , snowflake_warehouse=env_var("DBT_WH_T1")
        , schema=env_var("DBT_RM360_SCHEMA"))        
}}

with 

source as (

    select * from {{ source('rm360', 'bdp_rm360_calendar_table') }}

),

renamed as (

    select *

    from source

)

select * from renamed