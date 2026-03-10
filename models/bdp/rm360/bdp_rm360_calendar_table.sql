{{ config
    (materialized='view'
        , snowflake_warehouse=env_var("DBT_WH_T1")
        , schema=env_var("DBT_RM360_SCHEMA"))        
}}

with 

source as (

    select * from {{ source('rm360', 'rm360_calendar_table') }}

),

renamed as (

    select business_date
        , processing_date
        , remarks
    from source

)

select * from renamed