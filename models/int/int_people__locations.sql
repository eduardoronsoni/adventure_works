with
    address as (
        select *
        from {{ ref('stg_erp__address') }}
    )

    , state_provinces as (
        select *
        from {{ ref('stg_erp__state_provinces') }}
    )

    , countries as (
        select *
        from {{ ref('stg_erp__countries') }}
    )

     , enrich_address as (
        select 
            address.pk_address_id
            , address.address_line
            , address.city
            , state_provinces.state_province_name
            , countries.country_name
        from address
        left join state_provinces on address.fk_state_province_id = state_provinces.pk_state_province_id
        left join countries on state_provinces.fk_country_id = countries.pk_country_id
     )

select *
from enrich_address