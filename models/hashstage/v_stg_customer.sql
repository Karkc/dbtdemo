{{ config(materialized='table') }}

{%- set yaml_metadata -%}
source_model: "customer"
derived_columns:
    RECORD_SOURCE: "!TPCH"
    LOAD_DATE: "!12-May-2023"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=source_model,
                     derived_columns=derived_columns,
                     hashed_columns=hashed_columns) }}

