{{ config(materialized='table') }}

with source_data as (

    select property_subtype, total_count as max_count
    from {{ ref ('property_model')}}
    where total_count = (select max(total_count)from {{ ref ('property_model')}})

)


select * from source_data