with
    state_provinces as (
        select *
        from {{ source('erp', 'stateprovince') }}
    )

    , renamed as (
        select
            cast(STATEPROVINCEID as string) as pk_state_province_id
            , cast(COUNTRYREGIONCODE as string) as fk_country_id
            , cast(TERRITORYID as string) as fk_territory_id
            , cast(ROWGUID as string) as row_guid
            , cast(STATEPROVINCECODE as string) as state_province_code
            , cast(ISONLYSTATEPROVINCEFLAG as string) as flag_is_only_state
            , cast(NAME as string) as state_province_name
            , cast(MODIFIEDDATE as date) as modified_date
        from state_provinces
    )

    select * 
    from renamed

    