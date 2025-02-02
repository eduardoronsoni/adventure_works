with
    countries as (
        select *
        from {{ source('erp', 'countryregion') }}
    )

    , renamed as (
        select 
            cast (COUNTRYREGIONCODE as string) as pk_country_id
            , cast (NAME as string) as country_name
            , cast (MODIFIEDDATE as date) as modified_date
        from countries
    )

select *
from renamed