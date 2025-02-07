with
    address as (
        select *
        from {{ source('erp', 'address') }}
    )

    , renamed as (
        select
            cast(ADDRESSID as string) as pk_address_id
            , concat(cast(ADDRESSLINE1 as string), ' ', cast(coalesce(ADDRESSLINE2, '') as string)) as address_line
            , cast(STATEPROVINCEID as string) as fk_state_province_id
            , cast(ROWGUID as string) as row_guid
            , cast(CITY as string) as city
            , cast(POSTALCODE as string) as postal_code
            , cast(MODIFIEDDATE as date) as modified_date
        from
        address
    )

select * 
from renamed