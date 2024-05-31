
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select listing_key, property_subtype 
    from 
    mls.property_master_data

)

select property_subtype, count(property_subtype) as total_count
from source_data
group by property_subtype
order by total_count desc

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
