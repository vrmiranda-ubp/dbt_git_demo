{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if target.name == 'dev' -%}

        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- else -%}

        {{ env_var('DBT_FINACLE_SRC') }}
        
    {%- endif -%}

{%- endmacro -%}